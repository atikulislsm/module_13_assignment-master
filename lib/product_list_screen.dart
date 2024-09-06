import 'package:flutter/material.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  List<String> productName=['Pullover', 'T-shirt','Sports Dress'];
  List<String> productUnit=['L','L','M'];
  List<String> productColor=['Black','Gray','Black'];
  List<String> productImage=['assets/images/tshirt.jpg', 'assets/images/tshirt.jpg','assets/images/flutter.jpg'];
  List<int> productPrice=[10,20,30];
  List<int> itemcount=[0,0,0];

  void _incrementItem(int index) {
    setState(() {
      itemcount[index]++;
    });
  }
  void _decrementItem(int index) {
    if (itemcount[index] > 0) {
      setState(() {
        itemcount[index]--;
      });
    }
  }
  int _totalPrice(int index){
    return itemcount[index]*productPrice[index];
  }
  int _checkOutTotalPrice(){
    int total=0;
    for(int i=0; i<itemcount.length;i++){
      total +=_totalPrice(i);
    }
    return total;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Product List'),
        centerTitle: true,
        actions: <Widget>[
          Icon(Icons.shopping_bag_outlined),
          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: productName.length,
              itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          height:120 ,
                          width: 120,
                          image: AssetImage(productImage[index].toString()),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(productName[index].toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                              SizedBox(height: 1,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Color: "+productColor[index].toString(), style: TextStyle(fontSize: 10)),
                                  Text("Size: "+productUnit[index].toString(), style: TextStyle(fontSize: 10)),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(onPressed: (){
                                    _decrementItem(index);
                                  }, icon: CircleAvatar(
                                    foregroundColor: Colors.red,
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                      child: Icon(Icons.remove,)),
                                    iconSize: 25,
                                    tooltip: 'remove',
                                  ),
                                  Text('${itemcount[index]}'),
                                  IconButton(
                                    onPressed: (){
                                    _incrementItem(index);
                                  },
                                    icon: CircleAvatar(
                                        foregroundColor: Colors.green,
                                        backgroundColor: Colors.white,
                                        radius: 15,
                                        child: Icon(Icons.add,)),
                                    iconSize: 25,
                                    tooltip: 'remove',
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.more_vert,),
                                SizedBox(height: 40,),
                                Text(r"$"+_totalPrice(index).toString(),  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ))
                              ],
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          })
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Row(
                  children: [
                    Text("Total Price:")
                  ],
                ),
                Row(
                  children: [
                    Text(r"$"+_checkOutTotalPrice().toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
          ), //total Price UI
          SizedBox(height: 10.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 270,
                child: ElevatedButton(
                    onPressed: () => showSnackBar(context),
                    child: Text('Check out', style: TextStyle(color: Colors.white)),style:ElevatedButton.styleFrom(backgroundColor: Colors.amber,)),
              )
            ],
          ) //checkout button
        ],
      ),
    );
  }
  showSnackBar(context) {
    SnackBar snackBar = SnackBar(
      content: const Text(' Congratulation!',
          style: TextStyle(fontSize: 20)),
      backgroundColor: Colors.indigo,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
