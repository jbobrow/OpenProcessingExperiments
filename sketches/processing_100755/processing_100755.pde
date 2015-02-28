
PShape ground;
PShape tree1;
PShape tree2;
PImage ghostsvg;

Ghost ghost;
Ghost ghost2;

void setup() {
  size(640, 480);
  smooth();
  ground = loadShape("ground.svg");
  tree1 = loadShape("tree1.svg");
  tree2 = loadShape("tree2.svg");
  ghostsvg = loadImage("ghost.gif");
  ghost = new Ghost(width/2, 350, 50, 50);
  ghost2 = new Ghost(200, 320, 70, 60);

}
void draw() {
  background(31, 58, 124);
  shapeMode(CORNER);
  for (int i = -25; i < width + 40; i += 150) {
    tree1(i, 100);
  }
  for (int j = 5; j < width + 40; j += 60) {
    tree2 (j, 140);
  }
  shape(ground, 0, 0);
  fill(250);
  ellipse(500, 60, 50, 50);
  ghost.move();
  ghost.display();
  ghost2.move();
  ghost2.display();
}

void tree1(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(.3);
  shape(tree1, x, y);
  popMatrix();
}

void tree2(int x, int y) {
  pushMatrix();
  translate(x, y);
  scale(.5);
  shape(tree2, x, y);
  popMatrix();
}

class Ghost {
  float gx;
  float gy;
  float gw;
  float gh;
  float speed = 3;

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
    image(ghostsvg, gx, gy, gw, gh);
  }
}



