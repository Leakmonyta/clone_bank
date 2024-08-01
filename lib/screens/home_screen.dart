import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('My Cards Page'),
    Text('Statistics Page'),
    Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome back,',
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanya Myroniuk',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CreditCard(),
            SizedBox(height: 20),
            Expanded(
              child: Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250, // Adjust height to make the card bigger
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/images/card.png'),
          fit: BoxFit.contain, // Ensure the image is not cropped
        ),
      ),
    );
  }
}

class TransactionSection extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'title': 'Apple Store', 'subtitle': 'Entertainment', 'amount': '- \$5,99'},
    {'title': 'Spotify', 'subtitle': 'Music', 'amount': '- \$12,99'},
    {'title': 'Money Transfer', 'subtitle': 'Transaction', 'amount': '\$300'},
    {'title': 'Grocery', 'subtitle': 'Shopping', 'amount': '- \$88'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text(transactions[index]['title']!),
            subtitle: Text(transactions[index]['subtitle']!),
            trailing: Text(
              transactions[index]['amount']!,
              style: TextStyle(
                color: transactions[index]['amount']!.startsWith('-')
                    ? Colors.red
                    : Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}
