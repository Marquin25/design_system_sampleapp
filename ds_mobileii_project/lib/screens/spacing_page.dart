import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';

class SpacingPage extends StatelessWidget {
  const SpacingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spacing',
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
            _buildSpacingItem('5px XS', DSSpacing.xs),
            const SizedBox(height: DSSpacing.l),
            
            _buildSpacingItem('10px S', DSSpacing.s),
            const SizedBox(height: DSSpacing.l),
            
            _buildSpacingItem('15px M', DSSpacing.m),
            const SizedBox(height: DSSpacing.l),
            
            _buildSpacingItem('25px L', DSSpacing.l),
            const SizedBox(height: DSSpacing.l),
            
            _buildSpacingItem('40px XL', DSSpacing.xl),
            const SizedBox(height: DSSpacing.l),
            
            _buildSpacingItem('65px XXL', DSSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacingItem(String label, double size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: DSTypography.paragraph,
        ),
        const SizedBox(height: DSSpacing.s),
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: DSColors.action,
            border: Border.all(
              color: DSColors.grey,
              width: 1,
            ),
          ),
        ),
      ],
    );
  }
}