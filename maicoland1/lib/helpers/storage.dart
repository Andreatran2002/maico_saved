// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class Storage {

//   static Future<String> storageImage(
//     BuildContext context,
//     File file,
//   ) async {

//     var uuid = Uuid();
//     String url;
//     // try {
//     //   print("storage service ");
//     //   String fileName = uuid.v1(); 
//     //   var uploadTask = await storage.ref('images/$fileName').putFile(file);
//     //   var dowurl = await uploadTask.ref.getDownloadURL();
//     //   url = dowurl.toString();

//     //   return Future<String>.value(url);
//     // } on firebase_core.FirebaseException catch (e) {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     SnackBar(
//     //       content: Text(e.message.toString()),
//     //       backgroundColor: Colors.red,
//     //     ),
//     //   );
//     //   print(e);
//     //   return Future<String>.value('');
//     // }
//   }
// }
