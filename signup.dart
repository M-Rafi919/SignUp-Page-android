
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:new_application/screens/login.dart';

import '../user_image_picker.dart';
import 'home_screen.dart';

class SinupPage extends StatefulWidget {
  const SinupPage({super.key});

  @override
  State<SinupPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SinupPage> {
  final _formkey =GlobalKey<FormState>();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _passwrodYour = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _emailYour = TextEditingController();
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp',style: TextStyle(fontSize: 20,color: Colors.green),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                 // CircleAvatar(
                 //   radius: 40,
                 //     child: Image.asset('assets/images/lodo3.webp'),
                 // ),
                UserImagePicker(onPickImage: (pickedImage){
                  setState(() {
                    _selectedImage = pickedImage;
                  });
                }),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _firstName,
                  decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Your First Name')
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return'please enter first name';
                    }if (value.length<4){
                      return'character must be 4 ';
                    }
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _lastName,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Your Last Name')
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return'please enter last name';
                    }if (value.length<4){
                      return'character must be 4 ';
                    }
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  obscureText: true,
                  controller: _passwrodYour,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Password')
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _emailYour,
                  decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Your Email')
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return'please enter name';
                    }if (!EmailValidator.validate(value)){
                      return'Please enter a valid email';
                    }
                  },
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _phoneNumber,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text('Enter Phone Number')
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                }, child: const Text('Home Screen'),),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: (){
                  if (_formkey.currentState!.validate()) {
                    print('Validated');
                    print(_firstName.text);
                    print(_lastName.text);
                    print(_phoneNumber.text);
                    print(_phoneNumber.text);
                    print(_emailYour.text);
                  }else{
                    print('Not Validated');
                  }
                }, child: Text('Form Validate'),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('AlreadY Hava Account'),
                      const SizedBox(width: 30,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                      }, child: const Text('LogIn'),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
