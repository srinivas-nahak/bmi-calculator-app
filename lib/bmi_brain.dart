import 'dart:math';

class BmiBrain {
  BmiBrain({required this.height, required this.weight}) {
    //Calling getBMI() so that the _bmiNum wouldn't be zero if getBMI() hasn't been called by user.
    //So while passing the values to the results_page constructor user can choose any sequence of parameter
    //And if the getBMI() isn't the first parameter then the "weightStatus" will always be underWeight

    getBMI();
  }

  final int weight, height;

  double _bmiNum = 0.0;

  String getBMI() {
    _bmiNum = weight / pow(height / 100, 2);

    return _bmiNum.toStringAsFixed(1);
  }

  Map<String, String> getAdvise() {
    //if (_bmiNum == 0) getBMI();

    if (_bmiNum <= 18.5) {
      return {
        "weightStatus": "Underweight",
        "advise":
            "No worries! Just try to add a little extra quantity to your meal."
      };
    } else if (_bmiNum >= 18.5 && _bmiNum <= 24.9) {
      return {
        "weightStatus": "Normal",
        "advise": "Hurray!! Just be consistent with your good lifestyle."
      };
    } else {
      return {
        "weightStatus": "Overweight",
        "advise":
            "No problem! A little mindfulness with diet & lifestyle is what you need :)"
      };
    }
  }
}
