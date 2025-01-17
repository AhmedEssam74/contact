import 'package:contact/Themes/light_theme.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/screens/widgets/add_bottom_sheet.dart';
import 'package:contact/screens/widgets/contact_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contacts = [];

  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: 117.w,
          height: 39.w,
        ),
      ),
      body: contacts.isEmpty
          ? SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.w,
                  ),
                  Lottie.asset(
                    "assets/animation/empty_list.json",
                    width: 368.w,
                    height: 368.h,
                  ),
                  const Text(
                    "There is No Contacts Added Here",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                        childAspectRatio: 177.w / 286.h,
                      ),
                      itemBuilder: (context, index) => ContactContainer(
                          image: contacts[index].photo,
                          name: contacts[index].name,
                          phone: contacts[index].phoneNumber,
                          email: contacts[index].email,
                          onPress: () {
                            setState(() {
                              contacts.removeAt(index);
                            });
                          }),
                      itemCount: contacts.length,
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          contacts.isNotEmpty
              ? FloatingActionButton(
                  backgroundColor: Theme.of(context).cardColor,
                  onPressed: () {
                    setState(() {
                      contacts.removeLast();
                    });
                  },
                  child: Icon(
                    Icons.delete,
                    size: 28,
                    color: LightTheme.secondaryColor,
                  ),
                )
              : const SizedBox(),
          SizedBox(
            height: 12.h,
          ),
          FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddBottomSheet(
                  name: name,
                  email: email,
                  phone: phone,
                  addUser: addContact,
                  onChangePicker: onChangePicker,
                ),
              );
            },
            child: Icon(
              Icons.add,
              size: 28,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    phone.dispose();
  }

  void onChangePicker(XFile? file) {
    image = file;
  }

  void addContact() {
    setState(
      () {
        contacts.add(
          ContactModel(
              name: name.text,
              email: email.text,
              phoneNumber: phone.text,
              photo: image?.path),
        );
        name.clear();
        phone.clear();
        email.clear();
        image = null;
      },
    );
    Navigator.pop(context);
    // print(contacts[0]);
  }
}
