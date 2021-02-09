import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/entity/food_entity.dart';
import 'package:flutter_food_delivery/detail.dart';

var foodEntity = [
  FoodEntity(
      imageAsset: 'images/steakwagyu.webp',
      nama: 'Steak Wagyu',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/igabakar.webp',
      nama: 'Iga Bakar',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/ayamgeprek.webp',
      nama: 'Ayam Geprek',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/bakso.webp',
      nama: 'Bakso Sapi',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/pizza.webp',
      nama: 'Pizza',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/burger.webp',
      nama: 'Beef Burger',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/bakmi.webp',
      nama: 'Bakmi Ayam',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/kopisusu.webp',
      nama: 'Kopi Susu Gula Aren',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
  FoodEntity(
      imageAsset: 'images/thaitea.webp',
      nama: 'Thai Tea',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      ''),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Permana Food',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Dancing',
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Pilih menu yang kamu suka'),
                  Row(
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Filter')
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView(
              children: foodEntity.map((food) {
                return FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailScreen(foodEntity: food);
                        }));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0)),
                          child: Image.asset(
                            food.imageAsset,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    food.nama,
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\Rp' + food.harga,
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    food.rating,
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          color: Colors.greenAccent,
                                          child: Text(
                                            'Free Delivery',
                                            style:
                                            TextStyle(color: Colors.green),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: EdgeInsets.all(6),
                                          color: Colors.red[200],
                                          child: Text(
                                            'Instant Booking',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Bookmark()
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Bookmark extends StatefulWidget {
  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isBookmark ? Icons.favorite : Icons.favorite_border),
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}
