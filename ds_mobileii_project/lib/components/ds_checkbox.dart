import 'package:flutter/material.dart';
import '../design_system/colors.dart';

class DSCheckboxViewModel {
  final bool isChecked;
  final ValueChanged<bool>? onChanged;
  final String? label;

  DSCheckboxViewModel({
    required this.isChecked,
    this.onChanged,
    this.label,
  });
}

class DSCheckbox extends StatelessWidget {
  final DSCheckboxViewModel viewModel;

  const DSCheckbox({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: viewModel.isChecked,
            onChanged: viewModel.onChanged != null
                ? (value) => viewModel.onChanged!(value ?? false)
                : null,
            activeColor: DSColors.action,
            checkColor: DSColors.white,
            side: BorderSide(
              color: DSColors.grey,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        if (viewModel.label != null) ...[
          const SizedBox(width: 8),
          Text(viewModel.label!),
        ],
      ],
    );
  }
}