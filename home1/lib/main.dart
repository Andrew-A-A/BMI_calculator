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
bool? isMale;
class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen()
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //Whole App background color
        backgroundColor: const Color(0xFF0A0E21),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI CALCULATOR",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 25)),
          backgroundColor: const Color(0xFF0A0E21),
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
                    setState(() {
                      isMale=true;
                    });

                  },
                  child: Container(

                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(color: isMale!=null && (isMale!) ? Colors.deepPurple:const Color(0xFF1F1B31),
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
                  onTap: (){
                    setState(() {
                      isMale=false;
                    });
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(color: isMale!=null && (isMale==false) ? Colors.deepPurple:const Color(0xFF1F1B31),borderRadius: BorderRadius.circular(20)),
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
                          const Text("cm", style: TextStyle(fontSize: 15,fontWeight: FontWeight.w100,color: Colors.white))
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              Text("${weight.toInt()}", style: const TextStyle(fontSize: 22,color: Colors.white)),
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
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    currentHeight=currentHeight/100;
    double bmi=weight/(currentHeight*currentHeight);
    return  Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Your Result",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w500)),
          Center(
            child: Container(
                decoration: BoxDecoration(color: const Color(0xFF1F1B31),
                    borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    if(bmi<18.5)
                      const Text("Underwight",style: TextStyle(fontSize: 20,color: Colors.yellow))
                    else if(bmi>=18.5 && bmi<=24.9)
                      const Text("Normal",style: TextStyle(fontSize: 25,color: Colors.green))
                    else if(bmi>=25 && bmi<=29.9)
                        const Text("Overweight",style: TextStyle(fontSize: 25,color: Colors.deepOrangeAccent))
                    else
                        const Text("Obese",style: TextStyle(fontSize: 25,color: Colors.red)),
                    const SizedBox(height: 20,),
                    Text(" ${bmi.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white,fontSize: 60,fontWeight: FontWeight.bold)
                    ),



              ]
              )
            ),
          )
        ],
      ),
      
    );
  }
}
