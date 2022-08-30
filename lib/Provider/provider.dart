import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final databaseProvider = Provider<DatabaseService?>((ref) {
  final auth = ref.watch(authStateChangeProvider);
  String? uid = auth.asData?.value?.uid;
  if (uid != null) {
    return DatabaseService(uid: uid);
  }
  return null;
});
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangeProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});