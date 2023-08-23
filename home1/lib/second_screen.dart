import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home1/app_colors.dart';

import 'app_cubit/app_cubit.dart';
import 'app_cubit/app_states.dart';



class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = BlocProvider.of<AppCubit>(context);
    AppColors appColors=AppColors();
    cubit.currentHeight = cubit.currentHeight / 100;
    double bmi = cubit.weight / (cubit.currentHeight * cubit.currentHeight);
    return BlocBuilder<AppCubit, AppStates>(
        builder: (BuildContext context, dynamic state) {
          return Scaffold(
            backgroundColor:appColors.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Your Result", style: TextStyle(color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w500)),
                Center(
                  child: Container(
                      decoration: BoxDecoration(color:appColors.boxColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(bmi < 18.5)
                              const Text("Underweight",
                                  style: TextStyle(fontSize: 20, color: Colors
                                      .yellow))
                            else
                              if(bmi >= 18.5 && bmi <= 24.9)
                                const Text("Normal", style: TextStyle(
                                    fontSize: 25, color: Colors.green))
                              else
                                if(bmi >= 25 && bmi <= 29.9)
                                  const Text("Overweight", style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.deepOrangeAccent))
                                else
                                  const Text("Obese", style: TextStyle(
                                      fontSize: 25, color: Colors.red)),
                            const SizedBox(height: 20,),
                            Text(" ${bmi.toStringAsFixed(2)}",
                                style: const TextStyle(color: Colors.white,
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold)
                            ),


                          ]
                      )
                  ),
                )
              ],
            ),

          );
        }
    );
  }
}
