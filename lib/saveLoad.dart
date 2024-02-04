import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uxexplore/challengeModel.dart';
import 'package:uxexplore/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uxexplore/challengeModel.dart';

class saveLoad {
  Future<void> generalSave(
      String collection, String document, Map<String, dynamic> data) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot ref = await firestore.collection(collection).get();
    DocumentReference newRef = firestore.collection(collection).doc(document);
    await newRef.set(data);
  }

  Future<Map<String, dynamic>?> generalLoad(
      String collection, String document, String identifier) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference newRef = firestore.collection(collection).doc(document);
    DocumentSnapshot snapshot = await newRef.get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

      print(data.toString());
      newRef.set(data);
      return data;
    }

    // Return null if the document does not exist
    return null;
  }}
//
//   Future<List<challengeModel>> loadGameData(
//       String collection, String document, String id) async {
//     List<challengeModel> result = [];
//     try {
//       int temp = 0;
//       if(collection == 'games'){
//       }
//
//       // Access the Firestore instance
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//       // Reference to a collection
//       CollectionReference col = firestore.collection(collection);
//
//       // Get documents from the collection
//       QuerySnapshot querySnapshot = await col.get();
//
//       if (document == null) {
//         for (QueryDocumentSnapshot doc in querySnapshot.docs) {
//           if (doc.get('id') == id) {
//             result.add(returnState(doc['state']));
//           }
//         }
//       } else if (int == null) {
//         for (QueryDocumentSnapshot doc in querySnapshot.docs) {
//           if (doc.reference.id == document)
//             result.add(returnState(doc['state']));
//           ;
//         }
//       } else if (document != null && int != null) {
//         for (QueryDocumentSnapshot doc in querySnapshot.docs) {
//           if (doc.reference.id == document && doc.get('id') == id)
//             result.add(returnState(doc['state']));
//         }
//       }
//       return result;
//     } catch (e) {
//       return [];
//     }
//   }
// }
//
// challengeModel returnState(String state) {
//   List<String> params = state.split('%');
//   challengeModel result = challengeModel(
//       gameid: params[0],
//       challenger: params[1],
//       challenged: params[2].split(','),
//       secretWord: params[3],
//       length: int.parse(params[4]),
//       guesses: int.parse(params[5]),
//       status: params[6],
//       date: params[7],
//       state: state);
//   return result;
// }
