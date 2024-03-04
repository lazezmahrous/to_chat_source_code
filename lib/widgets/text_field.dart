// ignore_for_file: must_be_immutable

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:to_chat/providers/theme_provider.dart';
import 'package:to_chat/providers/app_provider.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    this.textController,
    this.messageText,
    this.hintText,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.maxLines,
    this.isCountryCode,
  });

  TextEditingController? textController;
  String? messageText;
  String? hintText;
  bool? isCountryCode;
  int? maxLength;
  int? maxLines;
  Function(String)? onChanged;
  String? Function(String?)? validator;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final appProvider = context.read<AppProvider>();

    Future<String?>? validate() async {
      if (widget.validator != null) {
        return widget.validator!(widget.textController?.text);
      }
      return null;
    }

    return TextFormField(
      keyboardType:
          widget.isCountryCode! ? TextInputType.phone : TextInputType.text,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      validator: widget.validator,
      enableSuggestions: true,
      decoration: InputDecoration(
          prefixIcon: widget.isCountryCode!
              ? Consumer<ThemeProvider>(
                  builder: (context, value, child) {
                    return CountryCodePicker(
                      onInit: (code) {
                        appProvider.setCountryCode(
                            countryCode: code!.dialCode!);
                        // print(appProvider.countryCode);
                      },
                      onChanged: (code) {
                        // print(code!.dialCode);
                        appProvider.setCountryCode(countryCode: code.dialCode!);
                        // print(appProvider.countryCode);
                      },
                      initialSelection: 'EG',
                      favorite: const ['+20', 'EG'],
                      // optional. Shows only country name and flag
                      showCountryOnly: false,
                      // optional. Shows only country name and flag when popup is closed.
                      showOnlyCountryWhenClosed: false,
                      // optional. aligns the flag and the Text left
                      alignLeft: false,
                      backgroundColor: Colors.amber,
                      boxDecoration: BoxDecoration(
                        color: value.currentTheme == 'light'
                            ? Colors.white
                            : Colors.black,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.all(10),
                    );
                  },
                )
              : null,
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                widget.textController!.clear();
              },
              icon: const Icon(Icons.delete_outline_rounded))),
      controller: widget.textController,
      onChanged: widget.onChanged,
    );
  }
}
