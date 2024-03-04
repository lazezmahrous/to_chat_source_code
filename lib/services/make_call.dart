import 'package:url_launcher/url_launcher.dart';

class MakeCall {
  Future<void> makeCall({required String phoneNumber}) async {
    await launch("tel://$phoneNumber");
  }
}
