import 'package:flutter/material.dart';
import 'package:pessoa_bonito/model/pessoa_text.dart';
import 'package:pessoa_bonito/ui/bonito_theme.dart';

class TextReader extends StatelessWidget {
  final String categoryTitle;
  final PessoaText currentText;
  final ScrollController _scrollController = ScrollController();

  TextReader({Key? key, required this.categoryTitle, required this.currentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Center(child: getCategoryWidget(categoryTitle)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
              child: getTitleWidget(currentText.title),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: getTextWidget(currentText.content),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: getAuthorWidget(currentText.author),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCategoryWidget(String title) => Text(
        title,
        style: bonitoTextTheme.titleSmall,
      );

  Widget getTitleWidget(String title) => Text(
    title,
        style: bonitoTextTheme.headlineSmall,
      );

  Widget getTextWidget(String content) => SelectableText(
    content,
        textAlign: TextAlign.left,
        style: bonitoTextTheme.bodyMedium,
      );

  Widget getAuthorWidget(String author) => Text(
    author,
        style: bonitoTextTheme.labelMedium,
      );
}
