
import 'package:book_store/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter/material.dart';

class BookStor extends StatelessWidget {
  const BookStor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: OnboardingScreen(),
    );
  }
}
