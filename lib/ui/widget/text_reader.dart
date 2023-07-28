import 'package:flutter/material.dart';
import 'package:pessoa_bonito/ui/bonito_theme.dart';
import 'package:pessoa_bonito/util/widget_extensions.dart';
import 'package:share_plus/share_plus.dart';

class TextReader extends StatelessWidget {
  final ScrollController _scrollController;
  final String categoryTitle;
  final String title;
  final String text;
  final String author;

  TextReader({
    Key? key,
    ScrollController? scrollController,
    required this.categoryTitle,
    required this.title,
    required this.text,
    required this.author,
  })  : _scrollController =
            scrollController ?? ScrollController(keepScrollOffset: false),
        super(key: key);

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
              child: Center(child: ReaderCategoryText(categoryTitle)),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ReaderTitleText(title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ReaderContentText(author, text),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Center(
                child: ReaderAuthorText(author),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReaderCategoryText extends StatelessWidget {
  final String category;

  const ReaderCategoryText(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: bonitoTextTheme.titleSmall,
    );
  }
}

class ReaderTitleText extends StatelessWidget {
  final String title;

  const ReaderTitleText(
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: bonitoTextTheme.headlineSmall,
    );
  }
}

class ReaderContentText extends StatelessWidget {
  final String author;
  final String text;

  const ReaderContentText(
    this.author,
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: TextAlign.left,
      style: bonitoTextTheme.bodyMedium,
      contextMenuBuilder: (ctx, state) {
        final String selectedText = state.getSelectedText();
        final List<ContextMenuButtonItem> buttonItems =
            state.contextMenuButtonItems;

        buttonItems.add(ContextMenuButtonItem(
          label: 'Share',
          onPressed: () {
            ContextMenuController.removeAny();
            Share.share('"$selectedText" - $author');
          },
        ));

        return AdaptiveTextSelectionToolbar.buttonItems(
          anchors: state.contextMenuAnchors,
          buttonItems: buttonItems,
        );
      },
    );
  }
}

class ReaderAuthorText extends StatelessWidget {
  final String author;

  const ReaderAuthorText(this.author, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      author,
      style: bonitoTextTheme.labelMedium,
    );
  }
}
