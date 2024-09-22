import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int currentStep = 0;
  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == steps().length - 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Icon(Icons.account_circle, size: 100)),
          Expanded(
            child: Stepper(
                steps: steps(),
                currentStep: currentStep,
                onStepContinue: () {
                  if (isLastStep) {
                    // Logic to handle the submission of the form
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepCancel: isFirstStep
                    ? null
                    : () {
                        setState(() {
                          currentStep -= 1;
                        });
                      },
                onStepTapped: (step) => setState(() {
                      currentStep = step;
                    }),
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      !isFirstStep
                          ? Expanded(
                              child: ElevatedButton(
                                onPressed: details.onStepCancel,
                                child: const Text('Back'),
                              ),
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(width: 12),
                      !isLastStep
                          ? Expanded(
                              child: ElevatedButton(
                                onPressed: details.onStepContinue,
                                child: const Text('Next'),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  List<Step> steps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Step 1'),
          content: Text('Content 1'),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Step 2'),
          content: Text('Content 2'),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Step 3'),
          content: Text('Content 3'),
        ),
      ];
}
