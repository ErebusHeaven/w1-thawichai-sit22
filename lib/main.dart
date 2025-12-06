import 'package:flutter/material.dart';
// นำเข้า Material Design library ของ Flutter สำหรับ UI พื้นฐาน

void main() {
  runApp(const MyApp());
  // จุดเริ่มต้นของแอป → สั่งให้ Flutter render widget MyApp เป็นตัวแรก
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // StatelessWidget = widget ที่ไม่มี state เปลี่ยนแปลง

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresentMe', // ชื่อแอป
      theme: ThemeData(
        fontFamily: 'Prompt', // ตั้งฟอนต์ทั้งแอปเป็น Prompt
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        // ใช้สีหลักเป็นสีม่วง แล้ว generate palette ให้ทั้งแอป
      ),
      debugShowCheckedModeBanner: false, // ซ่อนป้าย DEBUG มุมขวาบน

      initialRoute: '/', // route ที่จะถูกเปิดเป็นตัวแรก

      routes: {
        '/': (context) => const MyHomePage(), // หน้าแรกของแอป
        '/PersonalData': (context) => const SecondPage(),
        // หน้าโปรไฟล์ Instagram แบบกำหนดเอง
      },
    );
  }
}

// -----------------------------------------------------------------------------
// หน้าแรก MyHomePage
// -----------------------------------------------------------------------------
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // <<< เพิ่ม SafeArea ที่ครอบ Scaffold ทั้งหน้า
      child: Scaffold(
        backgroundColor: Colors.grey[50], // สีพื้นหลังของหน้า

        body: Column( // Layout แนวตั้ง
          children: [
            // -------------------------------------------------------------------
            // ส่วน Header (โปรไฟล์ด้านบน)
            // -------------------------------------------------------------------
            Container(
              width: double.infinity, // ให้กว้างเต็มหน้าจอ
              color: Colors.grey[200], // สีพื้นหลังของส่วน Header
              padding: const EdgeInsets.only(top: 50, bottom: 40),
              // เว้นระยะห่างด้านบนและล่าง
              child: Column(
                children: [
                  const Text(
                    "Personal Information", // ข้อความหัวข้อหน้า
                    style: TextStyle(
                      fontSize: 24, // ขนาดตัวอักษรใหญ่
                      fontWeight: FontWeight.bold, // ตัวหนา
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 20), // เว้นระยะห่าง

                  // ------------------ รูปโปรไฟล์ ------------------
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // รูปวงกลม
                      border: Border.all(color: Colors.grey, width: 4),
                      // เส้นขอบสีเทา
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
                        // รูปโปรไฟล์จากอินเทอร์เน็ต
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover, // ครอบรูปให้เต็มวงกลม
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ------------------ ชื่อผู้ใช้ ------------------
                  const Text(
                    "Thawichai Klaewkla",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // ------------------ Email ------------------
                  const Text(
                    "Thawichai.klaekle@e-tech.ac.th",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // -------------------------------------------------------------------
            // ส่วน Body ที่เลื่อน Scroll ได้
            // -------------------------------------------------------------------
            Expanded(
              child: SingleChildScrollView( // เพื่อให้เลื่อนเนื้อหาได้
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // padding รอบๆทั้งหมด
                  child: Column(
                    children: [
                      // -----------------------------------------------------------
                      // Card แสดงข้อมูลส่วนตัว
                      // -----------------------------------------------------------
                      Card(
                        color: Colors.grey[100], // สีพื้นหลังของการ์ด
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ), // เว้นระยะการ์ดจากขอบ
                        child: Padding(
                          padding: const EdgeInsets.all(16.0), // padding ภายในการ์ด
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Personal Details",
                                // หัวข้อการ์ด
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

                      // -----------------------------------------------------------
                      // ปุ่มไปหน้า Instagram Page
                      // -----------------------------------------------------------
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // จัดปุ่มให้อยู่กลาง
                          children: [
                            ElevatedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/PersonalData'),
                              // เมื่อกด → เปลี่ยนหน้าไป SecondPage

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                // สีปุ่ม
                                foregroundColor: Colors.white,
                                // สีตัวอักษรบนปุ่ม
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
      ),
    ); // <<< ปิด SafeArea
  }

  // ---------------------------------------------------------------------------
  // Widget ช่วยสร้างแถวข้อมูล (icon + title + detail)
  // ---------------------------------------------------------------------------
  Widget rowItem(IconData icon, String title, String detail) {
    return Row(
      children: [
        // ------------------ ไอคอนวงกลม ------------------
        Container(
          padding: const EdgeInsets.all(10), // padding ภายใน
          decoration: BoxDecoration(
            color: Colors.grey[300], // พื้นหลังเทาอ่อน
            shape: BoxShape.circle, // ทำให้เป็นวงกลม
          ),
          child: Icon(icon, size: 26, color: Colors.black),
          // ไอคอนตรงกลาง
        ),

        const SizedBox(width: 16), // เว้นระหว่าง icon กับข้อความ

        // ------------------ ข้อความ ------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            // title เช่น Phone / Address
            Text(detail), // ค่ารายละเอียด
          ],
        ),
      ],
    );
  }
}


// ----------------- SECOND PAGE (Instagram-like) ----------------- //
// หน้า SecondPage เป็น StatefulWidget เพราะมีสถานะ (Follow, selectedTab)
class SecondPage extends StatefulWidget {
  const SecondPage({super.key}); // คอนสตรักเตอร์

  @override
  State<SecondPage> createState() => _SecondPageState(); // สร้าง state
}

class _SecondPageState extends State<SecondPage> {
  bool isFollowing = false; // เก็บสถานะว่า Follow อยู่หรือไม่ (เริ่มต้น false)
  int selectedTab = 0; // เก็บ Tab ที่เลือก (0 = Posts, 1 = Reels)

  @override
  Widget build(BuildContext context) {
    return Scaffold( // โครงสร้างพื้นฐานของหน้า
      backgroundColor: Colors.black, // ตั้งสีพื้นหลังของหน้าเป็นดำ
      appBar: AppBar( // สร้าง AppBar ด้านบน
        backgroundColor: Colors.black, // สี AppBar เป็นดำเข้ากับธีม
        elevation: 0, // เอาเงาใต้ AppBar ออก
        leading: IconButton( // ปุ่มนำทางด้านซ้าย (Back)
          icon: const Icon(Icons.arrow_back, color: Colors.white), // ไอคอนลูกศรย้อนกลับ สีขาว
          onPressed: () => Navigator.pop(context), // เมื่อกด → กลับไปหน้าก่อนหน้า
        ),
        title: const Text(
          'Thawichai_klaekle', // ชื่อผู้ใช้ที่แสดงบน AppBar
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [ // ปุ่มด้านขวาของ AppBar
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white), // ไอคอนเมนูเพิ่มเติม
            onPressed: _openMoreMenu, // เมื่อกด → เรียกเมนูเพิ่มเติม
          ),
        ],
      ),

      // ⭐⭐⭐ เพิ่ม SafeArea แบบคลุมทั้งส่วนของ body ⭐⭐⭐
      body: SafeArea(
        child: SingleChildScrollView( // ทำให้เนื้อหาทั้งหมดสามารถเลื่อนลงได้
          child: Column(
            children: [
              const SizedBox(height: 10), // ช่องว่างด้านบนเล็กน้อย

              // ----------------- PROFILE HEADER -----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // เว้นขอบซ้ายขวา
                child: Row( // วางรูปโปรไฟล์กับสถิติเป็นแนวนอน
                  children: [
                    // Profile Image → แตะเพื่อเปิด Story Viewer
                    GestureDetector(
                      onTap: () => _openStoryView(), // เมื่อกดที่รูป → เปิด Story viewer
                      child: Container(
                        decoration: BoxDecoration( // กำหนดการตกแต่งให้กับรอบรูป
                          shape: BoxShape.circle, // ให้เป็นวงกลม
                          border: Border.all( // ขอบวงกลม
                            color: Colors.pink, // สีขอบเป็นชมพู
                            width: 2, // ความหนาขอบ 2
                          ),
                        ),
                        child: ClipOval( // ตัดรูปให้เป็นวงกลมจริง ๆ
                          child: Image.network(
                            'https://i.pinimg.com/236x/85/38/7b/85387bd21f562a445e19e381c8f7b2d2.jpg', // ลิงก์รูป
                            width: 80, // ความกว้างรูป
                            height: 80, // ความสูงรูป
                            fit: BoxFit.cover, // ครอบรูปเต็มพื้นที่
                            errorBuilder: (context, error, stackTrace) { // ถ้าดึงรูปไม่สำเร็จ
                              // ถ้าโหลดรูปไม่สำเร็จ จะแสดง Icon คนแทน
                              return Container(
                                width: 80, // กำหนดขนาดทดแทน
                                height: 80,
                                color: Colors.grey, // พื้นหลังสีเทา
                                child: const Icon(Icons.person,
                                    size: 50, color: Colors.white), // ไอคอนคน
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30), // ช่องว่างระหว่างรูปกับสถิติ

                    // Stats (Posts / Followers / Following)
                    Expanded( // ขยายคอลัมน์สถิติให้ใช้พื้นที่ที่เหลือ
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround, // กระจายช่องว่างเท่า ๆ กัน
                        children: [
                          _buildStatColumn("2", "Post"), // จำนวนโพสต์
                          _buildStatColumn("28", "Follower"), // จำนวนผู้ติดตาม
                          _buildStatColumn("32", "Following"), // จำนวนที่กำลังติดตาม
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12), // ช่องว่างถัดมา

              // ----------------- USERNAME & BIO -----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // เว้นซ้ายขวา
                child: Column( // จัดข้อความชื่อและ bio เป็นแนวตั้ง
                  crossAxisAlignment: CrossAxisAlignment.start, // จัดชิดซ้าย
                  children: [
                    // ชื่อ + Verified
                    Row(
                      children: const [
                        Text(
                          "Thawichai_Klaekle", // ข้อความชื่อผู้ใช้
                          style: TextStyle(
                            fontSize: 15, // ขนาดฟอนต์
                            color: Colors.white, // สีขาว
                            fontWeight: FontWeight.w600, // น้ำหนักตัวอักษร
                          ),
                        ),
                        SizedBox(width: 6), // ช่องว่างเล็กระหว่างชื่อกับไอคอน
                        Icon(Icons.verified, color: Colors.blue, size: 16), // เครื่องหมาย verified สีฟ้า
                      ],
                    ),
                    const SizedBox(height: 4), // ช่องว่างเล็ก

                    // Bio / TikTok ID
                    Row(
                      children: const [
                        Icon(Icons.tiktok, color: Colors.white, size: 16), // ไอคอน TikTok (หากมี)
                        SizedBox(width: 6), // ช่องว่าง
                        Text(
                          "thawichai.klaekle", // ข้อความแสดง ID หรือ bio สั้น ๆ
                          style: TextStyle(
                            color: Colors.white70, // สีขาวโปร่งแสง
                            fontSize: 14, // ขนาดฟอนต์
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16), // ช่องว่าง

              // ----------------- ACTION BUTTONS -----------------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16), // เว้นซ้ายขวาของปุ่ม
                child: Row( // แถวสำหรับปุ่ม Follow / Invite / More
                  children: [
                    // Follow Button
                    Expanded( // ให้ปุ่ม Follow ขยายเต็มพื้นที่ที่เหลือ
                      child: GestureDetector(
                        onLongPress: _showUnfollowMenu, // กดค้างเพื่อแสดงเมนู Unfollow
                        child: ElevatedButton( // ปุ่มหลัก Follow / Following
                          onPressed: _toggleFollow, // เมื่อกด → สลับสถานะ Follow
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isFollowing
                                ? const Color(0xFF262626) // หากกำลัง Following ให้ปุ่มเป็นสีเข้ม
                                : Colors.white, // หากยังไม่ได้ Follow ให้เป็นสีขาว
                            foregroundColor:
                            isFollowing ? Colors.white : Colors.black, // สีตัวอักษรตามสถานะ
                            padding: const EdgeInsets.symmetric(vertical: 8), // ระยะบนล่างของปุ่ม
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // ขอบโค้งของปุ่ม
                            ),
                          ),
                          child: Text(
                            isFollowing ? "Following" : "Follow", // แสดงข้อความตามสถานะ
                            style: const TextStyle(
                              fontSize: 14, // ขนาดฟอนต์ของข้อความในปุ่ม
                              fontWeight: FontWeight.bold, // ตัวหนา
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8), // ช่องว่างระหว่างปุ่ม

                    // Invite Button (สี่เหลี่ยมเล็ก)
                    _actionSquareButton(
                      Icons.person_add_outlined, // ไอคอนเชิญ
                      onTap: _openInviteMenu, // เมื่อกด → เปิดเมนูเชิญ
                    ),
                    const SizedBox(width: 8), // ช่องว่าง

                    // More Options Button (สี่เหลี่ยมเล็ก)
                    _actionSquareButton(
                      Icons.keyboard_arrow_down, // ไอคอนลูกศรลง
                      onTap: _openArrowMenu, // เมื่อกด → เปิดเมนูเพิ่มเติม
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24), // ช่องว่างก่อน Tab bar

              // ----------------- TAB BAR -----------------
              Container(
                decoration: const BoxDecoration( // ตกแต่งขอบบนของพื้นที่แท็บ
                  border: Border(
                    top: BorderSide(color: Color(0xFF262626), width: 0.5), // เส้นขอบบนสีเข้มบาง ๆ
                  ),
                ),
                child: Row( // แถวสำหรับปุ่มแท็บ
                  children: [
                    // Tab 0 → Posts
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => selectedTab = 0); // เมื่อกด → ตั้ง selectedTab เป็น 0
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12), // เว้นบนล่างเล็กน้อย
                          decoration: BoxDecoration( // ตกแต่งเส้นใต้เมื่อถูกเลือก
                            border: Border(
                              bottom: BorderSide(
                                color: selectedTab == 0 ? Colors.white : Colors.transparent, // ขีดใต้ถ้าเลือก
                                width: 1, // ความหนาของเส้นใต้
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.grid_on_outlined, // ไอคอนตารางโพสต์
                            color: selectedTab == 0 ? Colors.white : const Color(0xFF737373), // สีตามสถานะ
                            size: 26, // ขนาดไอคอน
                          ),
                        ),
                      ),
                    ),
                    // Tab 1 → Reels
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => selectedTab = 1); // เมื่อกด → ตั้ง selectedTab เป็น 1
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12), // เว้นบนล่าง
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: selectedTab == 1 ? Colors.white : Colors.transparent, // ขีดใต้ถ้าเลือก
                                width: 1, // ความหนา
                              ),
                            ),
                          ),
                          child: Icon(
                            Icons.play_circle_outline, // ไอคอน Reels
                            color: selectedTab == 1 ? Colors.white : const Color(0xFF737373), // สีตามสถานะ
                            size: 26, // ขนาดไอคอน
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ----------------- TAB CONTENT -----------------
              if (selectedTab == 0)
              // TAB 0 → POSTS GRID (ถ้าเลือก tab 0)
                GridView.count(
                  crossAxisCount: 2, // จำนวนคอลัมน์ในกริด = 2
                  shrinkWrap: true, // ให้ Grid มีขนาดพอดีกับเนื้อหา (ไม่ stretch)
                  physics: const NeverScrollableScrollPhysics(), // ปิดการเลื่อนภายใน Grid เพื่อให้ Column ควบคุมการเลื่อน
                  crossAxisSpacing: 2, // ระยะห่างแนวนอนระหว่างรูป
                  mainAxisSpacing: 2, // ระยะห่างแนวตั้งระหว่างรูป
                  children: [
                    _imageBox("https://images.unsplash.com/photo-1587300003388-59208cc962cb?w=500"), // รูปตัวอย่างที่ 1
                    _imageBox("https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?w=500"), // รูปตัวอย่างที่ 2
                  ],
                )
              else
              // TAB 1 → REELS PAGE (ถ้าเลือก tab 1)
                Container(
                  height: 300, // ความสูงสำหรับหน้า Reels ชั่วคราว
                  alignment: Alignment.center, // จัด widget ตรงกลาง
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // จัดแนวกลางทั้งแนวตั้ง
                    children: const [
                      Icon(Icons.play_circle_outline, color: Colors.white, size: 80), // ไอคอนเล่นใหญ่
                      SizedBox(height: 12), // ช่องว่าง
                      Text(
                        "Reels", // ข้อความแสดงว่าเป็น Reels
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 20), // ช่องว่างด้านล่างสุด
            ],
          ),
        ),
      ),
    );
  }

  // ----------------- FOLLOW BUTTON FUNCTIONS -----------------
  // ฟังก์ชันสำหรับสลับสถานะ Follow / Unfollow
  void _toggleFollow() {
    setState(() => isFollowing = !isFollowing); // สลับค่าของ isFollowing

    // แสดง SnackBar แจ้งผู้ใช้ว่าทำอะไรเสร็จแล้ว
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isFollowing ? 'Followed' : 'Unfollowed'), // ข้อความตามสถานะใหม่
        duration: const Duration(seconds: 1), // ระยะเวลาที่ SnackBar แสดง
      ),
    );
  }

  // ฟังก์ชันสำหรับแสดงเมนู Unfollow เมื่อกดค้างที่ปุ่ม Follow
  void _showUnfollowMenu() {
    if (!isFollowing) return; // ถ้าไม่ได้ Follow อยู่ → ไม่ต้องแสดงเมนู

    showModalBottomSheet(
      context: context, // คอนเท็กซ์ปัจจุบัน
      backgroundColor: const Color(0xFF1A1A1A), // สีพื้นหลังของ Bottom Sheet
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // ขอบโค้งด้านบน
      ),
      builder: (context) {
        return ListTile(
          title:
          const Text("Unfollow?", style: TextStyle(color: Colors.white)), // ข้อความในเมนู
          onTap: () {
            Navigator.pop(context); // ปิด Bottom Sheet
            setState(() => isFollowing = false); // ตั้งสถานะเป็นยังไม่ได้ Follow
          },
        );
      },
    );
  }

  // ----------------- MENUS -----------------
  // ฟังก์ชันเปิดเมนู More (เรียก _openBottomMenu พร้อมรายการ)
  void _openMoreMenu() {
    _openBottomMenu([
      _menuItem(Icons.share, "Share Profile"), // ไอเท็มแชร์โปรไฟล์
      _menuItem(Icons.link, "Copy Profile URL"), // คัดลอก URL
      _menuItem(Icons.report, "Report"), // รายงานผู้ใช้
    ]);
  }

  // ฟังก์ชันเปิดเมนู Invite
  void _openInviteMenu() {
    _openBottomMenu([
      _menuItem(Icons.send, "Send to..."), // ส่งให้...
      _menuItem(Icons.person_add, "Invite Friends"), // เชิญเพื่อน
    ]);
  }

  // ฟังก์ชันเปิดเมนูลูกศร (ตัวเลือกเพิ่มเติม)
  void _openArrowMenu() {
    _openBottomMenu([
      _menuItem(Icons.star_border, "Add to Favorites"), // เพิ่มในรายการโปรด
      _menuItem(Icons.lock_outline, "Add to Close Friends"), // เพิ่มใน Close Friends
      _menuItem(Icons.notifications, "Turn on Notifications"), // เปิดแจ้งเตือน
    ]);
  }

  // ฟังก์ชัน helper สำหรับแสดง Bottom Sheet ที่รับ ListTile หลายรายการ
  void _openBottomMenu(List<ListTile> items) {
    // แสดง Bottom Sheet
    showModalBottomSheet(
      backgroundColor: const Color(0xFF1A1A1A), // สีพื้นหลัง
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // ขอบโค้งบน
      ),
      context: context, // คอนเท็กซ์ปัจจุบัน
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min, // ให้ Column มีขนาดพอดีกับเนื้อหา
          children: [...items, const SizedBox(height: 10)], // ใส่รายการเมนูตามที่ส่งมา และช่องว่างด้านล่างเล็กน้อย
        );
      },
    );
  }

  // สร้าง ListTile ให้เป็นไอเท็มเมนูที่เรียบง่าย
  ListTile _menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // ไอคอนด้านหน้า
      title: Text(title, style: const TextStyle(color: Colors.white)), // ข้อความไอเท็ม
      onTap: () => Navigator.pop(context), // เมื่อกด → ปิดเมนู (สามารถใส่ logic เพิ่มได้)
    );
  }

  // ----------------- STORY VIEWER -----------------
  // ฟังก์ชันเปิดหน้า StoryViewer เมื่อกดที่รูปโปรไฟล์
  void _openStoryView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const StoryViewer(), // สร้าง route ไปยัง StoryViewer
      ),
    );
  }

  // ----------------- HELPER UI -----------------
  // สร้างคอลัมน์สถิติ (ตัวเลข + label)
  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value, // แสดงตัวเลข
          style: const TextStyle(
            color: Colors.white, // สีตัวเลขเป็นขาว
            fontSize: 16, // ขนาดฟอนต์
            fontWeight: FontWeight.bold, // ตัวหนา
          ),
        ),
        const SizedBox(height: 2), // ช่องว่างเล็ก
        Text(
          label, // แสดง label (เช่น Post, Follower)
          style: const TextStyle(color: Colors.white, fontSize: 13), // สไตล์ข้อความ
        ),
      ],
    );
  }

  // ปุ่มสี่เหลี่ยมเล็ก ๆ (ใช้สำหรับ Invite / More)
  Widget _actionSquareButton(IconData icon, {required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration( // ตกแต่งปุ่ม
        color: const Color(0xFF262626), // พื้นหลังเข้ม
        borderRadius: BorderRadius.circular(8), // มุมโค้ง
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 20), // ไอคอนภายในปุ่ม
        onPressed: onTap, // เมื่อกด → เรียก callback ที่ส่งมา
        padding: const EdgeInsets.all(8), // padding รอบไอคอน
        constraints: const BoxConstraints(), // ยกเลิก constraints เริ่มต้นของ IconButton
      ),
    );
  }

  // สร้างกล่องรูปสำหรับกริด (กดเพื่อขยาย)
  Widget _imageBox(String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => FullImagePage(imageUrl: url))); // เมื่อกด → เปิดหน้า FullImagePage
      },
      child: Image.network(
        url, // ลิงก์รูป
        fit: BoxFit.cover, // ครอบรูปเต็มพื้นที่
        errorBuilder: (context, error, stackTrace) { // ถ้าดึงรูปไม่สำเร็จ
          return Container(
            color: const Color(0xFF262626), // พื้นหลังสีเข้ม
            child: const Center(
              child: Icon(Icons.error, color: Colors.white), // แสดงไอคอน error
            ),
          );
        },
      ),
    );
  }
}

// ----------------- FULL IMAGE PAGE ----------------- //
// หน้า FullImagePage ใช้แสดงรูปเต็มหน้าจอเมื่อผู้ใช้แตะในกริด
class FullImagePage extends StatelessWidget {
  final String imageUrl; // เก็บ URL ของรูปที่จะแสดง
  const FullImagePage({super.key, required this.imageUrl}); // คอนสตรักเตอร์รับ imageUrl

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold ของหน้า FullImage
      backgroundColor: Colors.black, // พื้นหลังดำเพื่อเน้นรูป
      appBar:
      AppBar(backgroundColor: Colors.black, iconTheme: const IconThemeData(color: Colors.white)), // AppBar สีดำ ไอคอนสีขาว
      body: Center(child: Image.network(imageUrl)), // แสดงรูปจาก URL ตรงกลางหน้าจอ
    );
  }
}

// ----------------- STORY VIEWER ----------------- //
// หน้า StoryViewer แสดงภาพแบบเต็มหน้าจอและแตะเพื่อปิด
class StoryViewer extends StatelessWidget {
  const StoryViewer({super.key}); // คอนสตรักเตอร์

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // พื้นหลังดำ
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // แตะที่ Story เพื่อปิดและกลับ
        child: Center(
          child: Image.network(
            'https://i.pinimg.com/736x/0e/82/7f/0e827f69ad902260a4be57095744f4e9.jpg', // ลิงก์รูป Story
            fit: BoxFit.cover, // ครอบเต็มพื้นที่เพื่อให้เหมือน story
          ),
        ),
      ),
    );
  }
}