// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shops.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShopsAdapter extends TypeAdapter<Shops> {
  @override
  final int typeId = 0;

  @override
  Shops read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shops(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Shops obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.like_count)
      ..writeByte(5)
      ..write(obj.dislike_count)
      ..writeByte(6)
      ..write(obj.rating_count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShopsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
