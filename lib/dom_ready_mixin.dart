library domready_mixin;

import 'dart:async';

bool _debug = true;
int _w;

abstract class DomReadyMixin {
  Completer _whenDomReadyCompleter = new Completer();
  bool _domReadyScheduled = false;

  Future get whenDomReady => _whenDomReadyCompleter.future;

  // call base
  domReady() {
    if (_debug) {
      print('$runtimeType domReady');
    }
    _whenDomReadyCompleter.complete();
  }

  // simulate domReady
  attached() {
    if (_debug) {
      print('$runtimeType attached');
    }
    // domReady only once, even when attached again
    if (!_domReadyScheduled) {
      _domReadyScheduled = true;
      new Future.delayed(new Duration(), domReady);
    }
  }
}
