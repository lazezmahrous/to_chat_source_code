// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PhoneModelAdapter extends TypeAdapter<PhoneModel> {
  @override
  final int typeId = 0;

  @override
  PhoneModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PhoneModel(
      phoneNumber: fields[0] as String,
      dataSend: fields[2] as DateTime,
      countryCode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PhoneModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.phoneNumber)
      ..writeByte(1)
      ..write(obj.countryCode)
      ..writeByte(2)
      ..write(obj.dataSend);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
