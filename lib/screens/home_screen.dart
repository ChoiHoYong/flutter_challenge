import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSeconds = 0; // 남은 시간(초)
  bool isRunning = false; // 타이머 실행 여부
  int totalPomodoros = 0; // 완료한 사이클 수
  late Timer timer; // 타이머
  int? selectedMinutes; // 선택된 분
  bool isCooldown = false; // 쿨다운 상태

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalPomodoros += 1; // 사이클 카운트 증가
        isRunning = false;
        isCooldown = true; // 쿨다운 시작
      });
      timer.cancel();

      // 5분 대기 후 타이머를 재시작 가능하게 설정
      Future.delayed(const Duration(minutes: 5), () {
        setState(() {
          isCooldown = false; // 쿨다운 종료
        });
      });
    } else {
      setState(() {
        totalSeconds -= 1; // 초 감소
      });
    }
  }

  void onStartPressed() {
    if (isCooldown) return; // 쿨다운 중이면 시작하지 않음

    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true; // 타이머 시작
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false; // 타이머 일시 정지
    });
  }

  void onRestartPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = selectedMinutes! * 60; // 시간 초기화
      // totalPomodoros = 0; // 사이클 수 초기화
      isRunning = false; // 타이머 정지
      isCooldown = false; // 쿨다운 상태 초기화
    });
  }

  void setTime(int seconds) {
    setState(() {
      totalSeconds = seconds; // 남은 시간 설정
    });
  }

  String formatMinutes(int seconds) {
    return (seconds ~/ 60).toString().padLeft(2, '0'); // 분 형식
  }

  String formatSeconds(int seconds) {
    return (seconds % 60).toString().padLeft(2, '0'); // 초 형식
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 50),
              Text(
                'POMOTIMER',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    formatMinutes(totalSeconds),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  ':',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.5)),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 140,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    formatSeconds(totalSeconds),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var minutes in [15, 20, 25, 30, 35])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: selectedMinutes == minutes
                          ? Colors.white // 선택된 버튼 배경
                          : Colors.transparent, // 비선택 버튼 배경
                      side: const BorderSide(
                        color: Colors.white, // 테두리 색
                        width: 2, // 테두리 두께
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // 모서리 둥글게
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedMinutes = minutes; // 선택된 분 설정
                        setTime(minutes * 60);
                      });
                    },
                    child: Text(
                      '$minutes',
                      style: TextStyle(
                        color: selectedMinutes == minutes
                            ? Colors.red
                            : Colors.white, // 선택된 버튼 글자 색
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    iconSize: 120,
                    color: Theme.of(context).cardColor,
                    onPressed: onRestartPressed,
                    icon: const Icon(
                      Icons.restart_alt_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Text(
            '완료한 사이클 수: $totalPomodoros / 4', // 완료한 사이클 수 표시
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (isCooldown) ...[
            const SizedBox(height: 10),
            const Text(
              '5분 쿨다운 중...',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
