import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet/util/my_button.dart';
import 'package:wallet/util/my_card.dart';
import 'package:wallet/util/my_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //page controller
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.monetization_on,
          size: 32),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  Icons.home,
                  size: 32,
                  color: Colors.blue,
                  )
                ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.grey,)
                ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Cards',
                  style: TextStyle(fontSize: 28),
                ),
      
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add)),
              ],
            ),
            ),
            SizedBox(height: 25),
      
            //Cards
            Container(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                children: [
                  MyCard(
                    balance: 525.20,
                    cardnumber: 123456789,
                    expiryMonth: 09,
                    expiryYear: 25,
                    color: Colors.deepPurple[300],
                  ),
                  MyCard(
                    balance: 525.20,
                    cardnumber: 987654321,
                    expiryMonth: 08,
                    expiryYear: 27,
                    color: Colors.blue[300],
                  ),
                  MyCard(
                    balance: 525.20,
                    cardnumber: 567894321,
                    expiryMonth: 10,
                    expiryYear: 28,
                    color: Colors.green[300],
                  ),
                ]
              ),
            ),
            SizedBox(height: 25),
      
            SmoothPageIndicator(
              controller: _controller, 
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Colors.grey.shade800,
              ),
              ),
      
              SizedBox(height: 20),
      
              // 3 buttons -> send + pay + bills
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //send button
                    MyButton(
                    iconImagePath: 'lib/icons/send.jpg',
                    buttonText: 'Send',
                    ),
                    // pay button
                    MyButton(
                    iconImagePath: 'lib/icons/pay.jpg',
                    buttonText: 'Pay',
                    ),
                    //bills button
                    MyButton(
                    iconImagePath: 'lib/icons/bill.jpg',
                    buttonText: 'Bills',
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 40),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    //statistics
      
                    MyListTile(
                      iconImagePath: 'lib/icons/statistics.jpg', 
                      titleTitle: ' Statistics', 
                      titleSubtitle: ' Payment and Income'),
      
      
                    //transaction
      
                    MyListTile(
                      iconImagePath: 'lib/icons/statistics.jpg', 
                      titleTitle: 'Transaction', 
                      titleSubtitle: 'Transaction History'),
                  ],
                ),
              )
      
            
          ],
        ),
      ),
    );
  }
}