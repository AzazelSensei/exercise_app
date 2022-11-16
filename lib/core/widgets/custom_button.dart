import 'package:exercise_app/core/extension/ui_extension.dart';
import 'package:getwidget/getwidget.dart';

import '../common/common_libs.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color? color;
  final bool? fullWidthButton;

  const CustomButton(
      {super.key, this.onPressed, this.text, this.color, this.fullWidthButton});

  @override
  Widget build(BuildContext context) {
    return GFButton(
      borderShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      text: text,
      textStyle: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      size: context.height * 0.055,
      fullWidthButton: fullWidthButton ?? true,
      color: color ?? const Color(0xFF937DC2),
    );
  }
}
