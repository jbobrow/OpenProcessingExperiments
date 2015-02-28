
RandomWalker rw;
RandomWalker rw2;

RandomWalker [] randomKiste;
void setup() {
  randomKiste = new RandomWalker[100];
  for (int i=0; i<100; i++) {
    randomKiste[i] = new RandomWalker(255, i* 20, 0);
  }
  size(800, 600);
  noStroke();
  background(0);
  frameRate(70);
}
void draw() {
  fill(0, 20);
  rect(0, 0, 800, 600);
  for(int i=0; i<100; i++){
  randomKiste[i].step();
  }
}

class RandomWalker { 
  float x = 400;
  float y = 300;
  float r = 1;
  float red = random(100, 255);
  float green = random(100, 255);
  float blue = random(100, 255);

  RandomWalker(float rd, float grn, float bl) {
    red = rd;
    green = grn;
    blue = bl;
  }

  void step() {

    fill(red, green, blue);
    ellipse(x, y, 20, 20);
    r=random(4);
    if (r<=1) {
      x = x + 8;
    }
    else if (r<=2) {
      x = x - 8;
    }
    else if (r<=3) {
      y = y + 8;
    }
    else {
      y = y -8;
    }
    if (x>800) {
      x=0;
    }
    if (x<0) {
      x=800;
    }
    if (y>600) {
      y=0;
    }
    if (y<0) {
      y=600;
    }
  }
}
