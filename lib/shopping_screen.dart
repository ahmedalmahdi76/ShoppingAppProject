import 'package:flutter/material.dart';
import 'package:shopping_project/classes.dart';
import 'package:easy_localization/easy_localization.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

enum Category { dairy, meat, vegs }

class _ShoppingScreenState extends State<ShoppingScreen> {
// Initial selected category
  Category _selectedCategory = Category.dairy;
  final Map<Category, List<Map<String, dynamic>>> _categoryProducts = {
    Category.dairy: [
      {
        'title': 'Fresh Milk',
        'asset': 'assets/images/cow/milk.jpg',
        'price': 34.9,
      },
      {
        'title': 'Organic Yogurt',
        'asset': 'assets/images/cow/yogurt.jpg',
        'price': 22.5,
      },
      {
        'title': 'Cheddar Cheese',
        'asset': 'assets/images/cow/cheese.jpg',
        'price': 99.0,
      },
      {
        'title': 'Farm Eggs',
        'asset': 'assets/images/cow/eggs.jpg',
        'price': 64.0,
      },
      {
        'title': 'Pure Honey',
        'asset': 'assets/images/cow/honey.jpg',
        'price': 120.0,
      },
      {
        'title': 'Butter Bread',
        'asset': 'assets/images/cow/bread.jpg',
        'price': 29.0,
      },
    ],
    Category.meat: [
      {
        'title': 'Prime Beef',
        'asset': 'assets/images/meat/meat.jpg',
        'price': 219.0,
      },
      {
        'title': 'Fresh Chicken',
        'asset': 'assets/images/meat/chicken.jpg',
        'price': 89.9,
      },
      {
        'title': 'Tuna Pack',
        'asset': 'assets/images/meat/tuna.jpg',
        'price': 41.0,
      },
    ],
    Category.vegs: [
      {
        'title': 'Tomato',
        'asset': 'assets/images/vegs/tomato.jpg',
        'price': 12.0,
      },
      {
        'title': 'Potato',
        'asset': 'assets/images/vegs/potato.jpg',
        'price': 10.0,
      },
      {
        'title': 'Carrot',
        'asset': 'assets/images/vegs/carrot.jpg',
        'price': 15.0,
      },
      {
        'title': 'Lettuce',
        'asset': 'assets/images/vegs/lattuce.jpg',
        'price': 18.0,
      },
      {
        'title': 'Eggplant',
        'asset': 'assets/images/vegs/btengan.jpg',
        'price': 16.0,
      },
      {
        'title': 'Pineapple',
        'asset': 'assets/images/vegs/pineapple.jpg',
        'price': 35.0,
      },
    ],
  };
// Sample hot offers data
  final List<Map<String, dynamic>> _hotOffers = [
    {
      'title': 'Limited-time offer #1',
      'asset': 'assets/images/cow/cheese.jpg',
      'oldPrice': 18.0,
      'price': 12.0,
    },
    {
      'title': 'Limited-time offer #2',
      'asset': 'assets/images/vegs/potato.jpg',
      'oldPrice': 14.0,
      'price': 10.0,
    },
    {
      'title': 'Limited-time offer #3',
      'asset': 'assets/images/meat/meat.jpg',
      'oldPrice': 20.0,
      'price': 15.0,
    },
    {
      'title': 'Limited-time offer #4',
      'asset': 'assets/images/cow/honey.jpg',
      'oldPrice': 24.0,
      'price': 18.0,
    },
    {
      'title': 'Limited-time offer #5',
      'asset': 'assets/images/vegs/pineapple.jpg',
      'oldPrice': 42.0,
      'price': 35.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // AppBar with title and action buttons
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(tr('app_Title',), style: TextStyles.header3),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // Toggle between English and Arabic
              if (context.locale.languageCode == 'en') {
                context.setLocale(const Locale('ar', 'EG'));
              } else {
                context.setLocale(const Locale('en', 'US'));
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            onPressed: () {},
          ),
        ],
      ),
      //scrollable body with categories and products
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text(tr('homeTitle'), style: TextStyles.line)),
            SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() => _selectedCategory = Category.meat);
                    },
                    //meat category image
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/meat/category.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  //vegs category image
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() => _selectedCategory = Category.vegs);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/vegs/vegs.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  //dairy category image
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() => _selectedCategory = Category.dairy);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/cow/dairy.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr('products'), style: TextStyles.line),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Products grid based on selected category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: _categoryProducts[_selectedCategory]!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.74,
                ),
                itemBuilder: (context, index) {
                  final product = _categoryProducts[_selectedCategory]![index];
                  // Individual product card
                  return Card(
                    color: Colors.white,
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product['asset'] as String,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product['title'] as String,
                              style: TextStyles.body,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE8F5E9),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'EGP ${(((product['price']) as num?)?.toDouble() ?? 0).toStringAsFixed(1)}',
                                  style: const TextStyle(
                                    color: Color(0xFF2E7D32),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            //span full width button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 37, 137, 40),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        tr('itemAddedToCart'),
                                        style: TextStyle(
                                          fontFamily: 'CaviarDreams',
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: const Color(0xFF2E7D32),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add_shopping_cart, size: 18),
                                //add to cart text
                                label: Text(
                                  tr('addToCart'),
                                  style: TextStyle(
                                    fontFamily: 'CaviarDreams',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Hot Offers section
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr('hotOffers'), style: TextStyles.line),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Hot offers list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: _hotOffers.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final offer = _hotOffers[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            offer['asset']!,
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(offer['title']!, style: TextStyles.body),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'EGP ${(((offer['oldPrice']) as num?)?.toDouble() ?? 0).toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE8F5E9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'EGP ${(((offer['price']) as num?)?.toDouble() ?? 0).toStringAsFixed(1)}',
                                      style: const TextStyle(
                                        color: Color(0xFF2E7D32),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 37, 137, 40),
                                    foregroundColor: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                      content: Text(
                                        tr('itemAddedToCart'),
                                          style: TextStyle(
                                            fontFamily: 'CaviarDreams',
                                            color: Colors.white,
                                          ),
                                        ),
                                        backgroundColor: const Color(0xFF2E7D32),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(14),
                                        ),
                                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.add_shopping_cart, size: 18),
                                  label: Text(
                                    tr('addToCart'),
                                    style: TextStyle(
                                      fontFamily: 'CaviarDreams',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ],
        ),
      ),
    );
  }
}
