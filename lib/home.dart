import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/entity/food_entity.dart';
import 'package:flutter_food_delivery/detail.dart';

class HomePage extends StatelessWidget {
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
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Permana Food',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
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
                          return DetailPage(foodEntity: food);
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
                                    '\Rp ' + food.harga,
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
                                            'Gratis Antar',
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
                                            'Promo',
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
        color: Colors.red,
      onPressed: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}

var foodEntity = [
  FoodEntity(
      imageAsset: 'images/steakwagyu.jpg',
      nama: 'Steak Wagyu',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      'Wagyu itu asal katanya dari Wa=Jepang dan Gyu=Daging Sapi.  Di beberapa daerah di Jepang, daging diberi nama sesuai wilayah produksinya, contohnya daging Kobe, Mishima, Matsusaka, Ōmi, dan Sanda. Wagyu memiliki kecenderungan genetik berupa pemarmeran (marbling) tinggi dan memproduksi lemak tak jenuh berminyak dalam jumlah besar. Sapi wagyu terkenal karena pola marmer pada dagingnya dan kualitasnya.Kecenderungan genetik sapi ras Wagyu menghasilkan daging dengan kandungan asam lemak omega-3 dan omega-6 yang lebih tinggi daripada daging sapi pada umumnya. Pemarmeran / marbling (MB) terus-menerus juga memperbaiki rasio lemak tak jenuh tunggal dan lemak jenuh.'),
  FoodEntity(
      imageAsset: 'images/igabakar.jpg',
      nama: 'Iga Bakar',
      harga: '40.000',
      rating: '4.7',
      deskripsi:
      'Iga bakar dengan paduan rempah cokelat yang empuk sangat nikmat jadi menu makan siang dan malam. Paling cocok dijodohkan dengan nasi putih hangat dan juga sambal. Kalau mau lebih kenyang dan sehat, iga bakar juga enak dipadu dengan tumis sayuran yang kaya serat.'),
  FoodEntity(
      imageAsset: 'images/ayamgeprek.jpg',
      nama: 'Ayam Geprek',
      harga: '15.000',
      rating: '4.7',
      deskripsi:
      'Ayam goreng tepung bumbu ala KFC yang digeprek dengan sambal bawang pedas yang bikin nagih. Tersedia level 1-5'),
  FoodEntity(
      imageAsset: 'images/bakso.jpg',
      nama: 'Bakso Sapi',
      harga: '12.000',
      rating: '4.9',
      deskripsi:
      'Bakso sapi dinikmati dengan kuah kaldu gurih yang sangat lezat.'),
  FoodEntity(
      imageAsset: 'images/pizza.jpg',
      nama: 'Pizza',
      harga: '80.000',
      rating: '4.5',
      deskripsi:
      'Pizza pipih yang di atasnya diberi topping saus tomat dan keju, lalu dipanggang di dalam oven. Dilengkapi dengan topping sayuran, daging, dan bumbu.'),
  FoodEntity(
      imageAsset: 'images/burger.jpg',
      nama: 'Beef Burger',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      'Dengan patty yang lembut dan daging yang lezat ditambah keju berlapis-lapis, siapa sangka burger ini akan menjadi menu terfavorit.'),
  FoodEntity(
      imageAsset: 'images/bakmi.jpg',
      nama: 'Bakmi Ayam',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      'Pastinya bikin keluarga ogah beranjak dari meja makan saking enaknya!'),
  FoodEntity(
      imageAsset: 'images/kopisusu.jpg',
      nama: 'Kopi Susu Gula Aren',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      'Terdiri dari campuran kopi dan susu ditambah gula aren.'),
  FoodEntity(
      imageAsset: 'images/thaitea.jpg',
      nama: 'Thai Tea',
      harga: '120.000',
      rating: '4.9',
      deskripsi:
      'Teh ala Thailand yang bikin segeerrrr!'),
];
