import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterproveder/model/user.dart';
import 'package:flutterproveder/notifier/auth_notifier.dart';

login(User user, AuthNotifier authNotifier) async {
  AuthResult authresult = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user.email, password: user.password)
      .catchError((onError) {
    print(onError);
  });

  if (authresult != null) {
    FirebaseUser firebaseUser = authresult.user;

    if (firebaseUser != null) {
      authNotifier.setUser(firebaseUser);
    }
  }
}

signup(User user, AuthNotifier authNotifier) async {
  AuthResult authresult = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
          email: user.email, password: user.password)
      .catchError((onError) {
    print(onError);
  });

  if (authresult != null) {
    UserUpdateInfo userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = user.displayName;
    FirebaseUser firebaseUser = authresult.user;

    if (firebaseUser != null) {
      await firebaseUser.updateProfile(userUpdateInfo);
      await firebaseUser.reload();

      FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
      authNotifier.setUser(currentUser);
    }
  }
}

signout(AuthNotifier authNotifier) async {
  await FirebaseAuth.instance.signOut().catchError((onError) => print(onError));
  authNotifier.setUser(null);
}

initializeCurrentUser(AuthNotifier authNotifier) async {
  FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();

  if (firebaseUser != null) {
    print(firebaseUser);
    authNotifier.setUser(firebaseUser);
  }
}
