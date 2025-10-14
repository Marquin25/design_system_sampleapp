import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Colors',
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
            _buildColorItem(
              'Primary',
              '#F34E4E',
              DSColors.primary,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildColorItem(
              'Secondary',
              '#FFF6EA',
              DSColors.secondary,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildColorItem(
              'Action',
              '#7EB89FA',
              DSColors.action,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildColorItem(
              'Grey',
              '#D0D0D0',
              DSColors.grey,
            ),
            const SizedBox(height: DSSpacing.l),
            
            _buildColorItem(
              'Black',
              '#282828',
              DSColors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorItem(String name, String hex, Color color) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: DSColors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        const SizedBox(width: DSSpacing.l),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: DSTypography.headline4,
            ),
            const SizedBox(height: DSSpacing.xs),
            Text(
              hex,
              style: DSTypography.paragraph.copyWith(
                color: DSColors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}