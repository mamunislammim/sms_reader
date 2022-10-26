import 'package:flutter/material.dart';
// import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'first_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    )
  );
}





// Package_example
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final SmsQuery _query = SmsQuery();
//   List<SmsMessage> _messages = [];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10.0),
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: _messages.length,
//           itemBuilder: (BuildContext context, int i) {
//             // var message = _messages[i];
//
//             return ListTile(
//               title: Text('${_messages[i].sender}'),
//               subtitle: Text(_messages[i].body!.substring(0,20)),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           var permission = await Permission.sms.status;
//           if (permission.isGranted) {
//             final messages = await _query.querySms(
//               kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
//               // address: '+254712345789',
//               //count: 10,
//             );
//             debugPrint('sms inbox messages: ${messages.length}');
//
//             setState(() => _messages = messages);
//           } else {
//             await Permission.sms.request();
//           }
//         },
//         child: const Icon(Icons.refresh),
//       ),
//     );
//   }
// }