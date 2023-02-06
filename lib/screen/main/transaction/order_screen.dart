import 'package:flutter/material.dart';
import 'package:spod_app/model/field_order.dart';
import 'package:spod_app/theme.dart';
import 'package:spod_app/utils/dummy_data.dart';
import 'package:spod_app/widget/no_transaction_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import '../../../services/firebase_crud.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();
  final TextEditingController _paidController = TextEditingController();
  final CollectionReference _order =
      FirebaseFirestore.instance.collection('Order');

  Future<void> _Update([DocumentSnapshot? documentSnapshot]) async {
    String action = 'bayar';
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['venue_name'];
      _dateController.text = documentSnapshot['date'];
      _timeController.text = documentSnapshot['time'].toString();
      _totalController.text = documentSnapshot['total'].toString();
      _paidController.text = documentSnapshot['paidStatus'];
      if (documentSnapshot['paidStatus'] == 'Paid') {
        action = 'sudah';
      }
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  enabled: false,
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  enabled: false,
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                  ),
                ),
                TextField(
                  enabled: false,
                  controller: _timeController,
                  decoration: const InputDecoration(
                    labelText: 'Time',
                  ),
                ),
                TextField(
                  enabled: false,
                  controller: _totalController,
                  decoration: const InputDecoration(
                    labelText: 'Total',
                  ),
                ),
                TextField(
                  enabled: false,
                  controller: _paidController,
                  decoration: const InputDecoration(
                    labelText: 'Paid Status',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    child: Text(action == 'bayar' ? 'Bayar' : 'Kembali'),
                    onPressed: () async {
                      if (action == 'bayar') {
                        final String status = 'Paid';
                        await _order
                            .doc(documentSnapshot!.id)
                            .update({"paidStatus": status});
                      }

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    })
              ],
            ),
          );
        });
  }

  Future<void> _deleteOrder(String orderId) async {
    await _order.doc(orderId).delete();
  }

  List<FieldOrder> fieldOrderList = dummyUserOrderList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: StreamBuilder(
            stream: _order.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                Center(
                    child: SingleChildScrollView(
                        child: NoTranscationMessage(
                  messageTitle: "No Transactions, yet.",
                  messageDesc:
                      "You have never placed an order. Let's explore the sport venue near you.",
                )));
              }
              if (streamSnapshot.hasData) {
                return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    //itemCount: fieldOrderList.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return InkWell(
                        onTap: () {},
                        splashColor: primaryColor100,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(documentSnapshot['image']
                                                // fieldOrderList[index]
                                                //     .field
                                                //     .imageAsset
                                                ))),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // fieldOrderList[index].field.name,
                                    documentSnapshot['venue_name'],
                                    style: normalTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(documentSnapshot['date'],
                                      style: normalTextStyle),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.red)),
                                child: Row(
                                  children: [
                                    // Press this button to edit a single product
                                    IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () =>
                                            _Update(documentSnapshot)),
                                    // This icon button is used to delete a single product
                                    IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () =>
                                            _deleteOrder(documentSnapshot.id)),
                                  ],
                                ),
                                // child: TextButton(onPressed: () {
                                //   Navigator.push(context,
                                //       MaterialPageRoute(builder: (context) {
                                //     return CheckoutScreen(
                                //       field: field,
                                //     );
                                //   }));
                                // })
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
