// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:to_chat/constanc.dart';
import 'package:to_chat/models/phone_model.dart';
import 'package:to_chat/pages/numbers_page.dart';
import 'package:to_chat/providers/theme_provider.dart';
import 'package:to_chat/providers/app_provider.dart';
import 'package:to_chat/services/messages_send.dart';
import 'package:to_chat/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formkay = GlobalKey();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController messageText = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneNumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = context.read<AppProvider>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return SafeArea(
            child: Form(
              key: formkay,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFieldWidget(
                      isCountryCode: false,
                      hintText: S.of(context).hintTextOfMessage,
                      maxLength: 400,
                      maxLines: 4,
                      onChanged: (String data) {
                        appProvider.setMessageText(messageText: data);
                      },
                      messageText: messageText.text,
                      textController: messageText,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: TextFieldWidget(
                      validator: (data) {
                        if (data!.isEmpty) {
                          return S.of(context).phoneNumberIsNull;
                        } else if (data.length < 11) {
                          return S.of(context).phoneNumberIswrong;
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(data)) {
                          return S.of(context).phoneNumberContainNumbersOnly;
                        }
                        return null;
                      },
                      hintText: S.of(context).hintTextOfPhoneNumber,
                      isCountryCode: true,
                      maxLength: 11,
                      maxLines: 1,
                      onChanged: (String data) {
                        appProvider.setPhoneNumber(phoneNumber: data);
                      },
                      messageText: phoneNumber.text,
                      textController: phoneNumber,
                    ),
                  ),
                  Consumer<AppProvider>(
                    builder: (BuildContext context, AppProvider value,
                        Widget? child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  const MaterialStatePropertyAll(Size(50, 50)),
                              shape: const MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              )),
                              backgroundColor: MaterialStatePropertyAll(
                                value.phoneNumber == null ||
                                        value.phoneNumber!.isEmpty
                                    ? Constans.kColorWhite
                                    : Constans.kColorCyan,
                              ),
                              foregroundColor: MaterialStatePropertyAll(
                                value.phoneNumber == null ||
                                        value.phoneNumber!.isEmpty
                                    ? Constans.kColorCyan
                                    : Constans.kColorWhite,
                              )),
                          onPressed: () async {
                            if (formkay.currentState!.validate()) {
                              await StartChat()
                                  .startChat(
                                phoneNumber: value.phoneNumber!,
                                messageText: value.messageText ?? '',
                                countryCode: value.countryCode!,
                              )
                                  .whenComplete(() {
                                StartChat()
                                    .saveContact(
                                        phoneNumber: PhoneModel(
                                            phoneNumber: value.phoneNumber!,
                                            dataSend: DateTime.now(),
                                            countryCode: value.countryCode!))
                                    .whenComplete(() {
                                  phoneNumber.clear();
                                });
                              });
                            }
                          },
                          child: Text(S.of(context).hintTextOfButton),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * .3,
                    child: Stack(
                      children: [
                        const NumbersPage(
                          scrollPhysics: NeverScrollableScrollPhysics(),
                        ),
                        Consumer<ThemeProvider>(
                          builder: (context, themeProviderValue, child) {
                            return Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      themeProviderValue.currentTheme == 'light'
                                          ? Colors.white.withOpacity(0.5)
                                          : Colors.black.withOpacity(0.5),
                                      themeProviderValue.currentTheme == 'light'
                                          ? Colors.black.withOpacity(0.0)
                                          : Colors.white.withOpacity(0.0)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 5,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: const MaterialStatePropertyAll(
                                  ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                ),
                                fixedSize: const MaterialStatePropertyAll(
                                  Size(50, 50),
                                ),
                                foregroundColor: MaterialStatePropertyAll(
                                  Constans.kColorWhite,
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Constans.kColorCyan,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const NumbersPage(
                                      scrollPhysics:
                                          AlwaysScrollableScrollPhysics(),
                                    ),
                                  ),
                                );
                              },
                              child: Text(S.of(context).showNumbersButton),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
