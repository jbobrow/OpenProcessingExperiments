
RandomWalker[] walkerKiste;
void setup() {
  size(640, 360);
  background(0);
  strokeWeight(15);
  frameRate(100);
  walkerKiste = new RandomWalker[200];
  for (int i=0; i < 200; i++) {
    walkerKiste[i] = new RandomWalker(random(255), random(255), random(255));
  }
}

void draw() {
  noStroke();
  fill(0, 0, 0, 100);
  rect(0, 0, 1200, 800);
  for (int i=0; i<200; i++) {
    walkerKiste[i].step();
  }
}

class RandomWalker {
  float x = 800;
  float y = 400;
  float r = 0;
  float red = random(0, 255);
  float green = random(0, 255);
  float blue = random (0, 255);

  RandomWalker(float rd, float grn, float bl) {
    red = rd;
    green = grn;
    blue = bl;
  }  

  void step() { 
    stroke(red, blue, green);
    point(x, y);
    r=random(4);

    if (r<=1) {
      x = x+35;
    }
    else if (r<=2) {
      x = x-35;
    }
    else if (r<=3) {
      y = y+35;
    }

    else {
      y = y-35;
    }

    if (x>1100) {
      x=0;
    }

    if (x<0) {
      x=800;
    }
    if (y>800) {
      y=0;
    }
    if (y<0) {
      y=800;
    }
  
  if (dist(mouseX, mouseY, x, y)<100){
    x = x - mouseX;
    y = y - mouseY;
  }
  }
}
