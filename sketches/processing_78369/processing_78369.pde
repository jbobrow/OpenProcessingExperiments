
import processing.opengl.*;

float vy;
Rain r1;

int numDrops = 400;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(600, 600, OPENGL);
  vy =.3;
  background(0);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}

void draw() {
  fill(0, 90);
  rect(0,0,600,600);
  //background(0);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
}

class Rain {
  float r = random(600);
  float y = random(-height);

  void fall() {
    y = y + 10*vy;
    fill(255);
    ellipse(r, y, 3, 3);

    if (y>height) {
      r = random(600);
      y = random(-200);

    }
  }
}
