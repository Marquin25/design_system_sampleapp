import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';

class DSInputViewModel {
  final String label;
  final String placeholder;
  final bool hasError;
  final TextEditingController? controller;

  DSInputViewModel({
    required this.label,
    required this.placeholder,
    this.hasError = false,
    this.controller,
  });
}

class DSInput extends StatelessWidget {
  final DSInputViewModel viewModel;

  const DSInput({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          viewModel.label,
          style: DSTypography.label,
        ),
        const SizedBox(height: DSSpacing.xs),
        TextField(
          controller: viewModel.controller,
          decoration: InputDecoration(
            hintText: viewModel.placeholder,
            hintStyle: DSTypography.paragraph.copyWith(
              color: DSColors.grey,
            ),
            filled: true,
            fillColor: DSColors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: DSSpacing.m,
              vertical: DSSpacing.m,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: viewModel.hasError ? DSColors.error : DSColors.grey,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: viewModel.hasError ? DSColors.error : DSColors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                color: viewModel.hasError ? DSColors.error : DSColors.action,
                width: 2,
              ),
            ),
            suffixIcon: viewModel.hasError
                ? const Icon(
                    Icons.error_outline,
                    color: DSColors.error,
                    size: 20,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}