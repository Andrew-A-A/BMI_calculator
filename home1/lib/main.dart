import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//Global variable to store the values
double currentHeight = 150;
double age=20;
double weight=50;
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //Whole App background color
            backgroundColor: const Color(0xFF0A0E21),
          appBar: AppBar(
            centerTitle: true,
            title: const Text("BMI calculator",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25),),
            backgroundColor: const Color(0xFF0A0E21),
          ),
         body:  Column(
          children: [
          //Male & Female row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //first container for male icon and text
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(color: const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(Icons.male,color: Colors.white, size: 90,),
                      Text("Male",
                      style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w100))
                       ]
                  ),
                ),

                //Space between two containers
                const SizedBox(
                  width: 15
                ),

                //Second container for female icon and text
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(color:const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female,color: Colors.white, size: 90,),
                        Text("Female",
                            style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w100))
                      ]
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
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(color:const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   const Text("Height",
                   style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:[
                       Text("${currentHeight.toInt()} ",style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w400)),
                       const Text("cm", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.white),)
                  ]
        ),
                   Slider(min: 100,max:300,value: currentHeight,activeColor: Colors.deepPurpleAccent, onChanged: (double value){

                     setState(() {
                       currentHeight=value;
                     });

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
                  decoration: BoxDecoration(color: const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),

                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Weight", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),
                        const SizedBox(height: 5),
                        Text("${weight.toInt()} KG", style: const TextStyle(fontSize: 20,color: Colors.white)),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          children:[

                         FloatingActionButton(
                           backgroundColor:Colors.deepPurple ,
                            child: const Icon(CupertinoIcons.minus),
                            onPressed: (){
                              setState(() {
                            --weight;
                                });
                              }
                        ),
                        const SizedBox(width: 10,),
                        FloatingActionButton(
                            backgroundColor:Colors.deepPurple ,
                            child: const Icon(CupertinoIcons.plus),
                            onPressed: (){
                              setState(() {
                            ++weight;
                                });
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
                  decoration: BoxDecoration(color:const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
                  child:  Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Age", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w100)),
                        const SizedBox(height: 5),
                        Text(age.toInt().toString(), style: const TextStyle(fontSize: 25,color: Colors.white)),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[

                              FloatingActionButton(
                                  backgroundColor:Colors.deepPurple ,
                                  child: const Icon(CupertinoIcons.minus),
                                  onPressed: (){
                                    setState(() {
                                      --age;
                                    });
                                  }
                              ),
                              const SizedBox(width: 10,),
                              FloatingActionButton(
                                  backgroundColor:Colors.deepPurple ,
                                  child: const Icon(CupertinoIcons.plus),
                                  onPressed: (){
                                    setState(() {
                                      ++age;
                                    });
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

        )

      )
    );
  }
}