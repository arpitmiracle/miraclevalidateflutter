import 'dart:math';
import 'package:flutter/services.dart';

class Validation {
  static bool validatePhoneNumber(String phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    } else {
      return RegExp(r'^[0-9]+$').hasMatch(phone);
    }
  }

  static bool validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    } else {
      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    }
  }

  static String generatePassword({
    required int length,
    required bool includeCapital,
    required bool includeSmall,
    required bool includeNumber,
    required bool includeSpecial,
  }) {
    List<String> charPool = [];
    if (includeCapital) charPool.addAll('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split(''));
    if (includeSmall) charPool.addAll('abcdefghijklmnopqrstuvwxyz'.split(''));
    if (includeNumber) charPool.addAll('0123456789'.split(''));
    if (includeSpecial) charPool.addAll('!@#\$%^&*()_+-=[]|,./?><'.split(''));

    return List.generate(length, (_) => charPool[Random().nextInt(charPool.length)])
        .join();
  }

  static double volumeConvert(double value, String factorFrom, String factorTo) {
    Map<String, double> conversionFactors = {
      "US liquid gallon": 1.0,
      "US liquid quart": 4.0,
      "US liquid pint": 8.0,
      "US legal cup": 15.7725,
      "US fluid ounce": 128.0,
      "US tablespoon": 256.0,
      "US teaspoon": 768.0,
      "cubic meter": 0.00378541,
      "liter": 3.78541,
      "milliliter": 3785.41,
      "imperial gallon": 0.832674,
      "imperial quart": 3.3307,
      "imperial pint": 6.66139,
      "imperial cup": 13.3228,
      "imperial fluid ounce": 133.228,
      "imperial tablespoon": 213.165,
      "imperial teaspoon": 639.494,
      "cubic foot": 0.133681,
      "cubic inch": 231.0
    };
    double? unitFrom = conversionFactors[factorFrom];
    double? unitTo = conversionFactors[factorTo];

    if (unitFrom == null || unitTo == null) {
      return -1.0;
    }
    return value * (unitTo / unitFrom);
  }

  static double lengthConvert(double value, String fromUnit, String toUnit) {
    Map<String, double> conversionFactors = {
      "Kilometer": 1000.0,
      "Meter": 1.0,
      "Centimeter": 0.01,
      "Millimeter": 0.001,
      "Micrometer": 0.000001,
      "Nanometer": 0.000000001,
      "Mile": 1609.344,
      "Yard": 0.9144,
      "Foot": 0.3048,
      "Inch": 0.0254,
      "Nautical Mile": 1852.0
    };

    double meterValue = value * (conversionFactors[fromUnit] ?? 1.0);
    return meterValue / (conversionFactors[toUnit] ?? 1.0);
  }

  static double massConvert(String mass_str, String fromUnit, String toUnit) {
    List<List<double>> conversionMatrix = [
      [1.0, 1000.0, 1000000.0, 1000000000.0, 1000000000000.0, 0.9842065286, 1.1023113109, 157.4730444178, 2204.6226218488, 35273.96194958],
      [0.001, 1.0, 1000.0, 1000000.0, 1000000000.0, 0.0009842065, 0.0011023113, 0.1574730444, 2.2046226218, 35.2739619496],
      [0.000001, 0.001, 1.0, 1000.0, 1000000.0, 0.0000009842, 0.0000011023, 0.000157473, 0.0022046226, 0.0352739619],
      [0.000000001, 0.000001, 0.001, 1.0, 1000.0, 0.000000001, 0.0000000011, 0.0000001575, 0.0000022046, 0.000035274],
      [0.000000000001, 0.000000001, 0.000001, 0.001, 1.0, 0.000000000001, 0.0000000000011, 0.0000000001575, 0.0000000022046, 0.000000035274],
      [1.016e-6, 0.0010160469, 0.0010160469, 1.0160469088, 1016.0469088, 1.0, 1.12, 160.0, 2240.0, 35840.0],
      [0.90718474, 907.18474, 907184.74, 907184740.0, 9.0718474e+11, 0.8928571429, 1.0, 142.8571428571, 2000.0, 32000.0],
      [0.00635029318, 6.35029318, 6350.29318, 6350293.18, 6.35029318e+9, 0.00625, 0.007, 1.0, 14.0, 224.0],
      [0.00045359237, 0.45359237, 453.59237, 453592.37, 453592370.0, 0.0004464286, 0.0005, 0.0714285714, 1.0, 16.0],
      [0.00002834952, 0.0283495231, 28.349523125, 28349.523125, 28349523.125, 2.7777777778e-5, 3.125e-5, 0.0044642857, 0.0625, 1.0]
    ];
    int fromIndex = massUnit(fromUnit);
    int toIndex = massUnit(toUnit);
    double inputValue = double.parse(mass_str);
    return inputValue * conversionMatrix[fromIndex][toIndex];
  }

  static int massUnit(String unit) {
    switch (unit) {
      case "Tonne":
        return 0;
      case "Kilogram":
        return 1;
      case "Gram":
        return 2;
      case "Milligram":
        return 3;
      case "Microgram":
        return 4;
      case "Imperial Ton":
        return 5;
      case "US Ton":
        return 6;
      case "Stone":
        return 7;
      case "Pound":
        return 8;
      case "Ounce":
        return 9;
      default:
        return -1;
    }
  }

  static String? compareDateTime(DateTime selectedDateTime, DateTime currentDateTime) {
    Duration difference = currentDateTime.difference(selectedDateTime);
    int days = difference.inDays;
    int remainingHours = difference.inHours % 24;
    int remainingMinutes = difference.inMinutes % 60;
    int remainingSeconds = difference.inSeconds % 60;
    StringBuffer builder = StringBuffer();
    if (days > 0) {
      builder.write('$days days, ');
    }
    if (remainingHours >= 0) {
      builder.write('$remainingHours hours, ');
    }
    if (remainingMinutes >= 0) {
      builder.write('$remainingMinutes minutes, ');
    }
    if (remainingSeconds >= 0) {
      builder.write('$remainingSeconds seconds');
    }
    return builder.toString();
  }

  static String? compareDateTimeAgo(DateTime selectedDateTime, DateTime currentDateTime) {
    Duration difference = currentDateTime.difference(selectedDateTime);
    int years = (difference.inDays / 365).floor();
    int months = (difference.inDays / 30).floor();
    int weeks = (difference.inDays / 7).floor();
    int days = difference.inDays;
    int hours = difference.inHours;
    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;
    if (years > 0) {
      return "$years year's ago";
    } else if (months > 0) {
      return "$months month's ago";
    } else if (weeks > 0) {
      return "$weeks week's ago";
    } else if (days > 0) {
      return "$days day's ago";
    } else if (hours > 0) {
      return "$hours hour's ago";
    } else if (minutes > 0) {
      return "$minutes minute's ago";
    } else {
      return "$seconds second's ago";
    }
  }
}
