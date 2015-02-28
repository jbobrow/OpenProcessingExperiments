
sprite walker;
PImage spriteSheet;

void setup() {
  size(136, 200);
  smooth();
  
  spriteSheet = loadImage("sprSht1.png");
  walker = new sprite();
}

void draw() {
  background(180);
  image(spriteSheet, 0, 4);
  walker.check();
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case DOWN:  walker.turn(0); break;
      case UP:    walker.turn(1); break;
      case LEFT:  walker.turn(2); break;
      case RIGHT: walker.turn(3); break;
    }
  }
}

class sprite {
  PImage cell[];
  int cnt = 0, step = 0, dir = 0;
  
  sprite() {
    cell = new PImage[12];
    for (int y = 0; y < 4; y++)
      for (int x = 0; x < 3; x++)
        cell[y*3+x] = spriteSheet.get(x*24,y*48, 24,48);
  }
  
  void turn(int _dir) {
    if (_dir >= 0 && _dir < 4) dir = _dir;
    println (dir);
  }
  
  void check() {
    if (cnt++ > 7) {
      cnt = 0;
      step++;
      if (step >= 4) 
        step = 0;
    }
    int idx = dir*3 + (step == 3 ? 1 : step);
    image(cell[idx], 88, 76);
  }
}


