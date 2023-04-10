import 'package:flutter/material.dart';
import 'package:leaf_snap/constants.dart';
import 'package:leaf_snap/ui/login_page.dart';
import 'package:leaf_snap/ui/root_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(
      //         right: 20.0,
      //         top: 20.0,
      //       ),
      //       child: InkWell(
      //         onTap: () {
      //           Navigator.pushReplacement(
      //               context, MaterialPageRoute(builder: (_) => RootPage()));
      //         },
      //         child: Text(
      //           'skip',
      //           style: TextStyle(
      //             color: Colors.grey,
      //             fontSize: 16.0,
      //             fontWeight: FontWeight.w400,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                //image: 'assets/images/one_.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
                bg: 'assets/images/bg1f.jpg',
              ),
              createPage(
                //image: 'assets/images/iphone.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
                bg: 'assets/images/ip.jpg',
              ),
              createPage(
                //image: 'assets/images/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
                bg: 'assets/images/bg3.jpg',
              )
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Constants.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;
                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      // Navigator.pushReplacement(context,
                      //     MaterialPageRoute(builder: (_) => RootPage()));
                    }
                  });
                },
              ),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //color: Constants.primaryColor,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        //color: Constants.primaryColor,
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

//create indicator list

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
//Extra widgets

class createPage extends StatelessWidget {
  //final String image;
  final String title;
  final String description;
  final String bg;
  const createPage({
    super.key,
    //required this.image,
    required this.title,
    required this.description,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(bg), context);
    return Container(
      //adding background image to onboarding screen
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bg),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            //child: Image.asset(image),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              //color: Constants.primaryColor,
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
