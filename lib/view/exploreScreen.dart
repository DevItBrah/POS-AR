import 'package:flutter/material.dart';
import 'components/display_place.dart';
import 'components/display_total_price.dart';
import 'components/search_bar_and_filter.dart';

// ✅ Step 1: Category model
class Category {
  final String name;
  final String imageUrl;
  final Color bgcolor;

  Category({required this.name, required this.imageUrl, required this.bgcolor});
}

// ✅ Step 2: Explore Screen
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  // ✅ Step 3: Categories list with image URLs
  final List<Category> categories = [
    Category(name: 'Indian', imageUrl: 'https://as1.ftcdn.net/jpg/03/09/47/20/1000_F_309472026_twmr3O8GgJ3DBkQznhorWcsbL70rHAs0.webp',bgcolor:Colors.green.shade50),
    Category(name: 'American', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG33Jw_WLfurC8idC1n-5SBSUv0YTcUmvsqA&s',bgcolor:Colors.lightBlue.shade50),
    Category(name: 'Russian', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_RpgBqSHgZgiKFQrEczMvypmWUegHmQiMJA&s',bgcolor:Colors.pink.shade50),
    Category(name: 'Turkish', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoM3D-Arb6oz-xzT12nzPuBmGYfqkN10YeFg&s',bgcolor:Colors.orange.shade50),
    Category(name: 'Afghani', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoM3D-Arb6oz-xzT12nzPuBmGYfqkN10YeFg&s',bgcolor:Colors.green.shade50),
    Category(name: 'Arabian', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoM3D-Arb6oz-xzT12nzPuBmGYfqkN10YeFg&s',bgcolor:Colors.lightBlue.shade50),
    Category(name: 'Kurdish', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoM3D-Arb6oz-xzT12nzPuBmGYfqkN10YeFg&s',bgcolor:Colors.orange.shade50),
    Category(name: 'Italian', imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoM3D-Arb6oz-xzT12nzPuBmGYfqkN10YeFg&s',bgcolor:Colors.pink.shade50),
  ];

  // ✅ Selected category
  String selectedCategory = 'All';

  void onCategoryTap(String categoryName) {
    setState(() {
      selectedCategory = categoryName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:20),
              const SearchBarAndFilter(),
              const SizedBox(height: 25),
              Stack(
                children: [
                  const Positioned(
                    left: 0,
                    right: 0,
                    top: 80,
                    child: Divider(color: Colors.black12),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final isSelected = category.name == selectedCategory;

                        return GestureDetector(
                          onTap: () => onCategoryTap(category.name),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : category.bgcolor, // ✅ Use category color here
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(shape: BoxShape.circle),
                                  child: ClipOval(
                                    child: Image.network(
                                      category.imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  category.name,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              DisplayTotalPrice(),
              SizedBox(height:20),
              DisplayPlace(),
            ],
          ),
        ),
      ),
    );
  }
}
