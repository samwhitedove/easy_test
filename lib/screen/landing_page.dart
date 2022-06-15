import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/constants/colors.dart';
import 'package:test_app/constants/svg.dart';
import 'package:test_app/constants/values.dart';
import 'package:test_app/constants/word.dart';
import 'package:test_app/screen/login_screen.dart';

import '../constants/images.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  late AnimationController controller1;
  late Animation<Offset> offset1;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
        reverseDuration: Duration(seconds: 1))
      ..repeat(reverse: true);
    offset = Tween<Offset>(begin: Offset.zero, end: Offset(2, 0.0)).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller1 = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 700),
        reverseDuration: Duration(seconds: 1))
      ..forward();
    offset1 = Tween<Offset>(begin: Offset.zero, end: Offset(2, 0.0)).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutSine));
    super.initState();
  }

  int currentBoard = 0;
  changeBoard(index){
    print("calling");
    setState(() {
      currentBoard = index;
      controller1..forward();
    });
  }

  gotoLogin(){
    Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.height = MediaQuery.of(context).size.height;
    ScreenSize.width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyColor.white,
        body: SafeArea(
          child: Column(
            children: [ 
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: IndexedStack(
                  index: currentBoard,
                  children: List.generate(data.length, ((index) => Container(
                    height: ScreenSize.height * .5,
                    child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                      curve: Curves.easeOutSine,
                      height: index == currentBoard ? ScreenSize.height * .5 : ScreenSize.height * .3,
                      width: index == currentBoard ? ScreenSize.width * .95 : ScreenSize.width * .3,
                      child: topBox(data[index]['bgImage'], ()=> gotoLogin(), index)),
                  )))
                ),
             ),
              // IndexedStack(
              //   index: currentBoard,
              //   children: List.generate(data.length, ((index) => Container(
              //     height: ScreenSize.height * .5,
              //     child: AnimatedContainer(
              //     duration: Duration(milliseconds: 500),
              //       curve: Curves.linear,
              //       height: index == currentBoard ? ScreenSize.height * .5 : ScreenSize.height * .3,
              //       width: index == currentBoard ? ScreenSize.width * .95 : ScreenSize.width * .3,
              //       child: SlideInUp(child: topBox(data[index]['bgImage'], ()=> changeBoard(index), index))),
              //   )))
              // ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: SizedBox(
                    height: ScreenSize.height * .35,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.only(top: 2),
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 3,
                            children: List.generate(
                                data.length,
                                (index) => FittedBox(
                                  child: itemBox(
                                      ()=> changeBoard(index),
                                      image: data[index]['image'],
                                      text: data[index]['name'], 
                                      index: index),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: MyColor.primaryColor),
              //   margin: EdgeInsets.all(10),
              //   height: ScreenSize.height * .06,
              //   width: double.infinity,
              //   child: ElevatedButton(onPressed: (){}, child: Text("Login"),))
            ],
          ),
        ));
  }

  var data = [
    {'image': Images.wallet, 'name': 'My Wallet', 'bgImage': Images.photo},
    {'image': Images.loan_hand, 'name': 'Loans', 'bgImage': Images.photo1},
    {'image': Images.nwassa_hand, 'name': 'Nwassa', 'bgImage': Images.photo2},
    {'image': Images.community, 'name': 'Community', 'bgImage': Images.photo},
    {'image': Images.insurance, 'name': 'Insurance', 'bgImage': Images.photo1},
    {'image': Images.retirement, 'name': 'Pension', 'bgImage': Images.photo2},
    {'image': Images.tingo_agent, 'name': 'Tingo Agent', 'bgImage': Images.photo},
    {'image': Images.flight, 'name': 'Travels', 'bgImage': Images.photo1},
    {'image': Images.chat, 'name': 'Support', 'bgImage': Images.photo2},
  ];

  List<Color> colors= [
    MyColor.wallet,
    MyColor.loan_hand,
    MyColor.nwassa,
    MyColor.community,
    MyColor.insurance,
    MyColor.pension,
    MyColor.tingo_agent,
    MyColor.flight,
    MyColor.support,
  ];

  Widget itemBox(url, {image, text, index}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: ()=> url(),
        child: Container(
          decoration: BoxDecoration(
            color: index == currentBoard ? MyColor.primaryColor.withOpacity(.5) : colors[index],
            boxShadow: [
            BoxShadow(
                color: MyColor.grey.withOpacity(.33),
                offset: const Offset(1, 1),
                blurRadius: 4,
                spreadRadius: 1)
          ], borderRadius: BorderRadius.circular(10)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(image, scale: 5),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(text,
                  style: const TextStyle(
                    color: MyColor.textColor,
                    fontWeight: FontWeight.w400,
                  )),
            )
          ]),
        ),
      ),
    );
  }

  Widget topBox(image, url, key) {
    return Stack(
      key: ValueKey(key),
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover))),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Images.logo, scale: 8),
              CircleAvatar(child: SVG.use(icon: SVG.settings))
            ],
          ),
        ),
        Positioned(
          left: ScreenSize.width * .05,
          bottom: 10,
          child: InkWell(
            splashColor: MyColor.black,
            hoverColor: MyColor.black,
            onTap: () => url(),
            child: Container(
                alignment: Alignment.center,
                width: ScreenSize.width * .85,
                height: 50,
                decoration: BoxDecoration(
                  color: MyColor.white.withOpacity(.4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Word.login,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: Font.myFont,
                            color: MyColor.white)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SlideTransition(
                        position: offset,
                        child: RotatedBox(
                            quarterTurns: 90,
                            child: SVG.use(
                                icon: SVG.back, color: MyColor.white)),
                      ),
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
