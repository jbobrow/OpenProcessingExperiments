
import processing.opengl.*;

//CUBE 3D
boolean INIT = true;
int start;
int time;
int duration = 3000;
ArrayList Boxes = new ArrayList();
int div = 32;
int SIZE = 10;

void setup() {
  size(800, 900, OPENGL);
  colorMode(HSB, 360, 100, 100, 100);
  hint(ENABLE_OPENGL_4X_SMOOTH);
  frameRate(60);
}

void draw() {
  camera(map(mouseX, 0, width, width, 0), map(mouseY, 0, height, height, 0), (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, 0, 1, 0);
  println(frameRate);
  for (int i = 0; i <= width; i += width/div ) { 
    for (int j = 0; j <= height; j += height/div ) { 
      Boxes.add(new BOX(SIZE, i+(width/(div*2)), j+(height/(div*2))));
    }
  }

  background(0);
  if (INIT) {
    start = millis(); 
    INIT = false;
  }
  for (int i = 0;i < Boxes.size(); i++) {
    BOX tmp = (BOX)Boxes.get(i);
    tmp.draw();
  }

  time = millis() - start;
  if (time >= duration) {

    INIT = true;
  }
  for (int i = 0; i < Boxes.size();i++) { 
    Boxes.remove(i);
  }
}

void mouseClicked() {

  if (mouseButton == LEFT) {
    div++;
  }
  if (mouseButton == RIGHT) {
    if (div > 1) {
      div--;
    }
  }
}

class BOX {

  private int size;
  private float x, y;

  BOX(int _size, float _x, float _y) {
    // println("New Box:\n\tX: "+ _x + "\n\tY: " + _y);
    this.size = _size;
    this.x = _x; 
    this.y = _y;
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotateX(map(x, 0, height, 0, PI));

    rotateY(map(x, 0, width, 0, TWO_PI+TWO_PI));
    if (time < duration/2) {
      fill(map(time, 0, duration, 0, 360), 100, 100, 50);
      box(map(time, 0, duration, size, size*8), size, size); //map(time, 0, duration, size, size*8)
    }
    else if (time > duration/2) {
      fill(map(time, 0, duration, 360, 0), 100, 50);
      box(map(time, 0, duration, size*8, size), size, size); //map(time, 0, duration, size*8, size)
    }
    popMatrix();
  }
}


