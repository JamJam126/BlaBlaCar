import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class RideprefInputField extends StatelessWidget {
  final String? label;
  final String placeholder;
  final IconData icon;
  final VoidCallback onTap;
  final Widget? trailing;

  const RideprefInputField({
    super.key,
    this.label,
    required this.placeholder,
    required this.icon,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return (GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: BlaColors.greyLight, width: 1),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.neutralLight),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label ?? placeholder, 
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: label == null ?
                    BlaColors.neutralLight :
                    BlaColors.neutral
                )
              ),
            ),
            ?trailing,
          ],
        ),
      ),
    ));
  }
}
