import 'package:flutter/material.dart';
import '../models/user.dart';

enum AuthState { initial, loading, authenticated, unauthenticated, error }

class AuthController extends ChangeNotifier {
  AuthState _state = AuthState.initial;
  User? _currentUser;
  String _errorMessage = '';

  AuthState get state => _state;
  User? get currentUser => _currentUser;
  String get errorMessage => _errorMessage;

  bool get isAuthenticated => _state == AuthState.authenticated;
  bool get isLoading => _state == AuthState.loading;

  Future<bool> signIn(String email, String password) async {
    _setState(AuthState.loading);
    
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Basic validation
      if (email.isEmpty || password.isEmpty) {
        _setError('Email and password are required');
        return false;
      }
      
      if (!_isValidEmail(email)) {
        _setError('Please enter a valid email address');
        return false;
      }
      
      if (password.length < 6) {
        _setError('Password must be at least 6 characters');
        return false;
      }
      
      // Simulate successful login
      _currentUser = User(
        id: '1',
        email: email,
        name: email.split('@')[0],
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );
      
      _setState(AuthState.authenticated);
      return true;
      
    } catch (e) {
      _setError('Login failed. Please try again.');
      return false;
    }
  }

  Future<bool> signUp(String email, String password, String confirmPassword) async {
    _setState(AuthState.loading);
    
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Validation
      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        _setError('All fields are required');
        return false;
      }
      
      if (!_isValidEmail(email)) {
        _setError('Please enter a valid email address');
        return false;
      }
      
      if (password.length < 6) {
        _setError('Password must be at least 6 characters');
        return false;
      }
      
      if (password != confirmPassword) {
        _setError('Passwords do not match');
        return false;
      }
      
      // Simulate successful registration
      _currentUser = User(
        id: '1',
        email: email,
        name: email.split('@')[0],
        createdAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
      );
      
      _setState(AuthState.authenticated);
      return true;
      
    } catch (e) {
      _setError('Registration failed. Please try again.');
      return false;
    }
  }

  void signOut() {
    _currentUser = null;
    _setState(AuthState.unauthenticated);
  }

  void clearError() {
    _errorMessage = '';
    if (_state == AuthState.error) {
      _setState(AuthState.unauthenticated);
    }
  }

  void _setState(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _setState(AuthState.error);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Check if user has completed onboarding
  bool hasCompletedOnboarding() {
    // This could be stored in shared preferences
    return false; // For now, always show welcome screen
  }
  
  void completeOnboarding() {
    // Save onboarding completion status
    notifyListeners();
  }
}