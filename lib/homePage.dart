import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Product.dart';



class homePage extends StatefulWidget{
  @override
      _MainStatepage createState() => _MainStatepage();

}

class _MainStatepage extends State<homePage> {

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  List<Product> products = [];
  void _showDialog(BuildContext context) {
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('title'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                    labelText: 'Enter Product Name',
                  ),
                ),
                TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Quantity',
                  ),
                ),
                TextField(
                  controller: controller3,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Price',
                  ),
                ),
                RaisedButton(
                  child: Text('Add'),
                  onPressed: () {
                     products.add(Product(
                        name: controller1.text,
                        q: int.parse(controller2.text),
                        p: double.parse(controller3.text)
                    ));

                    controller1.clear();
                    controller2.clear();
                    controller3.clear();
                    setState(() {

                    });
                  },
                ),
                RaisedButton(
                  child: Text('colse'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

          ),
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Invoice 1'),),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Customer Name:',
            ),
          ),
          Row(
            children: [
              Text('Products:'),
              RaisedButton(
                color: Colors.grey,
                  child: Text('add Product'),
                  onPressed:(){
                    _showDialog(context);
                  }

              ),
            ],
          ),
          Expanded(
            child: ListView.builder(itemCount: products.length,
              itemBuilder:(context,index){
              return Container(
                color: Colors.yellowAccent,
                child: ListTile(
                  title:Text('Price: ${products.elementAt(index).p}'),
                  subtitle: Text('Quantity: ${products.elementAt(index).q}'),
                  leading: Text(' ${products.elementAt(index).name}'),
                ),
              );
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RaisedButton(
                color: Colors.grey,
                child: Text('add Invoice'),

              ),
              RaisedButton(
                color: Colors.grey,
                child: Text('show all Invoices'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

