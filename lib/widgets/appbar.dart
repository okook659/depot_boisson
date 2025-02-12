import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({super.key,
    this.title,
    this.showBackArrow = true,
    this.leadingicon,
    this.actions,
    this.leadingOnPressed,
  
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingicon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24 ),
    child: AppBar(
      automaticallyImplyLeading: false,
      leading:  showBackArrow ? IconButton(
        icon: Icon(Iconsax.arrow_left),
        onPressed:() => Get.back(),
      ) : leadingicon != null ? IconButton(
        icon: Icon(leadingicon),
        onPressed: leadingOnPressed,
      ) : null, 
      title: title,
      actions: actions,
    ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}