# Multiplayer Word Mine Game

A real-time multiplayer mobile word game developed using Flutter and Firebase.

This project was developed as part of the Software Laboratory II course.

## Project Overview

Kelime Mayınları is a two-player, competitive word-based mobile game built on a client-server architecture.

Players are randomly matched and compete on a 15x15 dynamic letter board.  
The game includes hidden mines and rewards that directly affect gameplay and scoring.

The system supports multiple concurrent games and real-time synchronization.

## Technologies Used

Mobile:
- Flutter
- Dart

Backend:
- Firebase Authentication
- Cloud Firestore
- REST API architecture

Game Logic:
- 15x15 dynamic letter matrix
- Random matchmaking system
- Time-based turn management
- Word validation using Turkish dictionary dataset
- Hidden penalty and reward system

## Core Features

### Authentication System

- User registration with email and password
- Secure login
- Firebase-based authentication management

### Matchmaking

- Players select game duration:
  - 2 or 5 minutes (Quick Mode)
  - 12 or 24 hours (Extended Mode)
- Players with the same duration preference are randomly matched.

### Game Board

- 15x15 letter matrix
- Each player starts with 7 letters
- Letter scores are frequency-based
- Special multiplier cells available

### Mines (Penalties)

Hidden cells can cause:

- Score reduction (30%)
- Score transfer to opponent
- Letter loss
- Turn block
- Word cancellation

### Rewards

Hidden bonuses include:

- Area restriction for opponent
- Letter freeze
- Extra turn

### Game Rules

- Words must connect to existing letters.
- Words must exist in the Turkish word list.
- Players can pass or surrender.
- Game ends when letters are exhausted or time expires.

### End Conditions

- Score comparison after letter depletion
- Automatic loss on surrender
- Timeout loss
- Two consecutive passes end the game

## Architecture

The system follows a client-server model:

- Flutter client communicates with Firebase.
- All game data is centrally stored in Firestore.
- Real-time updates ensure synchronized gameplay.

## Academic Contribution

This project demonstrates:

- Multiplayer game logic design
- Real-time database synchronization
- Firebase data modeling
- Mobile UI/UX development
- Client-server architecture implementation
- Turn-based game mechanics
- Strategic penalty and reward system

## Author

Cihangir Emre  
Computer Engineering Student  
Kocaeli University
