import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';
import '../components/ds_button.dart';
import 'buttons_page.dart';
import 'forms_page.dart';
import 'tabs_page.dart';
import 'typography_page.dart';
import 'colors_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Design System',
          style: DSTypography.headline4,
        ),
        backgroundColor: DSColors.white,
        elevation: 1,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DSSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Basic Design System',
                style: DSTypography.headline1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DSSpacing.s),
              Text(
                'Explore os componentes do sistema',
                style: DSTypography.paragraph.copyWith(
                  color: DSColors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DSSpacing.xxl),
              
              // Botões em coluna vertical
              SizedBox(
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DSButton(
                      viewModel: DSButtonViewModel(
                        text: 'Typography',
                        type: DSButtonType.primary,
                        onPressed: () => _navigateToPage(context, const TypographyPage()),
                      ),
                    ),
                    const SizedBox(height: DSSpacing.m),
                    DSButton(
                      viewModel: DSButtonViewModel(
                        text: 'Colors',
                        type: DSButtonType.primary,
                        onPressed: () => _navigateToPage(context, const ColorsPage()),
                      ),
                    ),
                    const SizedBox(height: DSSpacing.m),
                    DSButton(
                      viewModel: DSButtonViewModel(
                        text: 'Buttons',
                        type: DSButtonType.primary,
                        onPressed: () => _navigateToPage(context, const ButtonsPage()),
                      ),
                    ),
                    const SizedBox(height: DSSpacing.m),
                    DSButton(
                      viewModel: DSButtonViewModel(
                        text: 'Forms',
                        type: DSButtonType.primary,
                        onPressed: () => _navigateToPage(context, const FormsPage()),
                      ),
                    ),
                    const SizedBox(height: DSSpacing.m),
                    DSButton(
                      viewModel: DSButtonViewModel(
                        text: 'Tabs',
                        type: DSButtonType.primary,
                        onPressed: () => _navigateToPage(context, const TabsPage()),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
