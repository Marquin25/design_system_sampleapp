import 'package:flutter/material.dart';
import '../design_system/colors.dart';

class DSRadioViewModel<T> {
  final T value;
  final T groupValue;
  final ValueChanged<T>? onChanged;
  final String? label;

  DSRadioViewModel({
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.label,
  });
}

class DSRadio<T> extends StatelessWidget {
  final DSRadioViewModel<T> viewModel;

  const DSRadio({
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
          child: Radio<T>(
            value: viewModel.value,
            groupValue: viewModel.groupValue,
            onChanged: viewModel.onChanged != null
                ? (T? value) {
                    if (value != null) {
                      viewModel.onChanged!(value);
                    }
                  }
                : null,
            activeColor: DSColors.action,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return DSColors.action;
              }
              return DSColors.grey;
            }),
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