import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresentMe',
      theme: ThemeData(
        fontFamily: 'Prompt',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/PersonalData': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.only(top: 50, bottom: 40),
            child: Column(
              children: [
                const Text(
                  "Personal Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 4),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Thawichai Klaewkla",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Thawichai.klaekle@e-tech.ac.th",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey[100],
                      margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Personal Details",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Phone
                            rowItem(Icons.phone, "Phone", "097-937-7374"),

                            const SizedBox(height: 16),

                            // Birthday
                            rowItem(Icons.cake, "Birthday", "30 Nov 2005"),

                            const SizedBox(height: 16),

                            // Address
                            rowItem(Icons.home, "Address", "PhanThong, Chonburi"),

                            const SizedBox(height: 16),

                            // Education
                            rowItem(Icons.school, "Education",
                                "Eastern College of Technology"),

                            const SizedBox(height: 16),

                            // Position
                            rowItem(Icons.work, "Position", "Developer"),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/PersonalData'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Instagram Page'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // UI
  Widget rowItem(IconData icon, String title, String detail) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 26, color: Colors.black),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(detail),
          ],
        ),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0F14),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C0F14),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Instagram Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ----------------- PROFILE HEADER -----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipOval(
                  child: Image.network(
                    'https://i.pinimg.com/236x/85/38/7b/85387bd21f562a445e19e381c8f7b2d2.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                          width: 90,
                          height: 90,
                          color: Colors.grey,
                          child: const Icon(Icons.person, size: 50, color: Colors.white),
                      );
                    },
                  ),
                ),
                _buildStatColumn("5", "กำลังติดตาม"),
                _buildStatColumn("828.1 K", "ผู้ติดตาม"),
                _buildStatColumn("329.9 K", "ถูกใจและบันทึก"),
              ],
            ),

            const SizedBox(height: 20),

            // ----------------- USERNAME -----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Thawichai Klaekla",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 6),
                Icon(Icons.verified, color: Colors.blue, size: 22),
              ],
            ),

            const SizedBox(height: 4),
            const Text(
              "@jxmsxx",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),

            const SizedBox(height: 20),

            // ----------------- FOLLOW BUTTON -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ติดตามแล้ว!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "ติดตาม",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.share, color: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('แชร์โปรไฟล์'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ----------------- TAB BAR -----------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      child: const Icon(Icons.grid_on, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Icon(Icons.video_collection, color: Colors.grey,),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ----------------- IMAGE GRID -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: [
                  _imageBox(
                    "https://i.pinimg.com/236x/85/38/7b/85387bd21f562a445e19e381c8f7b2d2.jpg",
                    "329.9K",
                  ),
                  _imageBox(
                    "https://i.pinimg.com/originals/f2/ab/c8/f2abc8b55e51b77b0fda0a58d66b9f59.jpg",
                    "245.2K",
                  ),
                  _imageBox(
                    "https://i.pinimg.com/236x/85/38/7b/85387bd21f562a445e19e381c8f7b2d2.jpg",
                    "189.5K",
                  ),
                  _imageBox(
                    "https://i.pinimg.com/originals/f2/ab/c8/f2abc8b55e51b77b0fda0a58d66b9f59.jpg",
                    "156.8K",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Helper widget for stats column
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  // Helper widget for image box with likes overlay
  Widget _imageBox(String url, String likes) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image.network(
            url,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                  color: Colors.grey,
                  child: const Center(
                  child: Icon(Icons.error, color: Colors.white),
              ),
              );
            },
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.favorite, color: Colors.red, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    likes,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
