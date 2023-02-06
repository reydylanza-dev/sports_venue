import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spod_app/model/field_order.dart';
import '../model/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Order');

class FirebaseCrud {
  // static Future<Response> deleteOrder({
  //   required String docId,
  // }) async {
  //   Response response = Response();
  //   DocumentReference documentReferencer = _Collection.doc(docId);

  //   await documentReferencer.delete().whenComplete(() {
  //     response.code = 200;
  //     response.message = "Sucessfully Deleted Order";
  //   }).catchError((e) {
  //     response.code = 500;
  //     response.message = e;
  //   });

  //   return response;
  // }

  static Stream<QuerySnapshot> readOrder() {
    CollectionReference notesItemCollection = _Collection;

    return notesItemCollection.snapshots();
  }

  static Future<Response> addOrder(
      {required String name,
      required String selectedDate,
      required String user,
      required List<String> selectedTime,
      required String paidStatus,
      required int total,
      required String image}) async {
    Response response = Response();
    DocumentReference documentReferencer = _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "venue_name": name,
      "date": selectedDate,
      "user_name": user,
      "time": selectedTime,
      "paidStatus": paidStatus,
      "total": total,
      "image": image
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Sucessfully added to the database";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
