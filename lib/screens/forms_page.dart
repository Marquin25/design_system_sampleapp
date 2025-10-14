import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';
import '../components/ds_input.dart';
import '../components/ds_checkbox.dart';
import '../components/ds_radio.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  bool _isCheckboxChecked = false;
  String _selectedRadio = 'option1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms',
          style: DSTypography.headline4,
        ),
        backgroundColor: DSColors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DSSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Input Fields',
              style: DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Input Normal
            DSInput(
              viewModel: DSInputViewModel(
                label: 'Label',
                placeholder: 'Placeholder',
              ),
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Input com texto
            DSInput(
              viewModel: DSInputViewModel(
                label: 'Label',
                placeholder: 'Input text',
                controller: TextEditingController(text: 'Input text'),
              ),
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Input com erro
            DSInput(
              viewModel: DSInputViewModel(
                label: 'Label',
                placeholder: 'Input text',
                hasError: true,
                controller: TextEditingController(text: 'Input text'),
              ),
            ),
            const SizedBox(height: DSSpacing.xxl),
            
            // Checkbox e Radio Button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Checkbox
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Checkbox',
                        style: DSTypography.headline3,
                      ),
                      const SizedBox(height: DSSpacing.l),
                      Row(
                        children: [
                          DSCheckbox(
                            viewModel: DSCheckboxViewModel(
                              isChecked: _isCheckboxChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isCheckboxChecked = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: DSSpacing.s),
                          Text(
                            'Aceito os termos',
                            style: DSTypography.paragraph,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: DSSpacing.xl),
                
                // Radio Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Radio button',
                        style: DSTypography.headline3,
                      ),
                      const SizedBox(height: DSSpacing.l),
                      Row(
                        children: [
                          DSRadio<String>(
                            viewModel: DSRadioViewModel(
                              value: 'option1',
                              groupValue: _selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRadio = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: DSSpacing.s),
                          Text(
                            'Opção 1',
                            style: DSTypography.paragraph,
                          ),
                        ],
                      ),
                      const SizedBox(height: DSSpacing.m),
                      Row(
                        children: [
                          DSRadio<String>(
                            viewModel: DSRadioViewModel(
                              value: 'option2',
                              groupValue: _selectedRadio,
                              onChanged: (value) {
                                setState(() {
                                  _selectedRadio = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: DSSpacing.s),
                          Text(
                            'Opção 2',
                            style: DSTypography.paragraph,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}