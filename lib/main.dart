import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1f1f1f),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 왼쪽의 동그란 이미지
                  const CircleAvatar(
                    radius: 30, // 원의 크기 조절
                    backgroundImage:
                        AssetImage('lib/images/ZZG.png'), // 이미지 경로 설정
                  ),
                  // 오른쪽의 + 버튼
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    iconSize: 40, // 아이콘 크기 조절
                    onPressed: () {
                      // 버튼 클릭 시 동작 정의
                      print('');
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'MONDAY 16',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'TODAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.circle,
                      size: 15,
                      color: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      '17',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '18',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '19',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  // 여기
                  RoundedBox(color: Colors.yellow, title: 'Box 1'),
                  SizedBox(height: 10), // 네모 사이 간격
                  RoundedBox(color: Colors.purple, title: 'Box 2'),
                  SizedBox(height: 10), // 네모 사이 간격
                  RoundedBox(color: Color(0xffbcee4b), title: 'Box 3'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 모서리가 둥근 네모를 위한 StatelessWidget
class RoundedBox extends StatelessWidget {
  final Color color;
  final String title;

  const RoundedBox({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 490, // 네모의 너비
      height: 150, // 네모의 높이
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15), // 둥근 모서리
      ),
      alignment: Alignment.topLeft, // 텍스트를 가운데 정렬
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 20,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
