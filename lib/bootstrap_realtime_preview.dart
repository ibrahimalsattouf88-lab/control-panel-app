import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'services/realtime_tips.dart';
import 'widgets/tips_stream_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const url = 'https://kieqcshbnagdastfxdkp.supabase.co';
  const key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9....';

  await Supabase.initialize(url: url, anonKey: key);
  await RealtimeTipsService.instance.init();

  runApp(_App());
}

class _App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Realtime Tips — Control Panel Preview')),
        body: SafeArea(child: SingleChildScrollView(child: TipsStreamList())),
      ),
    );
  }
}
