import 'package:hive/hive.dart';

part 'phone_model.g.dart';

@HiveType(typeId: 0)
class PhoneModel extends HiveObject {
  @HiveField(0)
  final String phoneNumber;
  @HiveField(1)
  final String countryCode;
  @HiveField(2)
  final DateTime dataSend;
  PhoneModel({
    required this.phoneNumber,
    required this.dataSend,
    required this.countryCode,
  });
}
