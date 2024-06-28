import 'package:flutter/material.dart';
import 'package:widgets_app/config/routes/routes.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: Routes.buttons,
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Tarjetas con Flutter',
      link: Routes.cards,
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progreso',
      subTitle: 'Progreso con Flutter',
      link: Routes.progress,
      icon: Icons.change_circle_outlined),
  MenuItems(
      title: 'Animaciones',
      subTitle: 'Animaciones con Flutter',
      link: Routes.animated,
      icon: Icons.animation),
  MenuItems(
      title: 'Scroll infinito',
      subTitle: 'Scroll infinito con Flutter',
      link: Routes.infiniteScroll,
      icon: Icons.arrow_downward),
];
