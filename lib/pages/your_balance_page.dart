import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ui_monthly_budget_app/container/chart_line.dart';
import 'package:ui_monthly_budget_app/json/category_json.dart';
import 'package:ui_monthly_budget_app/json/merchant_json.dart';
import 'package:ui_monthly_budget_app/theme/colors.dart';

class YourBalancePage extends StatefulWidget {
  const YourBalancePage({Key? key}) : super(key: key);

  @override
  State<YourBalancePage> createState() => _YourBalancePageState();
}

class _YourBalancePageState extends State<YourBalancePage> {

  Widget _getAppBar(){
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 22,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(top: 15, right: 15),
          child: Text(
            'Set budget',
            style: TextStyle(
              color: primary,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ],
    );
  }

  Widget _getBalance(){
    return Center(
      child: Column(
        children: const [
          Text(
            'Your balance is \$1,752',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'By this time last month, you spent\n slightly higher (\$2,450)',
            style: TextStyle(
              fontSize: 14,
              height: 1.6
            ),
          )
        ],
      ),
    );
  }

  Widget _getChartAndBalance(){
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: LineChart(activityData()),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120, left: 20, right: 20),
            width: double.infinity,
            height: 80,
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
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
            ),
          )
        ],
      ),
    );
  }

  Widget _getTopMerchants(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top merchant',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
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
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.network(merchantList[index]['img']),
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  merchantList[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  merchantList[index]['transaction'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black.withOpacity(0.5)
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          merchantList[index]['price'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12,),
                    const Divider()
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _getTopCategories(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top category',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(categoryList.length, (index){
                return Container(
                  margin: const EdgeInsets.only(right: 15),
                  width: 150,
                  height: 220,
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
                    padding: const EdgeInsets.only(right: 15, left: 15, bottom: 0, top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          width: 80,
                          child: CircleProgressBar(
                            foregroundColor: primary,
                            backgroundColor: Colors.black.withOpacity(0.1),
                            value: categoryList[index]['percentage'],
                            child: Center(
                              child: Text(
                                categoryList[index]['img'],
                                style: const TextStyle(
                                  fontSize: 22
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Text(
                          categoryList[index]['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          categoryList[index]['price'],
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Center(
                            child: Text(
                              'on track',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.7)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
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
          const SizedBox(height: 20,),
          _getBalance(),
          const SizedBox(height: 20,),
          _getChartAndBalance(),
          const SizedBox(height: 30,),
          _getTopMerchants(),
          const SizedBox(height: 10,),
          _getTopCategories(),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: _getAppBar(),
      ),
      body: _getBody(),
    );
  }
}
