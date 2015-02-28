
class Block extends Element {

  Block(float[] storedx, float[] storedy, int len, float minX, float minY, float maxX, float maxY, float _scaleBy, boolean _scaling, int _increment, int _simplify, int _sizeLimit, boolean _readyToMove, float _moveX, float _moveY, int _dirX, int _dirY) {
    super(storedx, storedy, len, minX, minY, maxX, maxY, _scaleBy, _scaling, _increment, _simplify, _sizeLimit, _readyToMove, _moveX, _moveY, _dirX,  _dirY);
    super.determineScale();
  } 

  void display() {
    stroke(100, 100, 100);
    strokeWeight(6);
    fill(200, 200, 200,200);

    super.displayStaticElementClosed();
  }
}

