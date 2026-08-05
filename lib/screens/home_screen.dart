import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool photoPermission = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EchoMind"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(
              Icons.search,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              "EchoMind",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "AI 기반 개인 검색 엔진",
            ),

            const SizedBox(height: 50),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "사진 접근 권한",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "사진 검색을 위해 권한이 필요합니다.",
            ),

            const SizedBox(height: 15),

            SwitchListTile(
              title: Text(photoPermission ? "허용됨" : "허용 안됨"),
              value: photoPermission,
              onChanged: (value) {
                setState(() {
                  photoPermission = value;
                });
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("시작하기"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}