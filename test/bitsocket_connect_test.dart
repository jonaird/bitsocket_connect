import 'package:bitsocket_connect/bitsocket_connect.dart';
import 'package:test/test.dart';

// import '../lib/bitsocket_connect.dart';

void main() {
  void process(tx){
    print(tx);
  }
  var query = {
    'v': 3,
    'q': {
      'find': {},
      'project': {"tx.h": 1}
    }
  };

  var bitsocket = Bitsocket();
  bitsocket.connect(query, process);
}
