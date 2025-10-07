import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onPaste; // NEW
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;

  const OtpBox({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onPaste,
    required this.focusNode,
    this.nextFocusNode,
    this.previousFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: const Color.fromARGB(215, 160, 160, 160), width: 1),
        color: const Color.fromARGB(213, 255, 255, 255),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          hintText: '-',
          hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          // Note: no length limiter here so we can detect pasted multi-digit strings.
        ],
        onChanged: (value) {
          // If user pasted multiple digits into this single box (e.g. "1234")
          if (value.length > 1) {
            final pasted = value.replaceAll(RegExp(r'\D'), '');
            if (pasted.isNotEmpty) {
              if (onPaste != null) {
                onPaste!(pasted);
              }
              // keep only the first char in this box for visual consistency
              controller.text = pasted.isNotEmpty ? pasted[0] : '';
              // place cursor at end
              controller.selection = TextSelection.fromPosition(
                TextPosition(offset: controller.text.length),
              );
            }
            return;
          }

          // Normal single-digit flow
          if (onChanged != null) onChanged!(value);
          if (value.isNotEmpty && nextFocusNode != null) {
            nextFocusNode!.requestFocus();
          } else if (value.isEmpty && previousFocusNode != null) {
            previousFocusNode!.requestFocus();
          }
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:zippied_app/utiles/color.dart';

// class OtpBox extends StatelessWidget {
//   final TextEditingController controller;
//   final Function(String)? onChanged;
//   final Function(String)? onPaste;
//   final FocusNode focusNode;
//   final FocusNode? nextFocusNode;
//   final FocusNode? previousFocusNode;

//   const OtpBox({
//     super.key,
//     required this.controller,
//     this.onChanged,
//     this.onPaste,
//     required this.focusNode,
//     this.nextFocusNode,
//     this.previousFocusNode,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       width: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: focusNode.hasFocus
//               ? AppColor.textColor
//               : const Color.fromARGB(215, 160, 160, 160),
//           width: 1.5,
//         ),
//         color: const Color.fromARGB(213, 255, 255, 255),
//       ),
//       alignment: Alignment.center,
//       child: TextField(
//         controller: controller,
//         focusNode: focusNode,
//         keyboardType: TextInputType.number,
//         style: const TextStyle(color: Colors.black, fontSize: 20),
//         decoration: const InputDecoration(
//           hintText: '-',
//           hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
//           border: InputBorder.none,
//         ),
//         textAlign: TextAlign.center,
//         inputFormatters: [
//           FilteringTextInputFormatter.digitsOnly,
//         ],
//         onChanged: (value) {
//           if (value.length > 1 && onPaste != null) {
//             onPaste!(value);
//             controller.text = '';
//             return;
//           }
//           if (value.length > 1) {
//             controller.text = value.substring(0, 1);
//             value = controller.text;
//           }
//           if (onChanged != null) {
//             onChanged!(value);
//           }
//         },
//         onEditingComplete: () {
//           if (controller.text.isNotEmpty && nextFocusNode != null) {
//             nextFocusNode!.requestFocus();
//           }
//         },
//       ),
//     );
//   }
// }