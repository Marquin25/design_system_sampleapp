import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';

enum DSButtonType { primary, alternative }
enum DSButtonState { normal, hover, disabled }

class DSButtonViewModel {
  final String text;
  final DSButtonType type;
  final VoidCallback? onPressed;

  DSButtonViewModel({
    required this.text,
    required this.type,
    this.onPressed,
  });
}

class DSButton extends StatefulWidget {
  final DSButtonViewModel viewModel;

  const DSButton({
    super.key,
    required this.viewModel,
  });

  @override
  State<DSButton> createState() => _DSButtonState();
}

class _DSButtonState extends State<DSButton> {
  bool _isHovered = false;

  Color _getBackgroundColor() {
    final isDisabled = widget.viewModel.onPressed == null;
    final isPrimary = widget.viewModel.type == DSButtonType.primary;

    if (isDisabled) {
      return isPrimary 
          ? DSColors.primary.withOpacity(0.4) 
          : DSColors.grey.withOpacity(0.4);
    }

    if (_isHovered) {
      return isPrimary 
          ? DSColors.primary.withOpacity(0.8) 
          : DSColors.grey.withOpacity(0.2);
    }

    return isPrimary ? DSColors.primary : Colors.transparent;
  }

  Color _getTextColor() {
    final isDisabled = widget.viewModel.onPressed == null;
    final isPrimary = widget.viewModel.type == DSButtonType.primary;

    if (isDisabled) {
      return isPrimary ? DSColors.white : DSColors.grey;
    }

    return isPrimary ? DSColors.white : DSColors.black;
  }

  BorderSide _getBorder() {
    final isPrimary = widget.viewModel.type == DSButtonType.primary;
    if (isPrimary) return BorderSide.none;
    
    return BorderSide(
      color: DSColors.grey,
      width: 1.5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: widget.viewModel.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getTextColor(),
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.l,
            vertical: DSSpacing.m,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: _getBorder(),
          ),
          elevation: 0,
        ),
        child: Text(
          widget.viewModel.text,
          style: DSTypography.buttonText.copyWith(
            color: _getTextColor(),
          ),
        ),
      ),
    );
  }
}