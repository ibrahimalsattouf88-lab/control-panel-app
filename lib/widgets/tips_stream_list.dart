import 'package:flutter/material.dart';
import '../services/realtime_tips.dart';

class TipsStreamList extends StatefulWidget {
  const TipsStreamList({super.key});
  @override
  State<TipsStreamList> createState() => _TipsStreamListState();
}

class _TipsStreamListState extends State<TipsStreamList> {
  final _items = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
    RealtimeTipsService.instance.init();
    RealtimeTipsService.instance.stream.listen((tip) {
      if (!mounted) return;
      setState(() {
        _items.insert(0, tip);
        if (_items.length > 50) _items.removeLast();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_items.isEmpty) return const SizedBox.shrink();
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _items.length,
      itemBuilder: (_, i) {
        final t = _items[i];
        return ListTile(
          leading: const Icon(Icons.campaign),
          title: Text(t['title'] ?? 'نصيحة'),
          subtitle: Text(t['content'] ?? ''),
          trailing: Text((t['level'] ?? 'info').toString()),
        );
      },
    );
  }
}
