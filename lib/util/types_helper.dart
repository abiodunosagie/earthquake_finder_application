// ignore_for_file: unnecessary_null_comparison

class TypesHelper {
  //to int.
  static int toInt(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is int) {
        return val;
      } else {
        return val.toInt();
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
      return 0;
    }
  }

  //to double.
  static double toDouble(num val) {
    try {
      if (val == null) {
        return 0;
      }
      if (val is double) {
        return val;
      } else {
        return val.toDouble();
      }
    } catch (error) {
      // ignore: avoid_print
      print(error);
      return 0;
    }
  }
}
