import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  var bmiResult = "0".obs;
  var category = "".obs;

  calculateBMI(String height, String weight) {
    double h = double.parse(height) / 100;
    double w = double.parse(weight);
    double bmi = w / (h * h);
    bmiResult.value = bmi.toStringAsFixed(2);

    if (bmi < 18.5) {
      category.value = "Underweight";
    } else if (bmi < 24.9) {
      category.value = "Normal";
    } else if (bmi < 29.9) {
      category.value = "Overweight";
    } else {
      category.value = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Height (cm)",
                  hintText: "0",
                  prefixIcon: Icon(Icons.height),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Weight (kg)",
                  hintText: "0",
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                String height = heightController.text;
                String weight = weightController.text;

                if (height.isNotEmpty && weight.isNotEmpty) {
                  calculateBMI(height, weight);
                } else {
                  Get.snackbar(
                    "Error",
                    "Invalid input. Please enter valid numbers.",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.black,
                    // snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              label: const Text("Calculate"),
              icon: const Icon(Icons.calculate_outlined),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
                  () => Text(
                "BMI: ${bmiResult.value}\nCategory: ${category.value}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
