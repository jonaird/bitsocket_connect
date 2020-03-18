import 'dart:convert';
import 'dart:html';
import './self_draining_queue.dart';


class Bitsocket {
  var _socket;

  void close() {
    if (_socket!=null) {
      _socket.close();
    }
  }

  void connect(Map query,Function process) {
    close();
    var queue = SelfDrainingQueue(process);
    var json = jsonEncode(query);
    var bytes = utf8.encode(json);
    var b64 = base64.encode(bytes);
    _socket = EventSource('https://txo.bitsocket.network/s/' + b64);
    _socket.onMessage.listen((event) {
      var txs = jsonDecode(event.data)['data'];
      txs.forEach((tx)=>{
        queue.enqueue(tx)
      });
      // for (var i = 0; i < d.length; i++) {
      //   queue.enqueue(d['data'][i]);
      // }
    });
  }
}
