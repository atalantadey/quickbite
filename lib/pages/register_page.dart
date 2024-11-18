import 'package:flutter/material.dart';
import 'package:quickbite/components/my_button.dart';
import 'package:quickbite/components/my_textfield.dart';
import 'package:quickbite/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
//email text controller
  final TextEditingController _emailtxtController = TextEditingController();
  final TextEditingController _pwtxtController = TextEditingController();
  final TextEditingController _pwchecktxtController = TextEditingController();
  final void Function()? ontap;

  RegisterPage({super.key, required this.ontap});

  //REGISTER method
  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();
    if (_pwtxtController.text == _pwchecktxtController.text) {
      try {
        _auth.signUpWithEmailPassword(
            _emailtxtController.text, _pwtxtController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              e.toString(),
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Passwords Dont Match! Please Try Again'),
        ),
      );
    }
  }

  //LOGIN method
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 10,
            ),
            //welcome back message
            Text(
              "Lets Create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //email and pw textfields
            MyTextField(
              hintText: "Email",
              obscureText: false,
              textEditingController: _emailtxtController,
            ),

            const SizedBox(height: 6),

            MyTextField(
              hintText: "Password",
              obscureText: true,
              textEditingController: _pwtxtController,
            ),
            const SizedBox(height: 10),
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              textEditingController: _pwchecktxtController,
            ),
            const SizedBox(height: 10),
            //login btn
            MyButton(
              text: " R E G I S T E R ",
              ontap: () => register(context),
            ),
            const SizedBox(
              height: 10,
            ),
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an Account? ',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: const Text(
                    ' Login ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
