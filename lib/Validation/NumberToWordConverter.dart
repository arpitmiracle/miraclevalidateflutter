class NumberToWordConverter {
  static List<String> units = [
    "", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"
  ];
  static List<String> teens = [
    "", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"
  ];
  static List<String> tens = [
    "", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
  ];
  static List<String> thousands = [
    "", "Thousand", "Million", "Billion", "Trillion"
  ];

  static String convertCountToWord(String? number) {
    if (number == null || number.isEmpty) return "Please enter a valid number";

    try {
      int num = int.parse(number);
      if (num == 0) return "Zero";

      int scale = 0;
      List<String> result = [];
      while (num > 0) {
        if (num % 1000 != 0) {
          StringBuffer groupResult = StringBuffer();
          convertThreeDigitsToWord(num % 1000, groupResult);
          result.insert(0, groupResult.toString().trim() + " " + thousands[scale] + " ");
          // result.write(groupResult.toString().trim() + " " + thousands[scale] + " ");
        }
        num ~/= 1000;
        scale++;
      }
      return result.join().trim();
    } catch (e) {
      return "Invalid number format";
    }
  }

  static void convertThreeDigitsToWord(int number, StringBuffer result) {
    if (number >= 100) {
      result.write(units[number ~/ 100] + " Hundred ");
      number %= 100;
    }
    if (number >= 11 && number <= 19) {
      result.write(teens[number - 10] + " ");
    } else if (number >= 20 || number == 10) {
      result.write(tens[number ~/ 10] + " ");
      number %= 10;
    }
    if (number > 0 && number < 10) {
      result.write(units[number] + " ");
    }
  }
}
