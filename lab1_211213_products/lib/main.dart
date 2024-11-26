import 'package:flutter/material.dart';

void main() {
  runApp(ClothingApp());
}

class ClothingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        cardColor: Colors.blue.shade100,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> clothes = [
    {
      'name': 'Replay T-Shirt',
      'image': 'https://www.scottsmenswear.com/images/imgzoom/59/59682603_xxl.jpg',
      'description': 'Replay black t-shirt for men. Available in sizes S-XL.',
      'price': '\$50'
    },
    {
      'name': 'TheNorthFace Jacket',
      'image': 'https://images.snowleader.com/cdn-cgi/image/f=auto,fit=scale-down,q=85/https://images.snowleader.com/media/catalog/product/cache/1/image/0dc2d03fe217f8c83829496872af24a0/T/H/THEN04770_01_202406130455.jpg',
      'description': 'Comfortable black The North Face jacket for the winter.',
      'price': '\$75'
    },
    {
      'name': 'Calvin Klein T-Shirt',
      'image': 'https://cdn.mainlinemenswear.co.uk/f_auto,q_auto/mainlinemenswear/shopimages/products/166265/Mainimage.jpg',
      'description': 'Classic white shirt for formal events.',
      'price': '\$30'
    },
    {
      'name': 'PHILIPP PLEIN T-Shirt',
      'image': 'https://www.gruppo-mossialos.com/img/product/image/thumbs/preview/2024/06/mtk7443_pjy002n_blk.jpg',
      'description': 'Black t-shirt Philipp Plein that suits perfectly.',
      'price': '\$45'
    },
    {
      'name': 'Lacoste T-Shirt',
      'image': 'https://rustans.com/cdn/shop/files/3209349_01.jpg?v=1711442071&width=1400',
      'description': 'Beautiful red t-shirt Lacoste. Available sizes S-XXL.',
      'price': '\$55'
    },
    {
      'name': 'Armani long sleeve T-Shirt',
      'image': 'https://sharecloth.com/image/cache/catalog/tshirts-men-long-sleeve/armani-black-mens-long%20sleeve-t-shirt-mtop-e7-1024x1024.jpg',
      'description': 'Armani long sleeve t-shirt. Perfect fits for the winter days.',
      'price': '\$80'
    },
    {
      'name': 'Levis T-Shirt',
      'image': 'https://cdn.mainlinemenswear.co.uk/f_auto,q_auto/mainlinemenswear/shopimages/products/159649/Mainimage.jpg',
      'description': 'White t-shirt with Levis logo in front.',
      'price': '\$35'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text('211213'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(item: item),
                ),
              );
            },
            child: Card(
              color: Theme.of(context).cardColor,
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['name']!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(height: 4),
                        Text(item['price']!,
                            style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> item;

  ProductDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: Text(item['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                item['image']!,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(item['name']!,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(item['price']!,
                style: TextStyle(fontSize: 20, color: Colors.red)),
            SizedBox(height: 16),
            Text(item['description']!, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
