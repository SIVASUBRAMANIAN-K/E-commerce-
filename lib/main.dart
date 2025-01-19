import 'package:flutter/material.dart';
import 'package:layer_labs/Home/search_screen.dart';
import 'package:layer_labs/Profile/account_screen.dart';
import 'package:layer_labs/Profile/address_screen.dart';
import 'package:layer_labs/Home/cart_screen.dart';
import 'package:layer_labs/Profile/change_password_screen.dart';
import 'package:layer_labs/Profile/history_screen.dart';
import 'package:layer_labs/login/forget_password.dart';
import 'package:layer_labs/Profile/help_support_screen.dart';
import 'package:layer_labs/Home/home_screen.dart';
import 'package:layer_labs/login/login_screen.dart';
import 'package:layer_labs/Profile/notification_screen.dart';
import 'package:layer_labs/Home/order_confirmation_screen.dart';
import 'package:layer_labs/Home/payment_screen.dart';
import 'package:layer_labs/Profile/privacy_settings_screen.dart';
import 'package:layer_labs/Home/product_detail_screen.dart';
import 'package:layer_labs/Profile/profile_edit_screen.dart';
import 'package:layer_labs/Home/profile_screen.dart';
import 'package:layer_labs/login/signup_screen.dart';
import 'package:layer_labs/login/splash_screen.dart';
import 'package:layer_labs/Home/wishlist_screen.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layer Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => HomeScreen(),
        '/search': (context) => SearchScreen(),
        '/product': (context) => ProductDetailScreen(),
        '/wishlist': (context) => WishlistScreen(),
        '/cart': (context) => CartScreen(),
        '/profile': (context) => ProfileScreen(),
        '/address': (context) => AddressManagementScreen(),
        '/account': (context) => AccountSettingsScreen(),
        '/pedit': (context) => ProfileEditingScreen(),
        '/cpassword': (context) => ChangePasswordScreen(),
        '/psettings': (context) => PrivacySettingsScreen(),
        '/notification': (context) => NotificationsScreen(),
        '/help-support': (context) => HelpAndSupportScreen(),
        '/history': (context) => HistoryScreen(),
        '/payment': (context) => PaymentScreen(),
        '/order': (context) => OrderConfirmationScreen(),
      },
    );
  }
}
