import 'package:flutter_clean_architecture/core/util/input_converter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

void main(){
  InputConverter inputConverter;
  setUp((){
    inputConverter = InputConverter();
  });

  group("stringToUnsignedInt", (){
    test("should return an integer when string represents an unsigned integer", () async {
      //arrange
      final str = "123";
      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Right(123));
    });

    test("should return a Failure when the string is not an integer", () async {
      //arrange
      final str = "abc";
      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });

    test("should return a Failure when the string is not a negative integer", () async {
      //arrange
      final str = "-123";
      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });

  });
}

