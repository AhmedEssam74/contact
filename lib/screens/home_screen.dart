import 'package:contact/Themes/light_theme.dart';
import 'package:contact/models/contact_model.dart';
import 'package:contact/screens/widgets/add_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
      body:
          // contacts.isEmpty
          //     ? SizedBox(
          //         width: double.infinity,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             SizedBox(
          //               height: 100.w,
          //             ),
          //             Lottie.asset(
          //               "assets/animation/empty_list.json",
          //               width: 368.w,
          //               height: 368.h,
          //             ),
          //             const Text(
          //               "There is No Contacts Added Here",
          //               style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.w500,
          //               ),
          //             )
          //           ],
          //         ),
          //       )
          //     :
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 177.w,
              height: 286.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/images/image2.jpg",
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: LightTheme.secondaryColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "Leo Messi",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Container(
                    // height: 150.h,
                    decoration: BoxDecoration(
                      color: LightTheme.secondaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.r),
                        bottomLeft: Radius.circular(8.r),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 16.0, left: 8.h, right: 8.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 8.h,
                              ),
                              Text(
                                "leomessi",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  color: Theme.of(context).primaryColor),
                              SizedBox(
                                width: 8.h,
                              ),
                              Text(
                                "01000000000",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).cardColor,
                              padding: const EdgeInsets.symmetric(vertical: 9),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: LightTheme.secondaryColor,
                                ),
                                SizedBox(
                                  width: 4.h,
                                ),
                                Text(
                                  "Delete",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: LightTheme.secondaryColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
          ),
        );
        name.clear();
        phone.clear();
        email.clear();
      },
    );
    Navigator.pop(context);
    // print(contacts[0]);
  }
}
