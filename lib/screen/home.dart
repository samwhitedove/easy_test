import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../constants/svg.dart';
import '../widget/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            backgroundColor: MyColor.primaryColor,
            title: Container(),
          ),
        ),
        bottomSheet: Container(
          height: 60,
          color: MyColor.white,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  svgIcon.length, (index) => 
                    navBarItem(icon: svgIcon[index]['icon'], name: svgIcon[index]['name'], index: index,
                     color: selectedIndex == index ? MyColor.textColor : MyColor.textColor.withOpacity(.3)))),
        ),
        // Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 18.0),
        //     child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: List.generate(
        //             svgIcon.length, (index) => navBarItem(icon: svgIcon[index]['icon'], name: svgIcon[index]['name']))),
        //   ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                              color: MyColor.primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Image.asset(Images.champagne, scale: 4),
                        )
                      ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text("Chinenyeze, Bright",
                                  style: TextStyle(
                                      color: MyColor.textColor, fontSize: 16)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: CircleAvatar(
                                  backgroundColor: MyColor.primaryColor,
                                  radius: 15,
                                  child: Image.asset(Images.person, scale: 4)),
                            )
                          ]),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                        constraints: BoxConstraints.tight(Size(double.infinity,
                            MediaQuery.of(context).size.height * .23)),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [MyColor.topStart, MyColor.topEnd],
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                width: MediaQuery.of(context).size.width * .5,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        MyColor.topStart,
                                        MyColor.topEnd.withOpacity(.05)
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10), topLeft: Radius.circular(10))),
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 6.0, left: 20),
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          "Wallet Balance",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: MyColor.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                              Icons.remove_red_eye_outlined,
                                              color: MyColor.white,
                                              size: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, left: 20),
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text(
                                          "N 150,000",
                                          style: TextStyle(
                                              color: MyColor.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(Images.download, scale: 4),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Deposit",
                                          style: TextStyle(
                                              color: MyColor.white,
                                              fontSize: 12)),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Image.asset(Images.pattern, scale: 4),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: MyColor.white.withOpacity(.1),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.elliptical(600, 600),
                                        topRight: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      )),
                                  height:
                                      MediaQuery.of(context).size.height * .25,
                                  width:
                                      MediaQuery.of(context).size.width * .48,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40.0, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        const Text("Account Number",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: MyColor.white,
                                                fontWeight: FontWeight.w300)),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 4.0),
                                          child: Text("234-322-2222",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: MyColor.white)),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .31,
                    child: Column(
                      children: [
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.only(top: 10),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: List.generate(
                                data.length,
                                (index) => itemBox(
                                    image: data[index]['image'],
                                    text: data[index]['name'])),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text('Latest Promo',
                            style: TextStyle(
                                fontSize: 18,
                                color: MyColor.primaryColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Image.asset(Images.gifts, scale: 4),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ]),
              ),
              bannerBox(),
              const SizedBox(
                height: 10,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: List.generate(
              //       banner.length,
              //       (index) => Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 2.0),
              //             child: AnimatedContainer(
              //               width: currentIndex == index ? 30 : 15,
              //               height: 5,
              //               decoration: BoxDecoration(
              //                   color: currentIndex == index
              //                       ? MyColor.textColor
              //                       : MyColor.grey,
              //                   borderRadius: BorderRadius.circular(8)),
              //               duration: const Duration(milliseconds: 400),
              //             ),
              //           )),
              // )
              CustomWidget.pageDot(size: banner.length, currentIndex: currentIndex, color: MyColor.textColor)
            ],
          ),
        ));
  }

  Widget itemBox({image, text}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: MyColor.grey.withOpacity(.33),
              offset: const Offset(1, 1),
              blurRadius: 4,
              spreadRadius: 1)
        ], color: MyColor.white, borderRadius: BorderRadius.circular(10)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(image, scale: 4),
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
    );
  }

  Widget slider({int? index}) {
    return Container(
        margin: EdgeInsets.only(right: index == 0 ? 0 : 20, left: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        width: MediaQuery.of(context).size.width * .7,
        child: Image.asset(banner[index!]));
  }

  int currentIndex = 0;

  var data = [
    {'image': Images.send, 'name': 'Send Money'},
    {'image': Images.airtime, 'name': 'Airtime'},
    {'image': Images.data, 'name': 'Data'},
    {'image': Images.utility, 'name': 'Utility'},
    {'image': Images.cable, 'name': 'Cable Tv'},
    {'image': Images.piggy, 'name': 'Save Money'},
  ];

  var banner = [Images.banner1, Images.banner2];

  CarouselController controller = CarouselController();
  Widget bannerBox() {
    return CarouselSlider(
        carouselController: controller,
        items: List.generate(banner.length, (index) => slider(index: index)),
        options: CarouselOptions(
          // height: 200,
          aspectRatio: 3,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          pageSnapping: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          disableCenter: true,
          padEnds: false,
          onPageChanged: (index, controller) {
            setState(() {
              currentIndex = index;
            });
          },
          scrollDirection: Axis.horizontal,
        ));
  }

  List<Map<String, String>> svgIcon = [
    {'icon': SVG.home, 'name': 'Home'},
    {'icon': SVG.payment, 'name': 'Payments'},
    {'icon': SVG.transactions, 'name': 'Transactions'},
    {'icon': SVG.cards, 'name': 'Cards'},
  ];

  changeValue(index){
    setState(() {
        selectedIndex = index;
    });
  }
  int selectedIndex = 0;
  GestureDetector navBarItem({String? icon, String? name, Color? color, int? index}) {
    return GestureDetector(
      onTap: ()=> changeValue(index!),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedScale(
            curve: Curves.elasticInOut,
            duration: const Duration(milliseconds: 200),
            scale: 1,
            child: SVG.use(icon: icon, color: color, height: 25)
          ),
          Padding(
            padding: const EdgeInsets.only(top:2.0),
            child: Text(name!, style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w600),),
          )
        ],
      ),
    );
  }
}
