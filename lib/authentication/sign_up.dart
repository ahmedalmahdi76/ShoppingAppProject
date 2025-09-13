import 'package:flutter/material.dart';
import 'package:shopping_project/classes.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:shopping_project/home_screen.dart';
import 'package:shopping_project/authentication/sign_in.dart';
import 'package:shopping_project/shopping_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //variables
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
//validators
  FormFieldValidator<String>? validator,
      fullNameValidator,
      emailValidator,
      passwordValidator,
      confirmPasswordValidator;

// Toggle for password visibility
  void togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
// Toggle for confirm password visibility
  void toggleConfirmPasswordVisibility() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  Future<void> accountCreationDialog() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account Created', style: TextStyles.header3),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your account has been successfully created.', style: TextStyles.line2),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK', style: TextStyles.line),
              onPressed: () {
                
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShoppingScreen(),
                          ),
                        );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  // Clean up the controllers when the widget is disposed
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

// Reusable widget for input fields
  Widget makeInput({
    label,
    obscureText = false,
    bool isConfirmPassword = false,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.line),
        const SizedBox(height: 5),
        TextFormField(
          validator: validator,
          controller: controller,
          //To hide the password
          obscureText:
              obscureText
                  ? (isConfirmPassword ? !_showConfirmPassword : !_showPassword)
                  : false,

          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(fontFamily: 'CaviarDreams'),
            errorStyle: const TextStyle(fontFamily: 'CaviarDreams'),
            suffixIcon:
                obscureText
                    ? IconButton(
                      icon: Icon(
                        isConfirmPassword
                            ? (_showConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off)
                            : (_showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                        color: Colors.grey,
                      ),
                      onPressed:
                          isConfirmPassword
                              ? toggleConfirmPasswordVisibility
                              : togglePasswordVisibility,
                    )
                    : null,
            // errorText: isFullName ? _fullNameError : null, // Removed to allow validator to work
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Text('Sign up', style: TextStyles.header1),
                    SizedBox(height: 2),
                    Text('Create an account', style: TextStyles.line2),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        makeInput(
                          label: "Full Name",
                          controller: _fullNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            } else if (value.trim().isEmpty) {
                              return 'Please enter your full name';
                            } else if (!RegExp(
                              r'^[A-Z]',
                            ).hasMatch(value.trim()[0])) {
                              return 'First character must be uppercase';
                            }
                            return null;
                          },
                        ),
                        makeInput(
                          label: "Email",
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),

                        makeInput(
                          label: "Password",
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        makeInput(
                          label: "Confirm Password",
                          obscureText: true,
                          isConfirmPassword: true,
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedButton(
                  height: 50,
                  width: 200,
                  text: 'Sign Up',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.RIGHT_TO_LEFT,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'CaviarDreams',
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 254, 254, 254),
                  ),
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  borderColor: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: 30,
                  borderWidth: 1,
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      accountCreationDialog();

                      
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account ?', style: TextStyles.line2),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyles.line2.copyWith(
                          color: const Color.fromARGB(255, 6, 127, 225),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
