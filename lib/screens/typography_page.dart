import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Typography',
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
            _buildTypographyItem(
              'Headline 1',
              'H1 48/60px',
              DSTypography.headline1,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildTypographyItem(
              'Headline 2',
              'H2 34/40px',
              DSTypography.headline2,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildTypographyItem(
              'Headline 3',
              'H3 28/28px',
              DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildTypographyItem(
              'Headline 4',
              'H4 18/22px',
              DSTypography.headline4,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildTypographyItem(
              'Paragraph',
              'P 14/24px',
              DSTypography.paragraph,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypographyItem(String text, String subtitle, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: style),
        const SizedBox(height: DSSpacing.xs),
        Text(
          subtitle,
          style: DSTypography.paragraph.copyWith(
            color: DSColors.grey,
          ),
        ),
      ],
    );
  }
}