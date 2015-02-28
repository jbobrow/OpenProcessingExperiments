
///8a objectlollipop
//
float angle = 0.0;
float x;
float y;
float targetX, targetY;
float ease = 0.05;
float transparency = 200;

void setup() {
  size(800, 600);
  background(0);
  smooth();
}

void draw() {
///mouse clicked
  if (mousePressed) {

    if (mouseButton == LEFT) {
      translate(mouseX, mouseY);
      float scaled = sin(angle) + 2;
      scale(scaled);
      strokeWeight(0.5 / scaled);
      transparency = random(-100, 100);
      rotate(angle);
      angle += 10;
      //lollipop
      stroke(0);
      fill(255, 134, 15);
      ellipse(170, 170, 100, 100);
      fill(100, 168, 5);
      ellipse(170, 170, 120, 120);
      fill(224, 91, 94);
      strokeWeight(.5);
      ellipse(170, 170, 90, 90);
      fill(0, 126, 211);
      ellipse(170, 170, 50, 50);
      fill(1, 141, 52);
      ellipse(170, 170, 20, 20);

      //stem
      stroke(255);
      strokeWeight(1);
      line(170, 170, 10, 6);
    }

    }
  }







