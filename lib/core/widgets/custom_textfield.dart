import '../common/common_libs.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.inputFormatters,
     this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget icon;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: [
          widget.icon,
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 18),
              inputFormatters: widget.inputFormatters,
              keyboardType: TextInputType.text,
              onChanged: widget.onChanged,
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
