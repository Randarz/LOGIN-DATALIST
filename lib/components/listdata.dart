import 'package:flutter/material.dart';

class ListData extends StatefulWidget {
  final List<String> items = ['Soap', 'Toilet Paper', 'Towel', 'Shampoo', 'Conditioner', 'Detergent', 'Razor', 'Shaving Cream', 'Toothpaste', 'Toothbrush', 'Face Wash', 'Body Lotion', 'Sunscreen', 'Hair Oil', 'Floss'];
  final List<String> stocks = ['263pcs', '420pcs', '103pcs', '64pcs', '140pcs', '40pcs', '74pcs', '129pcs', '300pcs', '174pcs', '231pcs', '431pcs', '224pcs', '127pcs', '131pcs'];
  final List<String> prices = ['Rp.5.000', 'Rp.13.000', 'Rp.19.000', 'Rp.32.000', 'Rp.30.000', 'Rp.22.000', 'Rp.13.000', 'Rp.16.000', 'Rp.9.000', 'Rp.10.000', 'Rp.44.000', 'Rp.32.000', 'Rp.42.000', 'Rp.12.000', 'Rp.37.000'];

  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  late List<bool> expandedItems;

  @override
  void initState() {
    super.initState();
    expandedItems = List.filled(widget.items.length, false);
    _showFakeLandingPage();
  }

  void _showFakeLandingPage() {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return FakeLandingPage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        backgroundColor: Color.fromARGB(244, 10, 23, 169),
      ),
      body: Container(
        color: Color.fromARGB(223, 194, 226, 254), // Adjust the background color as needed
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text((index + 1).toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  title: Text(widget.items[index]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.prices[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      if (expandedItems[index]) Text('Stock: ${widget.stocks[index]}', style: TextStyle(color: Colors.grey[500])),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(expandedItems[index] ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        expandedItems[index] = !expandedItems[index];
                      });
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FakeLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_checkout, 
              size: 100, 
              color: Color.fromARGB(255, 37, 47, 151)
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Sloppy!',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Hope you enjoy your time while shopping with us!',
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(244, 10, 23, 169),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                      Text(
                        "Click here to start shopping!",
                        style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.ads_click_outlined,
                        color: Color.fromARGB(255, 250, 250, 250)
                 ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
