
int step = 7, stepY=60;
float r, ns = 0;
color[] palette = {
  #572107, #9f310e, #f15a23, #f57921, #fc9b18
};


void setup() {
  size(800, 600);
  background(20);
  rectMode(CENTER);
  for (int y=0; y<height+stepY; y +=stepY) {
    ns = random(1000);
    for (int x=0; x<width+step; x +=step) {
      float w = 1.1*step;
      float m = 0+noise(ns/2)*10;
      float h = m*step;
      pushMatrix();
      r = radians(45)-noise(ns)*radians(90);
      translate(x, y);
      rotate(r);
      fill(255);
      stroke(0);
      if (random(1)>.5) {
        int f = int(noise(ns)*5);
        fill(palette[f]);
      }
      rect(0, 0, w, h);
      popMatrix();
      ns += 0.2;
    }
  }
}

void draw(){}

void keyPressed() {
  save(random(100)+".jpg");
}

