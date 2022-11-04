import 'package:eventzu/screens/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/profileinputpage.dart';

class FirebaseMethods {
  final FirebaseAuth _auth;
  FirebaseMethods(this._auth);
  dynamic userlogined = '';
  bool googlelogin = false;
  Future<dynamic> googleLogin(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn(
        signInOption: SignInOption.standard,
        scopes: ['email'],
      ).signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;
      if (googleauth?.accessToken != null && googleauth?.idToken != null) {
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken,
          idToken: googleauth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credentials);
        print('inside googlesigin');
        if (userCredential.user != null) {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final User? user = auth.currentUser;
          userlogined = user!.uid;
          googlelogin = true;
        }
        if (userCredential.additionalUserInfo!.isNewUser) {
          final FirebaseAuth auth = FirebaseAuth.instance;
          final User? user = auth.currentUser;
          userlogined = user!.uid;
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      userlogined = null;
    }
    return userlogined;
  }

  Future googlestatus(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleauth =
          await googleuser?.authentication;
      if (googleauth?.accessToken != null && googleauth?.idToken != null) {
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleauth?.accessToken,
          idToken: googleauth?.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credentials);
        print('inside googlesigin');
        if (userCredential.user != null) {
          googlelogin = true;
        }
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      googlelogin = false;
    }
    return googlelogin;
  }

  Future googleSingout() async {
    print('inside');
    try {
      await GoogleSignIn().signOut();
      print('hiiiiii------>');
      return 'true';
    } catch (e) {
      return e.toString();
    }
  }

  Future Singout() async {
    print('inside');
    print("googlelogin====>$googlelogin");
    try {
      await _auth.signOut();
      print('hiiiiii------>');
      return 'true';
    } catch (e) {
      return e.toString();
    }
  }

  Future Emailverification() async {
    bool isverified = _auth.currentUser!.emailVerified;
    if (!isverified) {
      try {
        final user = _auth.currentUser!;
        await user.sendEmailVerification();
      } catch (e) {
        return e.toString();
      }
    }
  }

  Future checkverification() async {
    await _auth.currentUser!.reload();
    bool verification = _auth.currentUser!.emailVerified;
    return verification;
  }

  Future<String> Siginwithemail(
      BuildContext context, String email, String Password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: Password);

      User? user = result.user;
      if (user == null) {
        return 'Invalid User!!';
      } else {
        return 'true';
      }
    } catch (e) {
      String error;
      print(e);
      if (e ==
          'The password is invalid or the user does not have a password.') {
        error = "Invalid Password";
      } else if (e ==
          ' We have blocked all requests from this device due to unusual activity. Try again later.') {
        error = 'You have been blocked Reset Password';
      } else {
        error = "Invalid E-mail or Password";
      }
      return error;
    }
  }
}
