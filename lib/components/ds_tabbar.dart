import 'package:flutter/material.dart';
import '../design_system/colors.dart';
import '../design_system/typography.dart';
import '../design_system/spacing.dart';
import 'ds_tabbar_delegate.dart';

enum DSTabBarOrientation { horizontal, vertical }

// VIEW MODEL: NAO TEM MAIS O ATRIBUTO FUNCAO
class DSTabBarViewModel {
  final List<String> tabs;
  final DSTabBarOrientation orientation;
  final int initialIndex;

  DSTabBarViewModel({
    required this.tabs,
    required this.orientation,
    this.initialIndex = 0,
  });
}

// COMPONENTE COM ATRIBUTO DELEGATE OPCIONAL
class DSTabBar extends StatefulWidget {
  final DSTabBarViewModel viewModel;
  final DSTabBarDelegate? delegate; // ATRIBUTO DELEGATE OPCIONAL

  const DSTabBar({
    super.key,
    required this.viewModel,
    this.delegate,
  });

  @override
  State<DSTabBar> createState() => _DSTabBarState();
}

class _DSTabBarState extends State<DSTabBar> {
  late int _selectedIndex;
  int _hoveredIndex = -1;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.viewModel.initialIndex;
  }

  void _handleTabTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // CHAMADA DA FUNCAO ATRAVES DA REFERENCIA DELEGATE
    widget.delegate?.onTabSelected(index, widget.viewModel.tabs[index]);
  }

  Widget _buildTab(String title, int index, bool isSelected, bool isHovered) {
    final isHorizontal = widget.viewModel.orientation == DSTabBarOrientation.horizontal;
    
    // Cor do texto: #767676 normal, #282828 hover/selecionado
    Color textColor;
    if (isSelected || isHovered) {
      textColor = const Color(0xFF282828);
    } else {
      textColor = const Color(0xFF767676);
    }
    
    // Peso da fonte: bold se selecionado, normal se hover ou normal
    FontWeight fontWeight = isSelected ? FontWeight.w600 : FontWeight.w400;
    
    // Cor do traço indicador: #7BB9FA
    const Color indicatorColor = Color(0xFF7BB9FA);

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      child: GestureDetector(
        onTap: () => _handleTabTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: DSSpacing.l,
            vertical: DSSpacing.m,
          ),
          decoration: BoxDecoration(
            border: isSelected
                ? Border(
                    // Traço embaixo se horizontal
                    bottom: isHorizontal
                        ? const BorderSide(
                            color: indicatorColor,
                            width: 3,
                          )
                        : BorderSide.none,
                    // Traço à esquerda se vertical
                    left: !isHorizontal
                        ? const BorderSide(
                            color: indicatorColor,
                            width: 3,
                          )
                        : BorderSide.none,
                  )
                : null,
          ),
          child: Text(
            title,
            style: DSTypography.buttonText.copyWith(
              color: textColor,
              fontSize: 14,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isHorizontal = widget.viewModel.orientation == DSTabBarOrientation.horizontal;

    if (isHorizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.viewModel.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = _selectedIndex == index;
          final isHovered = _hoveredIndex == index;
          
          return Padding(
            padding: EdgeInsets.only(
              right: index < widget.viewModel.tabs.length - 1 ? DSSpacing.s : 0,
            ),
            child: _buildTab(tab, index, isSelected, isHovered),
          );
        }).toList(),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widget.viewModel.tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = _selectedIndex == index;
          final isHovered = _hoveredIndex == index;
          
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < widget.viewModel.tabs.length - 1 ? DSSpacing.s : 0,
            ),
            child: _buildTab(tab, index, isSelected, isHovered),
          );
        }).toList(),
      );
    }
  }
}