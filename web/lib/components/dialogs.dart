import 'package:flutter/material.dart';

Future<Map<String, String>?> showRegisterDialog(BuildContext context) async {
  final nameCtrl = TextEditingController();
  final bapCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  return showDialog<Map<String, String>>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('회원가입'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: '이름')),
        TextField(controller: bapCtrl, decoration: const InputDecoration(labelText: '본명')),
        TextField(controller: phoneCtrl, decoration: const InputDecoration(labelText: '전화번호')),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
        FilledButton(onPressed: () {
          Navigator.pop(context, {
            'name': nameCtrl.text.trim(),
            'baptismalName': bapCtrl.text.trim(),
            'phone': phoneCtrl.text.trim(),
          });
        }, child: const Text('가입')),
      ],
    ),
  );
}

Future<Map<String, String>?> showLoginDialog(BuildContext context) async {
  final nameCtrl = TextEditingController();
  final bapCtrl = TextEditingController();
  return showDialog<Map<String, String>>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('로그인'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: '이름')),
        TextField(controller: bapCtrl, decoration: const InputDecoration(labelText: '본명')),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('취소')),
        FilledButton(onPressed: () {
          Navigator.pop(context, {
            'name': nameCtrl.text.trim(),
            'baptismalName': bapCtrl.text.trim(),
          });
        }, child: const Text('로그인')),
      ],
    ),
  );
}

Future<void> showAttendanceHistoryDialog(BuildContext context, List<String> dates) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('내 출석 기록'),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: DataTable(
            columns: const [DataColumn(label: Text('번호')), DataColumn(label: Text('날짜'))],
            rows: List.generate(dates.length, (i) => DataRow(cells: [
              DataCell(Text('${i+1}')), DataCell(Text(dates[i])),
            ])),
          ),
        ),
      ),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('닫기'))],
    ),
  );
}

Future<void> showNoticeDialog(BuildContext context, String title, String body) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [FilledButton(onPressed: () => Navigator.pop(context), child: const Text('확인'))],
    ),
  );
}
