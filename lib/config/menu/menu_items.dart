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
      title: 'Cambiar tema',
      subTitle: 'Cambiar de temas con Riverpod',
      link: Routes.themeChanger,
      icon: Icons.color_lens_outlined),
  MenuItems(
      title: 'Contador',
      subTitle: 'Contador con Riverpod',
      link: Routes.counter,
      icon: Icons.add),
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
      title: 'Snackbars y diálogos',
      subTitle: 'Indicadores en pantalla',
      link: Routes.snackbar,
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated Container',
      subTitle: 'Stateful Widget animado',
      link: Routes.animated,
      icon: Icons.crop_square),
  MenuItems(
      title: 'UI controls + Tiles',
      subTitle: 'Varios controles de Flutter',
      link: Routes.uiControls,
      icon: Icons.stay_current_portrait_outlined),
  MenuItems(
      title: 'Introducción a la aplicación',
      subTitle: 'Un tutorial para conocer la app',
      link: Routes.appTutorial,
      icon: Icons.accessibility_new_rounded),
  MenuItems(
      title: 'Scroll infinito y pull',
      subTitle: 'Listas infinitas y deslizar para actualizar',
      link: Routes.infiniteScroll,
      icon: Icons.arrow_downward),
];
