import 'package:flutter/material.dart';

void main() {
  runApp(const ControlPanelApp());
}

class ControlPanelApp extends StatelessWidget {
  const ControlPanelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'لوحة التحكم',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5B7C99), // Norwegian calm color
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA), // Light background
      ),
      home: const ControlPanelHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControlPanelHomePage extends StatefulWidget {
  const ControlPanelHomePage({super.key});

  @override
  State<ControlPanelHomePage> createState() => _ControlPanelHomePageState();
}

class _ControlPanelHomePageState extends State<ControlPanelHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    UserManagementScreen(),
    SubscriptionManagementScreen(),
    SystemMonitoringScreen(),
    AnalyticsAndReportsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'المستخدمون',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'الاشتراكات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_heart),
            label: 'المراقبة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'التقارير',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF5B7C99),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'إدارة المستخدمين والأدوات',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'هنا يمكنك إدارة المستخدمين، الأقسام، والأدوات المتاحة.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SubscriptionManagementScreen extends StatelessWidget {
  const SubscriptionManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.subscriptions, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'إدارة الاشتراكات المؤتمتة',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'إدارة الاشتراكات وتجديدها بشكل مؤتمت بالكامل.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SystemMonitoringScreen extends StatelessWidget {
  const SystemMonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.monitor_heart, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'مراقبة حالة النظام والطوارئ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'مراقبة الأداء العام للنظام واكتشاف الطوارئ.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class AnalyticsAndReportsScreen extends StatelessWidget {
  const AnalyticsAndReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.analytics, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'تحليلات وتقارير لحظية ودورية',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'عرض التحليلات والتقارير في الوقت الفعلي وبشكل دوري.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

