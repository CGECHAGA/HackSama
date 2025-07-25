// File: lib/chuma_app.dart (or lib/chuma.dart)
import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const ChumaApp());

class ChumaApp extends StatelessWidget {
  const ChumaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuma Pesa',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ChumaHomeScreen(),
    );
  }
}

class ChumaHomeScreen extends StatefulWidget {
  const ChumaHomeScreen({super.key});

  @override
  State<ChumaHomeScreen> createState() => _ChumaHomeScreenState();
}

class _ChumaHomeScreenState extends State<ChumaHomeScreen> {
  // State
  double balance = 12450.75;
  bool isOnline = true;
  bool isBalanceVisible = false;
  String aiQuery = '';
  String aiResponse = '';
  bool simSwapped = false;
  String authMethod = 'biometric';

  // Data
  final Map<String, String> cachedAI = {
    "how to save": "50-30-20 rule: 50% needs, 30% wants, 20% savings",
    "best stocks": "Top picks: Safaricom (SCOM), KCB Group (KCB)",
  };

  final List<Map<String, String>> ussdOptions = [
    {"code": "*234*1#", "response": "Balance: KES 12,450.75"},
    {"code": "*234*2#", "response": "Send Money Menu"},
  ];

  @override
  void initState() {
    super.initState();
    // Demo: Go offline after 3 sec
    Future.delayed(const Duration(seconds: 3), () => setState(() => isOnline = false));
    // 10% chance of SIM swap
    if (Random().nextDouble() > 0.9) _triggerSimSwapAlert();
  }

  void _triggerSimSwapAlert() {
    setState(() => simSwapped = true);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Security Alert"),
          content: const Text("SIM change detected!"),
          actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("OK"))],
        ),
      );
    });
  }

  void _handleAIQuery() {
    if (aiQuery.trim().isEmpty) return;
    setState(() {
      aiResponse = isOnline
          ? "AI: ${aiQuery}"
          : cachedAI[aiQuery.toLowerCase()] ?? "Can't answer offline";
      aiQuery = '';
    });
  }

  void _handleUSSD(String code) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("USSD Response"),
        content: Text(_getUssdResponse(code)),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("OK"))],
      ),
    );
  }

  String _getUssdResponse(String code) {
    if (!code.startsWith('*') || !code.endsWith('#')) return "Invalid format";
    return isOnline
        ? "Sent: $code"
        : ussdOptions.firstWhere(
            (opt) => opt["code"] == code,
            orElse: () => {"response": "Service offline"},
          )["response"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Status Bar
            Container(
              padding: const EdgeInsets.all(10),
              color: isOnline ? Colors.green[100] : Colors.red[100],
              child: Text(isOnline ? '🟢 Online' : '🔴 Offline'),
            ),

            // Balance Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("💰 Balance", style: TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: Icon(isBalanceVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => isBalanceVisible = !isBalanceVisible),
                        ),
                      ],
                    ),
                    Text(isBalanceVisible ? "KES $balance" : "••••••", 
                         style: const TextStyle(fontSize: 24)),
                  ],
                ),
              ),
            ),

            // AI Advisor
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text("🧠 AI Advisor", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextField(
                      decoration: const InputDecoration(hintText: "Ask about savings..."),
                      onChanged: (v) => aiQuery = v,
                      onSubmitted: (_) => _handleAIQuery(),
                    ),
                    if (aiResponse.isNotEmpty) Text(aiResponse),
                  ],
                ),
              ),
            ),

            // Quick Actions
            Row(
              children: [
                _buildActionButton("Check Balance", () => _handleUSSD("*234*1#")),
                _buildActionButton("Send Money", () => _handleUSSD("*234*2#")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(onPressed: onPressed, child: Text(text)),
      ),
    );
  }
}
