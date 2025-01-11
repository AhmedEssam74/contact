import 'package:contact/Themes/light_theme.dart';
import 'package:contact/screens/widgets/text_field_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class AddBottomSheet extends StatefulWidget {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final void Function() addUser;
  final void Function(XFile?) onChangePicker;

  const AddBottomSheet({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.addUser,
    required this.onChangePicker,
  });

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  XFile? file;
  String name = "User Name";
  String email = "example@email.com";
  String phone = "+200000000000";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    ImagePicker picker = ImagePicker();
                    file = await picker.pickImage(source: ImageSource.gallery);
                    widget.onChangePicker(file);
                    setState(() {});
                  },
                  child: Container(
                    width: 143.w,
                    height: 146.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        width: 2,
                        color: LightTheme.secondaryColor,
                      ),
                      image: file != null
                          ? DecorationImage(
                              image: AssetImage(file!.path),
                              fit: BoxFit.fill,
                            )
                          : null,
                    ),
                    child: file == null
                        ? Lottie.asset("assets/animation/image_picker.json")
                        : null,
                  ),
                ),
                SizedBox(
                  height: 146.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Container(
                        height: 2.h,
                        width: 192.w,
                        color: LightTheme.secondaryColor,
                      ),
                      Text(
                        email,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Container(
                        height: 2.h,
                        width: 192.w,
                        color: LightTheme.secondaryColor,
                      ),
                      Text(
                        phone,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height:32.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFieldBtn(
                  lable: "Enter User Name ",
                  controller: widget.name,
                  onChange: setName,
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFieldBtn(
                  lable: "Enter User Email ",
                  controller: widget.email,
                  onChange: setEmail,
                ),
                SizedBox(
                  height: 8.h,
                ),
                TextFieldBtn(
                  lable: "Enter User Phone ",
                  controller: widget.phone,
                  onChange: setPhone,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ElevatedButton(
                  onPressed: widget.addUser,
                  child: Text(
                    "Enter User",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void setName(String value) {
    setState(() {
      value.isEmpty ? name = "User Name" : name = value;
    });
  }

  void setEmail(String value) {
    setState(() {
      value.isEmpty ? email = "example@email.com" : email = value;
    });
  }

  void setPhone(String value) {
    setState(() {
      value.isEmpty ? phone = "+200000000000" : phone = value;
    });
  }
}
