import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> insertTip({
  required String level,
  required String title,
  required String content,
  String source = 'control-panel',
}) async {
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
      'level': level,
      'title': title,
      'content': content,
      'source': source,
      'created_at': DateTime.now().toUtc().toIso8601String(),
    }),
  );

  if (resp.statusCode >= 300) {
    throw Exception('Insert failed: ${resp.statusCode} ${resp.body}');
  }
}
