import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:ui_monthly_budget_app/json/activity_json.dart';
import 'package:ui_monthly_budget_app/pages/your_balance_page.dart';
import 'package:ui_monthly_budget_app/theme/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Widget _appBarCurve(){
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              primary,
              secondary
            ]
          ),
          boxShadow: [
            BoxShadow(
              color: bgColor.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const YourBalancePage()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            '\$',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white
                            ),
                          ),
                          Text(
                            '1,752',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        'Available balance',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: NetworkImage('https://media.istockphoto.com/photos/dont-see-any-competition-picture-id803616574?b=1&k=20&m=803616574&s=170667a&w=0&h=MqAZWYdCwr-7bIcthfouTFUhdKjlwVwmJaMBtkMVh3k='),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: primary)
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBarBalance(){
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 10,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Spent',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(height: 3,),
                            const Text(
                              '\$1,460',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              color: primary,
                              shape: BoxShape.circle
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Earned',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                            const SizedBox(height: 3,),
                            const Text(
                              '\$3,850',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              const Divider(),
              const SizedBox(height: 5,),
              const Text(
                'You spent \$1.230 on dining out this month. Let\'s try to make it lower',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6
                ),
              ),
              const SizedBox(height: 15,),
              const Text(
                'Tell me more',
                style: TextStyle(
                  fontSize: 15,
                  color: primary,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getActivity(){

    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 15,),
          Wrap(
            spacing: 25,
            children: List.generate(items.length, (index){
              return Container(
                width: (size.width / 3) - 30,
                height: (size.width / 3) - 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.015),
                      spreadRadius: 10,
                      blurRadius: 10,
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            primary,
                            secondary
                          ]
                        )
                      ),
                      child: Center(
                        child: Icon(
                          items[index]['icon'],
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      items[index]['title'],
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _getVerification(){

    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Complete verification',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.015),
                  spreadRadius: 10,
                  blurRadius: 10,
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '60%',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text(
                        '3 of 10 completed',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.04)
                        ),
                      ),
                      Container(
                        width: size.width * 0.5,
                        height: 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        MaterialCommunityIcons.account,
                        color: primary,
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Personal information',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'When you register for an account.',
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'we collect personal information',
                            style: TextStyle(
                              fontSize: 14
                            ),
                          ),
                          SizedBox(height: 12,),
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 15,
                              color: primary,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.account_badge,
                        color: primary,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Row(
                    children: const [
                      Icon(
                        MaterialCommunityIcons.email,
                        color: primary,
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'Confirm email',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getNewsPromo(){

    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'News and promo',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.015),
                  spreadRadius: 10,
                  blurRadius: 10
                )
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/promo_news.png',),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Share and invite your friends',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Invite friends to register on our app. For every user you invite, you will earn up to \$10.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),
                      SizedBox(height: 12,),
                      Text(
                        'Invite Now',
                        style: TextStyle(
                          fontSize: 15,
                          color: primary,
                          fontWeight: FontWeight.w600
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _getBody(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 320,
            child: Stack(
              children: [
                _appBarCurve(),
                _appBarBalance(),
              ],
            ),
          ),
          const SizedBox(height: 35,),
          _getActivity(),
          const SizedBox(height: 35,),
          _getVerification(),
          const SizedBox(height: 35,),
          _getNewsPromo(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: _getBody(),
    );
  }
}
