
//For Design3 background

int dx = 15, dy = 15;

void setup(){
  size (800, 800); // Define display window size
  background(0); // set background to black
  smooth();
}

void draw() {
  for (int y = 5; y <= height; y = y+dy) {
    for (int x = 5; x <=width; x = x +dx) {

      if (x <= 15) {
        fill(random(255), random(255), random(255));
      }
      else {
        fill(random(255), random(255), random(255));
      }
      ellipse (x, y, 15, 15);
      frameRate(24);
      noStroke(); //no outline
    }
  }
}



