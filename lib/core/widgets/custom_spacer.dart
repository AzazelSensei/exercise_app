import 'package:exercise_app/core/extension/ui_extension.dart';

import '../common/common_libs.dart';

class CustomSpacer extends StatelessWidget {
  const CustomSpacer({
    Key? key,
    this.height = 20,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.normalWidth * height);
  }
}
