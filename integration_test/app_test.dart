import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:control_panel_flutter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Control Panel App Integration Tests', () {
    testWidgets('App launches successfully', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify app title is displayed
      expect(find.text('لوحة التحكم'), findsOneWidget);
    });

    testWidgets('Navigation between sections works', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify initial section (User Management)
      expect(find.text('إدارة المستخدمين والأدوات'), findsOneWidget);

      // Navigate to Subscription Management section
      await tester.tap(find.text('الاشتراكات'));
      await tester.pumpAndSettle();
      expect(find.text('إدارة الاشتراكات المؤتمتة'), findsOneWidget);

      // Navigate to System Monitoring section
      await tester.tap(find.text('المراقبة'));
      await tester.pumpAndSettle();
      expect(find.text('مراقبة حالة النظام والطوارئ'), findsOneWidget);

      // Navigate to Analytics section
      await tester.tap(find.text('التقارير'));
      await tester.pumpAndSettle();
      expect(find.text('تحليلات وتقارير لحظية ودورية'), findsOneWidget);
    });

    testWidgets('User Management section displays correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify user management content
      expect(find.byIcon(Icons.people), findsWidgets);
      expect(find.text('إدارة المستخدمين والأدوات'), findsOneWidget);
    });

    testWidgets('Subscription Management section displays correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to Subscription Management
      await tester.tap(find.text('الاشتراكات'));
      await tester.pumpAndSettle();

      // Verify subscription management content
      expect(find.byIcon(Icons.subscriptions), findsWidgets);
      expect(find.text('إدارة الاشتراكات المؤتمتة'), findsOneWidget);
    });

    testWidgets('System Monitoring section displays correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to System Monitoring
      await tester.tap(find.text('المراقبة'));
      await tester.pumpAndSettle();

      // Verify system monitoring content
      expect(find.byIcon(Icons.monitor_heart), findsWidgets);
      expect(find.text('مراقبة حالة النظام والطوارئ'), findsOneWidget);
    });

    testWidgets('Analytics section displays correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Navigate to Analytics
      await tester.tap(find.text('التقارير'));
      await tester.pumpAndSettle();

      // Verify analytics content
      expect(find.byIcon(Icons.analytics), findsWidgets);
      expect(find.text('تحليلات وتقارير لحظية ودورية'), findsOneWidget);
    });

    testWidgets('Settings button is present', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify settings button exists
      expect(find.byIcon(Icons.settings_outlined), findsOneWidget);
    });

    testWidgets('Bottom navigation bar has all sections', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify all navigation items exist
      expect(find.text('المستخدمون'), findsOneWidget);
      expect(find.text('الاشتراكات'), findsOneWidget);
      expect(find.text('المراقبة'), findsOneWidget);
      expect(find.text('التقارير'), findsOneWidget);
    });
  });
}

