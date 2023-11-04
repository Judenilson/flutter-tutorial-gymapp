import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatingService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerUser({
    required String name,
    required String password,
    required String email,
  }) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await userCredential.user!.updateDisplayName(name);
  }
}