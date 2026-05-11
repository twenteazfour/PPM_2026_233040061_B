import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? profileImage;

  String about =
      'Saya suka belajar hal baru, terutama yang berkaitan dengan teknologi dan pengembangan aplikasi mobile.';

  String education = 'Universitas Pasundan — Semester 6';

  String contact = 'ellenaplidazalni@gmail.com';

  String skills = 'System Analyst • UI/UX';

  File? expImage;
  String expTitle = 'System Analyst';
  String expDesc =
      'Membuat desain aplikasi mobile modern menggunakan Figma.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Widget Gallery'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GalleryHome(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: const Text('Edit Experience'),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditExperiencePage(
                      title: expTitle,
                      desc: expDesc,
                    ),
                  ),
                );

                if (result != null) {
                  setState(() {
                    expTitle = result['title'];
                    expDesc = result['desc'];
                    expImage = result['image'];
                  });
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage:
                    profileImage != null ? FileImage(profileImage!) : null,
                    child: profileImage == null
                        ? const Icon(Icons.person, size: 50, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Ellen Aplida Zalni,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mahasiswa Teknik Informatika',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: _StatBox(
                    label: 'Post',
                    value: '12',
                  ),
                ),
                Expanded(
                  child: _StatBox(
                    label: 'Teman',
                    value: '128',
                  ),
                ),
                Expanded(
                  child: _StatBox(
                    label: 'Like',
                    value: '1.2K',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _SectionCard(
              icon: Icons.info_outline,
              title: 'About Me',
              content: about,
            ),
            _SectionCard(
              icon: Icons.school,
              title: 'Education',
              content: education,
            ),
            _SectionCard(
              icon: Icons.email,
              title: 'Contact',
              content: contact,
            ),
            _SectionCard(
              icon: Icons.star,
              title: 'Skills',
              content: skills,
            ),
            const SizedBox(height: 12),
            // === EXPERIENCE ===
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Experience',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (expImage != null)
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (expImage != null)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar kecil di kiri
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image.file(
                                expImage!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Judul dan deskripsi di kanan
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      expTitle,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      expDesc,
                                      style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 13,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EditProfilePage(
                about: about,
                education: education,
                contact: contact,
                skills: skills,
              ),
            ),
          );

          if (result != null) {
            setState(() {
              about = result['about'];
              education = result['education'];
              contact = result['contact'];
              skills = result['skills'];
              profileImage = result['image'];
            });
          }
        },
        label: const Text('Edit'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _SectionCard({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.blue,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(content),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryHome extends StatelessWidget {
  const GalleryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Gallery'),
      ),
      body: const Center(
        child: Text('Gallery Widget'),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String about;
  final String education;
  final String contact;
  final String skills;

  const EditProfilePage({
    super.key,
    required this.about,
    required this.education,
    required this.contact,
    required this.skills,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController aboutC;
  late TextEditingController educationC;
  late TextEditingController contactC;
  late TextEditingController skillsC;

  File? image;

  @override
  void initState() {
    super.initState();

    aboutC = TextEditingController(text: widget.about);

    educationC = TextEditingController(text: widget.education);

    contactC = TextEditingController(text: widget.contact);

    skillsC = TextEditingController(text: widget.skills);
  }

  Future pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                    image != null ? FileImage(image!) : null,
                    child: image == null
                        ? const Icon(
                      Icons.person,
                      size: 50,
                    )
                        : null,
                  ),
                  TextButton(
                    onPressed: pickImage,
                    child: const Text('Ganti Foto'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: aboutC,
              decoration: const InputDecoration(
                labelText: 'About',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: educationC,
              decoration: const InputDecoration(
                labelText: 'Education',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: contactC,
              decoration: const InputDecoration(
                labelText: 'Contact',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: skillsC,
              decoration: const InputDecoration(
                labelText: 'Skills',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'about': aboutC.text,
                  'education': educationC.text,
                  'contact': contactC.text,
                  'skills': skillsC.text,
                  'image': image,
                });
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditExperiencePage extends StatefulWidget {
  final String title;
  final String desc;

  const EditExperiencePage({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  State<EditExperiencePage> createState() => _EditExperiencePageState();
}

class _EditExperiencePageState extends State<EditExperiencePage> {
  late TextEditingController titleC;
  late TextEditingController descC;

  File? image;

  @override
  void initState() {
    super.initState();

    titleC = TextEditingController(text: widget.title);

    descC = TextEditingController(text: widget.desc);
  }

  Future pickImage() async {
    final picker = ImagePicker();

    final picked = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pilih Gambar'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: titleC,
              decoration: const InputDecoration(
                labelText: 'Judul Pengalaman',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descC,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'title': titleC.text,
                  'desc': descC.text,
                  'image': image,
                });
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}