
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/68008*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
Drop[] drop = new Drop[20];
PImage b;

void setup() {
  size(400, 267);

   b = loadImage("fallingstrawberries.jpg");

  smooth();
  for (int i = 0; i < drop.length;i++) {
    float x = random(width);
    float s = random(1, 5);
    float c1 = random(50);
    float c2 = random(255);
    drop[i] = new Drop(x, s, c1, c2);
  }
  noStroke();
}

void draw() {
  image(b, 0, 0);

  for (int i = 0; i < drop.length;i++) {
    drop[i].move();
    drop[i].display();
  }
}
class Drop {
  float x;
  float y;
  float s;
  float c1;
  float c2;
  float speed;

  Drop(float tmpX, float tmpS, float tmpC1, float tmpC2) {
    x = tmpX;
    y = 0;
    s = tmpS;
    c1 = tmpC1;
    c2 = tmpC2;
    speed = 6 -s;
  }

  void move() {
    y += speed;

    if (y > height) {
      y =  - 70 * (s / 3);
      c1 = random(150);
      c2 = random(255);
      x = random(width);
    }
  }

  void display() {
    fill(#F71635);
    for (int i = 10; i > 0;i--) {
      rect(x, y+i*1.2*s, s*i+3, s*i+3);
    }
  }
}



