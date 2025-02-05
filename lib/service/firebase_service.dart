
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future addGrant(Map<String, dynamic> firebaseFirestore, String id) async {
    return await FirebaseFirestore.instance
        .collection("Grant")
        .doc(id)
        .set(firebaseFirestore);
  }


Stream<List<Map<String, dynamic>>> getGrantStream() {
    return firebaseFirestore.collection("Grant").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final grant = doc.data();
        return grant;
      }).toList();
    });
  }


  // Future<Stream<QuerySnapshot>> getGrant()async{
  //   return await FirebaseFirestore.instance.collection("Grant").snapshots();
  // }
}


class GetService {
  //get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Stream<List<Map<String, dynamic>>> getGrantStream() {
    return _firestore.collection("Grant").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final grant = doc.data();
        return grant;
      }).toList();
    });
  }
}
