
class LargeBase extends Base {
  LargeBase(int x, int y, int type ) {
    super(x, y, type);
    r = 30;
    maxCap = 120;
    curCap = 45;
    SPAWN_STAT = 25;
  }
  void draw() {
    SPAWN_STAT = 20;
    super.draw();
  }
}

class NormalBase extends Base {
  NormalBase(int x, int y, int type ) {
    super(x, y, type);
    r = 25;
    maxCap = 60;
    curCap = 15;
    SPAWN_STAT = 40;
  }
  void draw() {
    SPAWN_STAT = 40;
    super.draw();
  }
}

class SmallBase extends Base {
  SmallBase(int x, int y, int type ) {
    super(x, y, type);
    r = 20;
    maxCap = 20;
    curCap = 5;
    SPAWN_STAT = 60;
  }
  void draw() {
    SPAWN_STAT = 60;
    super.draw();
  }
}


