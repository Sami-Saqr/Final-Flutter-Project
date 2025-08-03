import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF78B54), // برتقالي فاتح
              Color(0xFFF45E3A), // برتقالي أغمق
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // دائرة بيضاء فيها اللوجو
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/images/splash_icon.png', // غيّر الاسم حسب الصورة
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),

              // النص
              Text(
                'FASHION',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'STORE',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            'Style Meets Simplicity',
            style: TextStyle(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
}
