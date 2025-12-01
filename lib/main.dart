import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // เริ่ม App
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresentMe',
      theme: ThemeData(
        fontFamily: 'Prompt', // ตั้ง Font ของแอป
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple), // ธีมสี
      ),
      debugShowCheckedModeBanner: false, // ไม่แสดง Debug Banner
      initialRoute: '/', // หน้าเริ่มต้น
      routes: {
        '/': (context) => const MyHomePage(), // หน้าแรก
        '/PersonalData': (context) => const SecondPage(), // หน้า Instagram Page (SecondPage)
      },
    );
  }
}

// ----------------- HOME PAGE -----------------
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // พื้นหลังหน้า
      body: Column(
        children: [
          // ----------------- HEADER PROFILE -----------------
          Container(
            width: double.infinity,
            color: Colors.grey[200], // สีพื้น Header
            padding: const EdgeInsets.only(top: 50, bottom: 40), // เว้นระยะบน-ล่าง
            child: Column(
              children: [
                const Text(
                  "Personal Information", // ชื่อ section
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // รูป Profile
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 4), // ขอบรูป
                  ),
                  child: ClipOval(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover, // ครอบรูปให้เต็มวงกลม
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // ชื่อผู้ใช้
                const Text(
                  "Thawichai Klaewkla",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),

                // Email
                const Text(
                  "Thawichai.klaekle@e-tech.ac.th",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // ----------------- BODY CONTENT -----------------
          Expanded(
            child: SingleChildScrollView( // Scroll ได้
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // ----------------- PERSONAL DETAILS CARD -----------------
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
                              "Personal Details", // หัวข้อ card
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // ----------------- PHONE -----------------
                            rowItem(Icons.phone, "Phone", "097-937-7374"),

                            const SizedBox(height: 16),

                            // ----------------- BIRTHDAY -----------------
                            rowItem(Icons.cake, "Birthday", "30 Nov 2005"),

                            const SizedBox(height: 16),

                            // ----------------- ADDRESS -----------------
                            rowItem(Icons.home, "Address", "PhanThong, Chonburi"),

                            const SizedBox(height: 16),

                            // ----------------- EDUCATION -----------------
                            rowItem(Icons.school, "Education",
                                "Eastern College of Technology"),

                            const SizedBox(height: 16),

                            // ----------------- POSITION -----------------
                            rowItem(Icons.work, "Position", "Developer"),
                          ],
                        ),
                      ),
                    ),

                    // ----------------- NAVIGATION BUTTON -----------------
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/PersonalData'),
                            // กดปุ่ม → ไปหน้า Instagram Page (SecondPage)
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

  // ----------------- HELPER WIDGET -----------------
  Widget rowItem(IconData icon, String title, String detail) {
    // ใช้สร้าง row ของข้อมูลส่วนตัว
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300], // พื้นหลังวงกลม
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 26, color: Colors.black), // Icon แสดงประเภทข้อมูล
        ),
        const SizedBox(width: 16),

        // ข้อความ title + detail
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



class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isFollowing = false; // เก็บสถานะ Follow / Following
  int selectedTab = 0; // เก็บ Tab ที่เลือก (0 = Posts, 1 = Reels)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // สีพื้นหลังของหน้า
      appBar: AppBar(
        backgroundColor: Colors.black, // สี AppBar
        elevation: 0, // เอาเงาออก
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // ปุ่ม Back
          onPressed: () => Navigator.pop(context), // กลับไปหน้าก่อน
        ),
        title: const Text(
          'Thawichai_klaekle',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: _openMoreMenu, // เปิดเมนูเพิ่มเติม
          ),
        ],
      ),
      body: SingleChildScrollView( // ทำให้หน้า Scroll ได้
        child: Column(
          children: [
            const SizedBox(height: 10),

            // ----------------- PROFILE HEADER -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Profile Image → แตะเพื่อเปิด Story Viewer
                  GestureDetector(
                    onTap: () => _openStoryView(), // กดที่รูป → เปิด Story
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.pink, // ขอบวงกลมสีชมพู
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          'https://i.pinimg.com/236x/85/38/7b/85387bd21f562a445e19e381c8f7b2d2.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // ถ้าโหลดรูปไม่สำเร็จ จะแสดง Icon คนแทน
                            return Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey,
                              child: const Icon(Icons.person,
                                  size: 50, color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),

                  // Stats (Posts / Followers / Following)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn("2", "Post"), // จำนวนโพสต์
                        _buildStatColumn("28", "Follower"), // จำนวนผู้ติดตาม
                        _buildStatColumn("32", "Following"), // จำนวนคนที่กำลังติดตาม
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ----------------- USERNAME & BIO -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ชื่อ + Verified
                  Row(
                    children: const [
                      Text(
                        "Thawichai_Klaekle",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.verified, color: Colors.blue, size: 16), // เครื่องหมาย verified
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Bio / TikTok ID
                  Row(
                    children: const [
                      Icon(Icons.tiktok, color: Colors.white, size: 16),
                      SizedBox(width: 6),
                      Text(
                        "thawichai.klaekle",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ----------------- ACTION BUTTONS -----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Follow Button
                  Expanded(
                    child: GestureDetector(
                      onLongPress: _showUnfollowMenu, // กดค้างเพื่อ Unfollow
                      child: ElevatedButton(
                        onPressed: _toggleFollow, // กดปุ่ม → Follow / Unfollow
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFollowing
                              ? const Color(0xFF262626) // Following → ดำ
                              : Colors.white, // Follow → ขาว
                          foregroundColor:
                          isFollowing ? Colors.white : Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          isFollowing ? "Following" : "Follow",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Invite Button
                  _actionSquareButton(
                    Icons.person_add_outlined,
                    onTap: _openInviteMenu,
                  ),
                  const SizedBox(width: 8),

                  // More Options Button
                  _actionSquareButton(
                    Icons.keyboard_arrow_down,
                    onTap: _openArrowMenu,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ----------------- TAB BAR -----------------
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFF262626), width: 0.5), // เส้นขอบบน
                ),
              ),
              child: Row(
                children: [
                  // Tab 0 → Posts
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => selectedTab = 0); // เลือก Tab Posts
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedTab == 0 ? Colors.white : Colors.transparent, // ขีดใต้ปุ่ม
                              width: 1,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.grid_on_outlined,
                          color: selectedTab == 0 ? Colors.white : const Color(0xFF737373),
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  // Tab 1 → Reels
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => selectedTab = 1); // เลือก Tab Reels
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: selectedTab == 1 ? Colors.white : Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.play_circle_outline,
                          color: selectedTab == 1 ? Colors.white : const Color(0xFF737373),
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ----------------- TAB CONTENT -----------------
            if (selectedTab == 0)
            // TAB 0 → POSTS GRID
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // ให้ Scroll ของ Column ทำงานแทน
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [
                  _imageBox("https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500"),
                  _imageBox("https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500"),
                ],
              )
            else
            // TAB 1 → REELS PAGE
              Container(
                height: 300,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_circle_outline, color: Colors.white, size: 80),
                    SizedBox(height: 12),
                    Text(
                      "Reels",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ----------------- FOLLOW BUTTON FUNCTIONS -----------------
  void _toggleFollow() {
    setState(() => isFollowing = !isFollowing); // สลับสถานะ Follow / Unfollow

    // แสดง SnackBar แจ้งผู้ใช้
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFollowing ? 'Followed' : 'Unfollowed'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void _showUnfollowMenu() {
    if (!isFollowing) return; // ถ้าไม่ได้ Follow → ไม่ทำอะไร

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1A1A), // สีพื้นหลังเมนู
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // ขอบโค้งบน
      ),
      builder: (context) {
        return ListTile(
          title:
          const Text("Unfollow?", style: TextStyle(color: Colors.white)),
          onTap: () {
            Navigator.pop(context);
            setState(() => isFollowing = false); // Unfollow
          },
        );
      },
    );
  }

  // ----------------- MENUS -----------------
  void _openMoreMenu() {
    _openBottomMenu([
      _menuItem(Icons.share, "Share Profile"),
      _menuItem(Icons.link, "Copy Profile URL"),
      _menuItem(Icons.report, "Report"),
    ]);
  }

  void _openInviteMenu() {
    _openBottomMenu([
      _menuItem(Icons.send, "Send to..."),
      _menuItem(Icons.person_add, "Invite Friends"),
    ]);
  }

  void _openArrowMenu() {
    _openBottomMenu([
      _menuItem(Icons.star_border, "Add to Favorites"),
      _menuItem(Icons.lock_outline, "Add to Close Friends"),
      _menuItem(Icons.notifications, "Turn on Notifications"),
    ]);
  }

  void _openBottomMenu(List<ListTile> items) {
    // แสดง Bottom Sheet
    showModalBottomSheet(
      backgroundColor: const Color(0xFF1A1A1A),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [...items, const SizedBox(height: 10)],
        );
      },
    );
  }

  ListTile _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () => Navigator.pop(context), // ปิดเมนู
    );
  }

  // ----------------- STORY VIEWER -----------------
  void _openStoryView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StoryViewer(), // เปิดหน้า Story Viewer
      ),
    );
  }

  // ----------------- HELPER UI -----------------
  Widget _buildStatColumn(String value, String label) {
    // แสดงตัวเลข + label ของ Stat (Posts/Follower/Following)
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }

  Widget _actionSquareButton(IconData icon, {required VoidCallback onTap}) {
    // ปุ่มสี่เหลี่ยมเล็ก ๆ แบบ Instagram
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20),
        onPressed: onTap,
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
      ),
    );
  }

  Widget _imageBox(String url) {
    // กดรูปเพื่อขยายเต็มหน้าจอ
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => FullImagePage(imageUrl: url)));
      },
      child: Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: const Color(0xFF262626),
            child: const Center(
              child: Icon(Icons.error, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}

// ----------------- FULL IMAGE PAGE -----------------
class FullImagePage extends StatelessWidget {
  final String imageUrl;
  const FullImagePage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:
      AppBar(backgroundColor: Colors.black, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(child: Image.network(imageUrl)), // แสดงรูปเต็มจอ
    );
  }
}

// ----------------- STORY VIEWER -----------------
class StoryViewer extends StatelessWidget {
  const StoryViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // กดที่ Story → ปิด
        child: Center(
          child: Image.network(
            'https://i.pinimg.com/736x/0e/82/7f/0e827f69ad902260a4be57095744f4e9.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
