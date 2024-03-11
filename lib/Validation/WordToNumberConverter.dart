class WordToNumberConverter {
  static Map<String, int> NUMBER_WORDS_MAP = {
    "zero": 0,
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9,
    "ten": 10,
    "eleven": 11,
    "twelve": 12,
    "thirteen": 13,
    "fourteen": 14,
    "fifteen": 15,
    "sixteen": 16,
    "seventeen": 17,
    "eighteen": 18,
    "nineteen": 19,
    "twenty": 20,
    "thirty": 30,
    "forty": 40,
    "fifty": 50,
    "sixty": 60,
    "seventy": 70,
    "eighty": 80,
    "ninety": 90,
    "hundred": 100,
    "thousand": 1000,
    "million": 1000000,
    "billion": 1000000000
  };

  static int convertWordToNumber(String words) {
    if (words.trim().isEmpty) return -1;

    int result = 0;
    int tempResult = 0;
    int scale = 1;

    List<String> parts = words.trim().split(RegExp(r'\s+')).map((e) => e.toLowerCase()).toList();

    for (String part in parts) {
      if (part == "and") continue;
      if (!NUMBER_WORDS_MAP.containsKey(part)) return -1;

      int number = NUMBER_WORDS_MAP[part]!;

      if (number == 100) {
        tempResult *= number;
      } else if (number >= 1000) {
        result += tempResult * number;
        tempResult = 0;
        scale *= number;
      } else {
        tempResult += number;
      }
    }

    return result + tempResult;
  }
}
