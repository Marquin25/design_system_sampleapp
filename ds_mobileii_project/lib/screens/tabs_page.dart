import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';
import '../components/ds_tabbar.dart';
import '../components/ds_tabbar_delegate.dart';

// A TELA IMPLEMENTA A CLASSE ABSTRATA DEFINIDA
class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

// IMPLEMENTA O DELEGATE E CODA O METODO OBRIGATORIO
class _TabsPageState extends State<TabsPage> implements DSTabBarDelegate {
  // METODO OBRIGATORIO DA INTERFACE DELEGATE
  @override
  void onTabSelected(int index, String tabTitle) {
    // Tratamento do evento da tab selecionada
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tab "$tabTitle" selecionada!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tabs',
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
              'Horizontal tabs',
              style: DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            DSTabBar(
              viewModel: DSTabBarViewModel(
                tabs: ['Tab One', 'Tab Two', 'Tab Three'],
                orientation: DSTabBarOrientation.horizontal,
              ),
              delegate: this, // SETA O DELEGATE COM THIS
            ),
            const SizedBox(height: DSSpacing.xxl),
            
            // Vertical tabs
            Text(
              'Vertical tabs',
              style: DSTypography.headline3,
            ),
            const SizedBox(height: DSSpacing.l),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DSTabBar(
                  viewModel: DSTabBarViewModel(
                    tabs: ['Tab One', 'Tab Two', 'Tab Three'],
                    orientation: DSTabBarOrientation.vertical,
                  ),
                  delegate: this, // SETA O DELEGATE COM THIS
                ),
                const SizedBox(width: DSSpacing.xl),
                DSTabBar(
                  viewModel: DSTabBarViewModel(
                    tabs: ['Tab One', 'Tab Two', 'Tab Three'],
                    orientation: DSTabBarOrientation.vertical,
                    initialIndex: 1,
                  ),
                  delegate: this, // SETA O DELEGATE COM THIS
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}