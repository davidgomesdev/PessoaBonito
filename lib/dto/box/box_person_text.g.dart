// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_person_text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoxPessoaTextAdapter extends TypeAdapter<BoxPessoaText> {
  @override
  final int typeId = 10;

  @override
  BoxPessoaText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoxPessoaText(
      fields[10] as int,
      fields[20] as int,
      fields[30] as String,
      fields[40] as String,
      fields[50] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BoxPessoaText obj) {
    writer
      ..writeByte(5)
      ..writeByte(10)
      ..write(obj.id)
      ..writeByte(20)
      ..write(obj.categoryId)
      ..writeByte(30)
      ..write(obj.title)
      ..writeByte(40)
      ..write(obj.content)
      ..writeByte(50)
      ..write(obj.author);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoxPessoaTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
