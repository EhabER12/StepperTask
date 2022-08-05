import 'package:flutter/material.dart';
import 'package:gdc/resources/constants.dart';
import 'package:gdc/widgets/textfield.dart';
class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: _currentStep < 3
            ? () => setState(() => _currentStep += 1)
            : null,
        onStepCancel: _currentStep > 0
            ? () => setState(() => _currentStep -= 1)
            : null,
        steps: const [
          Step(
              title: Text(AppConstants.stepOne),
              isActive: true,
              content: Text(AppConstants.stepOneSub)),
          Step(
              title: Text(AppConstants.stepTwo),
              isActive: true,
              content: Text(AppConstants.stepTwoSub)),
          Step(title: Text(AppConstants.stepThree), isActive: true, content: CustomTextField()),
          Step(title: Text(""), isActive: true, content: Text("Thank you!"))
        ]);
  }
}
