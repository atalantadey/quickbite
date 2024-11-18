import 'package:flutter/material.dart';
import 'package:quickbite/components/my_button.dart';
import 'package:quickbite/components/my_textfield.dart';
import 'package:quickbite/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? ontap;
  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

//LOGIN method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();
    //try login
    try {
      await authService.signInWithEmailPassword(
          emailController.text, pwController.text);
    } //catch any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //LOGO
            Icon(
              Icons.lock_open_rounded,
              color: Theme.of(context).colorScheme.inversePrimary,
              size: 100,
            ),
            const SizedBox(
              height: 25,
            ),
            //Message,App Slogan
            Text(
              ' QUICKBITE ',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16),
            ),
            const SizedBox(height: 25),
            //Email txt
            MyTextField(
                hintText: 'Email',
                obscureText: false,
                textEditingController: emailController),
            const SizedBox(
              height: 15,
            ),
            //password txt
            MyTextField(
                hintText: 'Password',
                obscureText: true,
                textEditingController: pwController),
            const SizedBox(
              height: 25,
            ),
            //sign in butn
            MyButton(ontap: () => login(context), text: 'L O G I N  '),
            const SizedBox(height: 25),
            //not a member? register now!!
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Not a member? ',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                GestureDetector(
                  onTap: widget.ontap,
                  child: const Text(
                    'Register Now!! ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
