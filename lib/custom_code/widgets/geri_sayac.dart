// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class GeriSayac extends StatefulWidget {
  const GeriSayac({
    super.key,
    this.width,
    this.height,
    required this.gameTime,
    required this.sonHamle,
    required this.document,
    required this.playerTurn,
  });

  final double? width;
  final double? height;
  final int gameTime;
  final int sonHamle;
  final DocumentReference document;
  final int playerTurn;

  @override
  State<GeriSayac> createState() => _GeriSayacState();
}

class _GeriSayacState extends State<GeriSayac> with TickerProviderStateMixin {
  late AnimationController _controller;
  int _remainingSeconds = 0;
  DateTime? _endTime;
  bool _timerEnded = false;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(GeriSayac oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gameTime != widget.gameTime ||
        oldWidget.sonHamle != widget.sonHamle) {
      _controller.dispose();
      _initializeTimer();
    }
  }

  void _initializeTimer() {
    // Convert gameTime to duration in seconds
    int durationInSeconds;
    switch (widget.gameTime) {
      case 2:
        durationInSeconds = 2 * 60; // 2 minutes
        break;
      case 5:
        durationInSeconds = 5 * 60; // 5 minutes
        break;
      case 12:
        durationInSeconds = 12 * 60 * 60; // 12 hours
        break;
      case 24:
        durationInSeconds = 24 * 60 * 60; // 24 hours
        break;
      default:
        durationInSeconds =
            widget.gameTime * 60; // Default: gameTime in minutes
    }

    // Calculate end time based on sonHamle (last move timestamp)
    final lastMoveTime =
        DateTime.fromMillisecondsSinceEpoch(widget.sonHamle * 1000);
    _endTime = lastMoveTime.add(Duration(seconds: durationInSeconds));

    // Calculate initial remaining time
    final now = DateTime.now();
    if (_endTime!.isAfter(now)) {
      _remainingSeconds = _endTime!.difference(now).inSeconds;
    } else {
      _remainingSeconds = 0;
    }

    // Use AnimationController for periodic updates
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controller.addListener(() {
      if (_controller.isCompleted) {
        _updateRemainingTime();
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.forward();
  }

  void _updateRemainingTime() {
    if (_endTime == null) return;

    final now = DateTime.now();
    if (_endTime!.isAfter(now)) {
      setState(() {
        _remainingSeconds = _endTime!.difference(now).inSeconds;
      });
    } else {
      setState(() {
        _remainingSeconds = 0;
      });
      _controller.stop();

      // Check if timer just ended to prevent multiple updates
      if (!_timerEnded) {
        _timerEnded = true;
        _updateGameStatus();
        _updateCurrentPlayerStatus();
      }
    }
  }

  void _updateGameStatus() {
    try {
      // Update gameStatus based on playerTurn
      int newGameStatus = widget.playerTurn == 1 ? 2 : 1;
      widget.document.update({'gameStatus': newGameStatus});
    } catch (e) {
      print('Error updating game status: $e');
    }
  }

  void _updateCurrentPlayerStatus() {
    try {
      // Update gameStatus based on playerTurn
      int newCurrentPlayerStatus = 0;
      widget.document.update({'currentPlayerTurn': newCurrentPlayerStatus});
    } catch (e) {
      print('Error updating current player status: $e');
    }
  }

  String _formatTime(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.timer,
              color: _remainingSeconds > 30
                  ? FlutterFlowTheme.of(context).primary
                  : Colors.red,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              _formatTime(_remainingSeconds),
              style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: _remainingSeconds > 30
                        ? FlutterFlowTheme.of(context).primaryText
                        : Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
