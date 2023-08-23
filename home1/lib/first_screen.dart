import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home1/app_cubit/app_cubit.dart';
import 'package:home1/app_cubit/app_states.dart';
import 'package:home1/second_screen.dart';
import 'package:home1/app_colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppCubit cubit=BlocProvider.of<AppCubit>(context);
    AppColors appColors=AppColors();
    return  BlocBuilder<AppCubit, AppStates>(builder: (BuildContext context,dynamic state){
      return Scaffold(
        //Whole App background color
          backgroundColor: appColors.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text("BMI CALCULATOR",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25)),
            backgroundColor: appColors.backgroundColor,
          ),
          body:  Column(
            children: [
              const SizedBox(height: 30),
              //Male & Female row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //first container for male icon and text
                  GestureDetector(
                    onTap: (){
                        cubit.changeGender(true);
                    },
                    child: Container(

                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(color:   cubit.isMale!=null && (  cubit.isMale!) ? Colors.deepPurple:const Color(0xFF1F1B31),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male,color: Colors.white, size: 90,),
                            Text("Male",
                                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w100))
                          ]
                      ),
                    ),
                  ),

                  //Space between two containers
                  const SizedBox(
                      width: 15
                  ),

                  //Second container for female icon and text
                  GestureDetector(
                    onTap: (){ cubit.changeGender(false); },
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(color:   cubit.isMale!=null && (  cubit.isMale==false) ? Colors.deepPurple:const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female,color: Colors.white, size: 90,),
                            Text("Female",
                                style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w100))
                          ]
                      ),
                    ),
                  )
                ],
              ),

              //Space between height slider and first row
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),

              //Height data container
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10 ),
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(color:appColors.boxColor,borderRadius: BorderRadius.circular(20)),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Height",
                          style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Text("${  cubit.currentHeight.toInt()} ",style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w400)),
                            const Text("cm", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.white))
                          ]
                      ),
                      Slider(min: 100,max:300,value:   cubit.currentHeight,activeColor: Colors.deepPurpleAccent,
                          onChanged: (double value){
                        cubit.changeHeight(value);
                      })
                    ],
                  )
              ),

              //Space between height data and last row in the app
              const SizedBox(height: 20,),

              //Age & Weight row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Weight container
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(color: appColors.boxColor,borderRadius: BorderRadius.circular(20)),

                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Weight", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                Text("${cubit.weight.toInt()}", style: const TextStyle(fontSize: 22,color: Colors.white)),
                                const SizedBox(width: 5),
                                const Text("kg", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.white))
                              ]),
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[

                                FloatingActionButton(
                                    backgroundColor:Colors.deepPurple ,
                                    child: const Icon(CupertinoIcons.minus),
                                    onPressed: (){

                                       cubit.changeWeight(--cubit.weight);

                                    }
                                ),
                                const SizedBox(width: 10,),
                                FloatingActionButton(
                                    backgroundColor:Colors.deepPurple ,
                                    child: const Icon(CupertinoIcons.plus),
                                    onPressed: (){

                                        cubit.changeWeight( ++cubit.weight);

                                    }
                                )
                              ]
                          )
                        ]
                    ),
                  ),
                  //Space between two containers
                  const SizedBox(
                    width: 15,
                  ),
                  //Age container
                  Container(
                    width: 170,
                    height: 170,
                    decoration: BoxDecoration(color:appColors.boxColor,borderRadius: BorderRadius.circular(20)),
                    child:  Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Age", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),
                          const SizedBox(height: 5),
                          Text(  cubit.age.toInt().toString(), style: const TextStyle(fontSize: 25,color: Colors.white)),
                          const SizedBox(height: 5),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[

                                FloatingActionButton(
                                    backgroundColor:Colors.deepPurple ,
                                    child: const Icon(CupertinoIcons.minus),
                                    onPressed: (){
                                      cubit.changeAge(--cubit.age);
                                    }
                                ),
                                const SizedBox(width: 10,),
                                FloatingActionButton(
                                    backgroundColor:Colors.deepPurple ,
                                    child: const Icon(CupertinoIcons.plus),
                                    onPressed: (){

                                       cubit.changeAge(++cubit.age);

                                    }
                                )
                              ]
                          )
                        ]
                    ),
                  )
                ],
              )
            ],

          ),
          bottomSheet: GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> const SecondScreen()));
            },
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.deepPurple,
              child:const Center(child: Text("CALCULATE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 18))),
            ),
          )

      );
    });
  }
}
