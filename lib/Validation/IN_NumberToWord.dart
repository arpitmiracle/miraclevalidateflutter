import 'dart:math';

class NumberToWord {
  static String? convertCountToWord(String? num) {
    if (num == null) return null;

    BigInt bd = BigInt.tryParse(num) ?? BigInt.zero;
    var number = bd.toInt();
    var no = bd.toInt();
    var decimal = (bd.remainder(BigInt.one).toDouble() * 100).toInt();
    var digits_length = no.toString().length;
    var i = 0;
    var finalResult = "";
    var str = [];
    var words = {
      0: "",
      1: "One",
      2: "Two",
      3: "Three",
      4: "Four",
      5: "Five",
      6: "Six",
      7: "Seven",
      8: "Eight",
      9: "Nine",
      10: "Ten",
      11: "Eleven",
      12: "Twelve",
      13: "Thirteen",
      14: "Fourteen",
      15: "Fifteen",
      16: "Sixteen",
      17: "Seventeen",
      18: "Eighteen",
      19: "Nineteen",
      20: "Twenty",
      30: "Thirty",
      40: "Forty",
      50: "Fifty",
      60: "Sixty",
      70: "Seventy",
      80: "Eighty",
      90: "Ninety",
    };
    var digits = [
      "",
      "Hundred",
      "Thousand",
      "Lakh",
      "Crore",
      "Arab",
      "Kharab",
      "Nil",
      "Padma",
      "Shankh"
    ];
    while (i < digits_length) {
      var divider = i == 2 ? 10 : 100;
      number = no % divider;
      no = no ~/ divider;
      i += divider == 10 ? 1 : 2;
      if (number > 0) {
        var counter = str.length;
        var plural = counter > 0 && number > 9 ? "s" : "";
        var tmp = number < 21
            ? "${words[number]} ${digits[counter]}$plural"
            : "${words[(number ~/ 10) * 10]} ${words[number % 10]} ${digits[counter]}$plural";
        str.add(tmp);
      } else {
        str.add("");
      }
    }
    str = str.reversed.toList();
    var Rupees = str.join(" ").trim();
    var paise = decimal > 0
        ? " And ${words[(decimal - decimal % 10)]} ${words[(decimal % 10)]}"
        : "";
    if (paise.isNotEmpty) {
      paise = "$paise Paise";
    }
    finalResult = "$Rupees$paise";
    return finalResult
        .replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll(RegExp(r'\s+$'), '')
        .replaceAll(RegExp(r'\s+(?=\d+\s+Paise$)'), ' ');
  }
}
