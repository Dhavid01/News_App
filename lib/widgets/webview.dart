import 'package:flutter/material.dart';
import 'package:news/utils/color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExploreWebView extends StatefulWidget {
  const ExploreWebView({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<ExploreWebView> createState() => _ExploreWebViewState();
}

class _ExploreWebViewState extends State<ExploreWebView> {
  late WebViewController _webViewController;
  double _webViewProgress = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (await _webViewController.canGoBack()) {
            _webViewController.goBack();
            return false;
          } else {
            return false;
          }
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              actions: [
                IconButton(
                    onPressed: () => _webViewController.reload(),
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ))
              ],
            ),
            body: Column(
              children: [
                LinearProgressIndicator(
                  value: _webViewProgress,
                  color: kPrimaryColor,
                  backgroundColor: Colors.white,
                ),
                Expanded(
                  child: WebView(
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: widget.url,
                    onWebViewCreated: (controller) {
                      this._webViewController = controller;
                    },
                    onProgress: (progress) =>
                        setState(() => this._webViewProgress = progress / 100),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
