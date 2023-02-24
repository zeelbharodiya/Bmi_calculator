import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Myapp(),
    ),

  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp>
  with SingleTickerProviderStateMixin{

  double Slidervalue = 0;
  var a = 0;
  var b = 0;

  var colorA = false;
  var colorB = false;

  var colorW = false;
  var colorX = false;
  var colorY = false;
  var colorZ = false;

  var st = false;

  var z = "";
  var z1 = "Calculate";


  var s;
  var r;

  // var weight;
  // var height;
  // var bmi;

  double startscale = 0.8;
  double endscale = 1.1;

  double startscale1 = 0.8;
  double endscale1 = 1.1;

  late AnimationController animationController;

  late Animation sizeAnimation;
  late Animation colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
      // lowerBound: 20,
      // upperBound: 30,
    );
    animationController.repeat();
    
    sizeAnimation = Tween<double>(begin: 20 , end: 30).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
    colorAnimation = ColorTween(begin: Colors.white , end: Color(0xffEB1555)).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
           AnimatedBuilder(
               animation: animationController,
               builder: (context , widget) {
                 return  Text(
                   "BMI Calculator",
                   style: TextStyle(fontSize: sizeAnimation.value,color: colorAnimation.value,fontWeight: FontWeight.w400,letterSpacing: 2),
                 );
               }
           ),
          ],
        ),

        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            colorA = true;
                            colorB = false;
                          });
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.height / 5,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.45,
                          decoration: BoxDecoration(
                            color: (colorA)
                                ? Color(0xff3B3C4D)
                                : Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (colorA) ? TweenAnimationBuilder(
                                  tween: Tween<double>(begin: startscale , end: endscale),
                                  onEnd: () {
                                    setState(() {
                                      startscale = (startscale == 0.8)  ? 1.1  : 0.8;
                                      endscale = (endscale == 1.1)  ? 0.8  : 1.1;
                                    });
                                  },
                                  duration: Duration(milliseconds: 1000),
                                  builder: (context, val2, widget) {
                                    return Transform.scale(
                                      scale: val2,
                                      child:  Icon(
                                        Icons.female,
                                        size: 160,
                                        color:
                                        (colorA) ? Color(0xffEB1555) : Colors.white,
                                      ),
                                    );
                                  }
                              ) :
                              Icon(
                                Icons.female,
                                size: 160,
                                color:
                                (colorA) ? Color(0xffEB1555) : Colors.white,
                              ),

                              SizedBox(
                                height: 5,
                              ),

                              Text(
                                "Female",
                                style: TextStyle(
                                    color: (colorA)
                                        ? Color(0xffEB1555)
                                        : Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            colorB = true;
                            colorA = false;
                          });
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.height / 5,
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.width / 2.45,
                          decoration: BoxDecoration(
                            color: (colorB)
                                ? Color(0xff3B3C4D)
                                : Color(0xff1D1E33),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              (colorB) ? TweenAnimationBuilder(
                                  tween: Tween<double>(begin: startscale , end: endscale),
                                  onEnd: () {
                                    setState(() {
                                      startscale = (startscale == 0.8)  ? 1.1  : 0.8;
                                      endscale = (endscale == 1.1)  ? 0.8  : 1.1;
                                    });
                                  },
                                  duration: Duration(milliseconds: 1000),
                                  builder: (context, val2, widget) {
                                    return Transform.scale(
                                      scale: val2,
                                      child:  Icon(
                                        Icons.male,
                                        size: 160,
                                        color:
                                        (colorB) ? Color(0xffEB1555) : Colors.white,
                                      ),
                                    );
                                  }
                              ) :
                              Icon(
                                Icons.male,
                                size: 160,
                                color:
                                (colorB) ? Color(0xffEB1555) : Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    color: (colorB)
                                        ? Color(0xffEB1555)
                                        : Colors.white,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height / 5,
                        decoration: BoxDecoration(
                          color: Color(0xff1D1E33),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                color: Color(0xff626473),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${Slidervalue.toInt()}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 45),
                                ),
                                Text(
                                  'cm',
                                  style: TextStyle(
                                    color: Color(0xff626473),
                                    fontSize: 15,
                                    height: 4,
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value: Slidervalue,
                              min: 0,
                              max: 500,
                              inactiveColor: Color(0xff626473),
                              activeColor: Color(0xff626473),
                              thumbColor: Color(0xffEB1555),
                              onChanged: (val) {
                                setState(() {
                                  Slidervalue = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${a.toInt()}",
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      a--;
                                      colorY = true;
                                      colorZ = false;
                                    });
                                  },
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: (colorY)
                                          ? Color(0xffEB1555)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: (colorY)
                                      ? Color(0xff6E6F7A)
                                      : Color(0xff4C4F5E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      a = a + 5;
                                      colorZ = true;
                                      colorY = false;
                                    });
                                  },
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: (colorZ)
                                          ? Color(0xffEB1555)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: (colorZ)
                                      ? Color(0xff6E6F7A)
                                      : Color(0xff4C4F5E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 33,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                        color: Color(0xff1D1E33),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${b.toInt()}',
                            // "$b",
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      b--;
                                      colorX = true;
                                      colorW = false;
                                    });
                                  },
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: (colorX)
                                          ? Color(0xffEB1555)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: (colorX)
                                      ? Color(0xff6E6F7A)
                                      : Color(0xff4C4F5E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      b = b + 5;
                                      colorW = true;
                                      colorX = false;
                                    });
                                  },
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: (colorW)
                                          ? Color(0xffEB1555)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: (colorW)
                                      ? Color(0xff6E6F7A)
                                      : Color(0xff4C4F5E),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if(b >= 2){
                              if(colorA == true || colorB ==true)
                              {
                                z = ((( b /Slidervalue /Slidervalue) * 10000).toInt()).toString();
                                st = true;

                                if(b >= 2 && b <= 20){
                                  if(double.parse(z) < 5){
                                    z1 = "Under Weight";
                                  }else if(double.parse(z) > 5 && double.parse(z) < 85){
                                    z1 = "Helthy Weight";
                                  }else if(double.parse(z) > 85 && double.parse(z) < 95){
                                    z1 = "Risk of Over Weight";
                                  }

                                }else {
                                  if (double.parse(z) < 16) {
                                    z1 = "Severe Thinnes";
                                  } else if (double.parse(z) > 16 &&
                                      double.parse(z) < 17) {
                                    z1 = "Modarate Thinnes";
                                  }else if (double.parse(z) > 17 &&
                                      double.parse(z) < 25) {
                                    z1 = "Mild Thinnes";
                                  }else if (double.parse(z) > 25 &&
                                      double.parse(z) < 35) {
                                    z1 = "Normal";
                                  }else if (double.parse(z) > 35 &&
                                      double.parse(z) < 50) {
                                    z1 = "High Weight";
                                  }
                                }
                              }else{
                                st = true;
                                z1 = "Select Male  or Female";
                              }
                            }else{
                              st = true;
                              z1 = "Age More then 2";
                            }
                          });
                        },
                        onDoubleTap: (){
                          setState(() {
                            colorA = false;
                            colorB = false;
                            colorW = false;
                            colorX = false;
                            colorY = false;
                            colorZ = false;
                            st = false;
                            z1 = "Calculator";
                            z  = "";

                            a = 0;
                            b = 0;
                            Slidervalue = 0;
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 13,
                          width: MediaQuery.of(context).size.width / 0,
                          alignment: Alignment.center,
                          child :  TweenAnimationBuilder(
                              tween: Tween<double>(begin: startscale1 , end: endscale1),
                              onEnd: () {
                                setState(() {
                                  startscale1 = (startscale1 == 0.8)  ? 1.1  : 0.8;
                                  endscale1 = (endscale1 == 1.1)  ? 0.8  : 1.1;
                                });
                              },
                              duration: Duration(milliseconds: 600),
                              builder: (context, val6, widget) {
                                return Transform.scale(
                                  scale: val6,
                                  child:  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "$z $z1",
                                          style: TextStyle(color: Colors.white,
                                            fontSize: (st) ? 25 : 35,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                          ) ,

                          // child: (z)
                          // ? Text(
                          //     "Calculator",
                          //     style: TextStyle(
                          //       fontSize: 35,
                          //       color: Colors.white,
                          //     ),
                          //   )
                          // : (a <= 6 && b <= 2)
                          //     ? Text(
                          //         "Not Aplly ",
                          //         style: TextStyle(
                          //           fontSize: 30,
                          //           color: Colors.black,
                          //         ),
                          //       )
                          //     : (7 <= 60 && 3 <= 35 && a <= 90 && a <= 60)?Text(
                          //         "Helthy",
                          //         style: TextStyle(
                          //           fontSize: 30,
                          //           color: Colors.black,
                          //         ),
                          //       ):Text(
                          //         "Unhelthy",
                          //         style: TextStyle(
                          //         fontSize: 30,
                          //         color: Colors.black,
                          //         ),
                          //         ),
                          decoration: BoxDecoration(
                            color: Color(0xffEB1555),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

