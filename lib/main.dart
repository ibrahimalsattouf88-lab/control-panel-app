
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const PanelApp());
}

class PanelApp extends StatelessWidget {
  const PanelApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('لوحة التحكم')),
        body: const Center(child: Text('Analytics + Insights (connect Supabase views)')),
      ),
    );
  }
}
