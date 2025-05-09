import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Picture with Edit Icon
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/me.jpg'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.deepPurple,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Name, Email, Bio
            const Text(
              "Alex Johnson",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "alex.johnson@example.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Mobile app developer, coffee lover ☕ and passionate about clean UI.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),

            const SizedBox(height: 16),

            // Social Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialIcon(icon: FontAwesomeIcons.github),
                SizedBox(width: 20),
                SocialIcon(icon: FontAwesomeIcons.linkedin),
                SizedBox(width: 20),
                SocialIcon(icon: FontAwesomeIcons.twitter),
              ],
            ),

            const SizedBox(height: 24),

            // Gallery GridView
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
                children: List.generate(6, (index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://picsum.photos/id/${index + 10}/200/200',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Social Icon Widget
class SocialIcon extends StatelessWidget {
  final IconData icon;

  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.deepPurple,
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
