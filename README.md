A plug and play [Bitsocket](https://bitsocket.network/#/) for Flutter Web.



## Usage

Connect to Bitsocket:

```
import 'package:bitsocket_connect/bitsocket_connect.dart';
var query = {
    'v': 3,
    'q': {
      'find': {},
      'project': {"tx.h": 1}
    }
  };
  
  void process(tx){
   print(tx);
  }

var bitsocket=Bitsocket();
bitsocket.connect(query,process);
```

Close the connection:
`bitsocket.close()`

