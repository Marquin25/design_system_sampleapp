import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';
import '../components/ds_button.dart';

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buttons',
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
              'Primary Buttons',
              style: DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Primary Default
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Primary',
                    type: DSButtonType.primary,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Primary button pressed')),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Primary Hover (simulado com texto)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hover (passe o mouse)',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Primary',
                    type: DSButtonType.primary,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Primary Disabled
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disabled',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Primary',
                    type: DSButtonType.primary,
                    onPressed: null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.xxl),
            
            // Alternative Buttons
            Text(
              'Alternative Buttons',
              style: DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Alternative Default
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Default',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Alternative',
                    type: DSButtonType.alternative,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Alternative button pressed')),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Alternative Hover
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hover (passe o mouse)',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Alternative',
                    type: DSButtonType.alternative,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: DSSpacing.l),
            
            // Alternative Disabled
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Disabled',
                  style: DSTypography.paragraph.copyWith(
                    color: DSColors.grey,
                  ),
                ),
                const SizedBox(height: DSSpacing.s),
                DSButton(
                  viewModel: DSButtonViewModel(
                    text: 'Alternative',
                    type: DSButtonType.alternative,
                    onPressed: null,
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