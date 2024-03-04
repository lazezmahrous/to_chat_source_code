import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:to_chat/constanc.dart';
import 'package:to_chat/database/sqldb.dart';
import 'package:to_chat/generated/l10n.dart';
import 'package:to_chat/models/phone_model.dart';
import 'package:to_chat/providers/app_provider.dart';
import 'package:to_chat/providers/language_provider.dart';
import 'package:to_chat/services/make_call.dart';
import 'package:to_chat/services/messages_send.dart';
import 'package:provider/provider.dart';
import 'package:to_chat/widgets/show_snack_bar.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({super.key, required this.scrollPhysics});
  final ScrollPhysics scrollPhysics;
  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  // SqlDb sqlDb = SqlDb();

  List<PhoneModel> phoneNumbers = [];
  // List<Map> phoneNumbers = [];
  Future<void> readData() async {
    var phoneNumbersBox = Hive.box<PhoneModel>(Constans.kphoneNumbersBox);
    print(phoneNumbersBox.values);
    phoneNumbers = (phoneNumbersBox.values.toList());
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: readData,
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).numbersTitle),
            elevation: 0,
            scrolledUnderElevation: 0,
            actions: [
              IconButton(
                  onPressed: () {
                    readData();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: Constans.kColorCyan,
                  ))
            ],
          ),
          body: ListView.builder(
            physics: widget.scrollPhysics,
            shrinkWrap: true,
            itemCount: phoneNumbers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Consumer<AppProvider>(
                            builder: (BuildContext context, AppProvider value,
                                Widget? child) {
                              return Row(
                                children: [
                                  IconButton(
                                    onPressed: () async {
                                      await StartChat()
                                          .startChatWithOutCountryCode(
                                        phoneNumber:
                                            phoneNumbers[index].phoneNumber,
                                        messageText: value.messageText ?? '',
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.send_rounded,
                                      color: Colors.green,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      await MakeCall().makeCall(
                                          phoneNumber:
                                              phoneNumbers[index].phoneNumber);
                                    },
                                    icon: const Icon(
                                      Icons.call,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onLongPress: () {
                                    final String phoneNumber =
                                        phoneNumbers[index].phoneNumber;

                                    if (phoneNumber.startsWith("+")) {
                                      final String cleanedPhoneNumber =
                                          phoneNumber.substring(3);

                                      Clipboard.setData(ClipboardData(
                                          text: cleanedPhoneNumber));
                                    }

                                    Clipboard.setData(ClipboardData(
                                            text: phoneNumbers[index]
                                                .phoneNumber))
                                        .then((value) {
                                      showSnackBar(
                                        context: context,
                                        message: S
                                            .of(context)
                                            .snackBarOfNumberCopyed,
                                        color: Constans.kColorCyan,
                                      );
                                    });
                                  },
                                  child: Text(
                                      '${S.of(context).hintTextOfPhone} : ${phoneNumbers[index].phoneNumber}'),
                                ),
                                Consumer<LanguageProvider>(
                                  builder: (context, value, child) {
                                    return Text(
                                        '${S.of(context).textOfPhoneDataSend} :${DateFormat('EEE, h:mm a', 'ar').format(phoneNumbers[index].dataSend)}');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              phoneNumbers[index].delete();
                              readData();
                              // await sqlDb.deleteData(
                              //     "DELETE FROM phoneNumbers WHERE id = ${snapshot.data![index]['id']}");
                              // setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
