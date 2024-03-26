import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'missing-password':
        return 'Password is missing';
      case 'invalid-credential':
        return 'Wrong password';
      case 'invalid-email':
        return 'Email is not correct';
      default:
        return errorCode;
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _getErrorMessage(e.code);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

