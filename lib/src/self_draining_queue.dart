class SelfDrainingQueue {
  Function _func;
  var _queue = [];
  var draining = false;

  SelfDrainingQueue(this._func);

  void _drainQueue() {
    if (!draining) {
      draining = true;
      while (_queue.isNotEmpty) {
        _func(_queue[0]);
        _queue.removeAt(0);
      }
      draining = false;
    }
  }

  void enqueue(item) {
    _queue.add(item);
    _drainQueue();
  }
}