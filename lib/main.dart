import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tungtee/Pages/welcome.dart';
import 'package:tungtee/Provider/persona_provider.dart';
import 'Services/notificationLocal_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  await Firebase.initializeApp(
      name: "TungTee", options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return PersonaProvider();
        }),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tung Tee',
          theme: ThemeData(useMaterial3: true),
          home: const WelcomePage()),
    );
  }
}
