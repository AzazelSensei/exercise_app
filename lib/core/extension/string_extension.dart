import '../common/common_libs.dart';

extension StringExtension on String {
  Text get text => Text(this);
}

extension TextExtension on Text {
  Text clone([Color? color, FontWeight? fontWeight, double? fontSize]) => Text(
        data!,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      );
}

extension ColumnExtension on List<Widget> {
  Column column([
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  ]) =>
      Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: this,
      );
}
