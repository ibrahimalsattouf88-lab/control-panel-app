import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _PanelHome(),
    );
  }
}

class _PanelHome extends StatefulWidget {
  const _PanelHome({super.key});
  @override
  State<_PanelHome> createState() => _PanelHomeState();
}

class _PanelHomeState extends State<_PanelHome> {
  final _title = TextEditingController(text: 'Tip من لوحة التحكّم');
  final _content = TextEditingController(text: 'تم الإرسال عبر REST (fallback).');
  String _level = 'info';
  bool _busy = false;

  Future<void> _insertTip() async {
    setState(() => _busy = true);
    try {
      final url = dotenv.env['SUPABASE_URL']!;
      final anon = dotenv.env['SUPABASE_ANON_KEY']!;
      final endpoint = Uri.parse('$url/rest/v1/tips');

      final resp = await http.post(
        endpoint,
        headers: {
          'apikey': anon,
          'Authorization': 'Bearer $anon',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Prefer': 'return=minimal',
        },
        body: jsonEncode({
          'level': _level,
          'title': _title.text.trim(),
          'content': _content.text.trim(),
          'source': 'control-panel',
          'created_at': DateTime.now().toUtc().toIso8601String(),
        }),
      );

      if (resp.statusCode >= 300) {
        throw Exception('HTTP ${resp.statusCode} ${resp.body}');
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ تم الإدخال')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('❌ فشل الإدخال: $e')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SafeArea(
          child: Material(
            color: Colors.white,
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'Realtime Tips — Control Panel Preview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                value: _level,
                items: const [
                  DropdownMenuItem(value: 'info', child: Text('info')),
                  DropdownMenuItem(value: 'warning', child: Text('warning')),
                  DropdownMenuItem(value: 'error', child: Text('error')),
                ],
                onChanged: (v) => setState(() => _level = v ?? 'info'),
                decoration: const InputDecoration(labelText: 'level'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _title,
                decoration: const InputDecoration(labelText: 'title'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _content,
                decoration: const InputDecoration(labelText: 'content'),
                minLines: 2,
                maxLines: 6,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _busy ? null : _insertTip,
                icon: const Icon(Icons.send),
                label: Text(_busy ? 'جاري الإرسال…' : 'إرسال Tip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
