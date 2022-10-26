import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:sms_read/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  SmsQuery query = SmsQuery();
  List<SmsMessage> messages = [];

  Future<void> _getSms()async {
    messages = await query.getAllSms;
    await query.querySms(
      kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
    );
  }

  @override
  void initState(){
    super.initState();
    _getSms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Sms Read from Mobile"),
        actions: [
          InkWell(
              onTap: () async {
                messages = await query.getAllSms;
                await query.querySms(
                  kinds: [SmsQueryKind.inbox, SmsQueryKind.sent],
                );
              },
              child: Icon(Icons.restart_alt_sharp)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (_, index) {
            var x = messages[index].body!.length;

            return ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondScreen(data: messages[index])));
              },
              leading: CircleAvatar(
                child: Icon(Icons.account_circle),
                radius: 22,
              ),
              title: Text("${messages[index].sender}"),
              subtitle: Text(
                  "${messages[index].body?.substring(0, x > 20 ? 20 : x)}"),
              trailing: Text("Before ${messages[index].date?.day} Days",style: TextStyle(fontSize: 10),),
            );
          }),
    );
  }
}
