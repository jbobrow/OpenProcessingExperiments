
RandomWalker rw;
RandomWalker rw2;

RandomWalker [] randomKiste;
void setup() {
  randomKiste = new RandomWalker[1000];
  for (int i=0; i<1000; i++) {
    randomKiste[i] = new RandomWalker(random(255),random(100),random(100),150);
  }
  size(800, 600);
  noStroke();
  background(0);
  frameRate(50);
}
void draw() {
  fill(0, 30);
  rect(0, 0, 800, 600);
  for(int i=0; i<1000; i++){
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
  float trans = random(255);

  RandomWalker(float rd, float grn, float bl, float tr) {
    red = rd;
    green = grn;
    blue = bl;
    trans = tr;
  }

  void step() {

    fill(red, green, blue, trans);
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
    if(dist(mouseX, mouseY, x, y)<70){
      x = x + x- mouseX;
      y = y + y -mouseY;
    }
  }
}
