import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';
import '../components/dialogs.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final codeCtrl = TextEditingController();
  late ConfettiController confetti;

  @override
  void initState() {
    super.initState();
    confetti = ConfettiController(duration: const Duration(seconds: 2));
    // TODO: 최초 로딩 공지 fetch → showNoticeDialog
  }

  @override
  void dispose() {
    confetti.dispose();
    codeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loggedIn = ref.watch(loginStateProvider);
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('성당 출석 체크'),
        actions: [
          if (!loggedIn) TextButton(onPressed: () async {
            final reg = await showRegisterDialog(context);
            if (reg != null) {
              final api = ref.read(apiProvider);
              await api.register(
                name: reg['name']!, baptismalName: reg['baptismalName']!, phone: reg['phone']!,
              );
              final loginReq = await showLoginDialog(context);
              if (loginReq != null) {
                final data = await api.login(name: loginReq['name']!, baptismalName: loginReq['baptismalName']!);
                ref.read(authTokenProvider.notifier).set(data['token']);
                ref.read(profileProvider.notifier).set(data['profile']);
                ref.read(loginStateProvider.notifier).set(true);
              }
            }
          }, child: const Text('회원가입', style: TextStyle(color: Colors.white))),
          if (!loggedIn) TextButton(onPressed: () async {
            final loginReq = await showLoginDialog(context);
            if (loginReq != null) {
              final api = ref.read(apiProvider);
              final data = await api.login(name: loginReq['name']!, baptismalName: loginReq['baptismalName']!);
              ref.read(authTokenProvider.notifier).set(data['token']);
              ref.read(profileProvider.notifier).set(data['profile']);
              ref.read(loginStateProvider.notifier).set(true);
            }
          }, child: const Text('로그인', style: TextStyle(color: Colors.white))),
          if (loggedIn) TextButton(onPressed: () {
            ref.read(loginStateProvider.notifier).set(false);
            ref.read(profileProvider.notifier).set(null);
            ref.read(authTokenProvider.notifier).set(null);
          }, child: const Text('로그아웃', style: TextStyle(color: Colors.white))),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 배너
              Container(
                height: 140,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text('성당 배너 (이미지 교체 예정)', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 16),
              // 오늘 미사 정보 + 방문자수
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('오늘 미사', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    // TODO: API 데이터 바인딩
                    const Text('시간: 10:00'),
                    const Text('장소: 본당'),
                    const Text('주례: OOO 신부님'),
                    const SizedBox(height: 12),
                    const Divider(),
                    const Text('오늘 방문자수: 0명'), // TODO: API 바인딩
                  ]),
                ),
              ),
              const SizedBox(height: 16),
              // 내 대시보드
              if (loggedIn && profile != null) Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('${profile['name']} (${profile['baptismal_name']}) 님'),
                    const SizedBox(height: 8),
                    Row(children: [
                      const Text('누적 출석: '),
                      InkWell(
                        onTap: () async {
                          final api = ref.read(apiProvider);
                          final data = await api.fetchMyAttendance();
                          final dates = (data['dates'] as List).map((e) => e.toString()).toList();
                          await showAttendanceHistoryDialog(context, dates);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.06),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text('${profile['attendance_count'] ?? 0}회 (클릭)'),
                        ),
                      ),
                    ]),
                  ]),
                ),
              ),
              const SizedBox(height: 16),
              // 출석 코드 입력
              if (loggedIn) Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Text('출석 코드 입력', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Row(children: [
                      Expanded(child: TextField(controller: codeCtrl, decoration: const InputDecoration(hintText: '코드 6자리'))),
                      const SizedBox(width: 8),
                      FilledButton(onPressed: () async {
                        final api = ref.read(apiProvider);
                        final res = await api.verifyCode(codeCtrl.text.trim());
                        if (res['ok'] == true) {
                          confetti.play();
                          // 새 카운트 UI 반영
                          final p = Map<String, dynamic>.from(ref.read(profileProvider) ?? {});
                          p['attendance_count'] = res['new_count'];
                          ref.read(profileProvider.notifier).state = p;
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('출석 완료!')));
                          codeCtrl.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('코드가 올바르지 않습니다.')));
                        }
                      }, child: const Text('확인')),
                    ]),
                  ]),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(confettiController: confetti, blastDirectionality: BlastDirectionality.explosive, shouldLoop: false),
          ),
        ],
      ),
    );
  }
}
