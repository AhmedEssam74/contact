import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Themes/light_theme.dart';

class ContactContainer extends StatelessWidget {
  static const String routName = "contact";
  final String name;
  final String phone;
  final String email;
  final String? image;
  final void Function() onPress;

  const ContactContainer({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    this.image,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        image: image == null
            ? null
            : DecorationImage(
                fit: BoxFit.fill,
                image: FileImage(File(image!)),
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
                name,
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
              padding: EdgeInsets.only(top: 16.0, left: 8.h, right: 8.h),
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
                        email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Theme.of(context).primaryColor),
                      SizedBox(
                        width: 8.h,
                      ),
                      Text(
                        phone,
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
                    onPressed: onPress,
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
    );
  }
}
