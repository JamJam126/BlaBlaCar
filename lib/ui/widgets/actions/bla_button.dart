import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum BlaButtonVariant { primary, secondary }

extension BlaButtonVariantX on BlaButtonVariant {
  Color backgroundColor(bool enabled) {
    switch (this) {
      case BlaButtonVariant.primary:
        return enabled ? BlaColors.primary : BlaColors.disabled;

      case BlaButtonVariant.secondary:
        return enabled ? BlaColors.white : BlaColors.disabled;
    }
  }

  Color textColor(bool enabled) {
    switch (this) {
      case BlaButtonVariant.primary:
        return enabled ? BlaColors.white : BlaColors.textLight;

      case BlaButtonVariant.secondary:
        return enabled ? BlaColors.primary : BlaColors.textLight;
    }
  }

  Color borderColor(bool enabled) {
    if (!enabled) {
      return BlaColors.greyLight;
    }

    switch (this) {
      case BlaButtonVariant.primary:
        return BlaColors.primary;

      case BlaButtonVariant.secondary:
        return BlaColors.greyLight;
    }
  }
}

class BlaButton extends StatelessWidget {
  final String text;
  final BlaButtonVariant variant;
  final double radius;
  final bool? expand;
  final IconData? icon;
  final bool enabled;
  final VoidCallback? onPressed;

  const BlaButton({
    super.key,
    required this.text,
    required this.variant,
    this.expand = false,
    this.icon,
    this.radius = BlaSpacings.radius,
    this.enabled = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = enabled;
    final Color backgroundColor = variant.backgroundColor(isEnabled);
    final Color textColor = variant.textColor(isEnabled);
    final Color borderColor = variant.borderColor(isEnabled);

    return (GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: BlaSpacings.l,
          vertical: BlaSpacings.s,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: expand == true ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: textColor),
              const SizedBox(width: BlaSpacings.s),
            ],
            Text(text, style: BlaTextStyles.button.copyWith(color: textColor)),
          ],
        ),
      ),
    ));
  }
}
