
PShape grounds;
PShape tree1s;
PShape tree2s;
PImage ghostg;


Ghost ghost;
Ghost ghost2;
Ghost ghost3;

void setup() {
  size(640, 480);
  smooth();
  grounds = loadShape("ground.svg");
  tree1s = loadShape("tree1.svg");
  tree2s = loadShape("tree2.svg");
  ghostg = loadImage("ghost.gif");
  ghost = new Ghost(370, 330, 50, 50);
  ghost2 = new Ghost(170, 320, 100, 90);
  ghost3 = new Ghost(400, 300, 300, 250);

}
void draw() {
  background(31, 58, 124);
  shapeMode(CORNER);
  ghost.move();
  ghost.display();
  for (int i = -25; i < width + 40; i += 150) {
    tree1(i, 100);
  }
  for (int j = 5; j < width + 40; j += 60) {
    tree2(j, 140);
  }
  shape(grounds, 0, 0);
  fill(250);
  noStroke();
  ellipse(500, 60, 50, 50);

  ghost2.move();
  ghost2.display();
  ghost3.move();
  ghost3.display();
}

void tree1(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(.3);
  shape(tree1s, x, y);
  popMatrix();
}

void tree2(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(.5);
  shape(tree2s, x, y);
  popMatrix();
}

class Ghost {
  float gx;
  float gy;
  float gw;
  float gh;
  float speed = 5;

  Ghost(float tempX, float tempY, float tempW, float tempH) {
    gx = tempX;
    gy = tempY;
    gw = tempW;
    gh = tempH;
  }


  void move() {
    gx += random(-speed, speed);
    gy += random(-speed/10, speed/10);
  }

  void display() {
    image(ghostg, gx, gy, gw, gh);
  }
}



