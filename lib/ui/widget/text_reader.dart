import 'package:flutter/material.dart';
import 'package:pessoa_bonito/model/pessoa_category.dart';
import 'package:pessoa_bonito/model/pessoa_text.dart';
import 'package:pessoa_bonito/service/arquivo_pessoa_service.dart';
import 'package:pessoa_bonito/ui/bonito_theme.dart';
import 'package:pessoa_bonito/ui/widget/service_error_widget.dart';

class TextReader extends StatelessWidget {
  final ArquivoPessoaService service;
  final PessoaCategory currentCategory;
  final PessoaText currentText;
  final ScrollController _scrollController = ScrollController();

  TextReader(
      {Key? key,
      required this.service,
      required this.currentCategory,
      required this.currentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PessoaText>(
        future: service.fetchText(currentText, currentCategory),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(child: ServiceErrorWidget(snapshot.error!));
          }

          if (!snapshot.hasData) return const CircularProgressIndicator();

          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.fastOutSlowIn,
            );
          }

          final fetchedText = snapshot.data!;

          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child:
                        Center(child: getCategoryWidget(currentCategory.title)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16.0),
                    child: getTitleWidget(fetchedText.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: getTextWidget(fetchedText.content ?? 'NO TEXT'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: getAuthorWidget(fetchedText.author ?? 'NO AUTHOR'),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget getCategoryWidget(String title) => Text(
        title,
        style: bonitoTextTheme.titleMedium,
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
        style: bonitoTextTheme.titleSmall,
      );
}
