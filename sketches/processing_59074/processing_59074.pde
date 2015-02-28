
// gil  modigliani and grass

float inc = 0.0, k=0.0, k1=0.0;
PImage gwimg;

void setup() {
  size(500, 180);
  gwimg = loadImage("dis03.jpg");
  smooth();
}

void draw() {
  background(255);
  image (gwimg, 0, 0, 500, 163);
  inc += 0.01;
  float angle = sin(inc) / 50.0 + sin(inc *0.8) / 35.0;
  randomSeed(1); //sequence of grass leaves should be always the same
  for (int i=0; i<500; i+=6) {
    k1=angle;
    grass(i, int(random(10, 15)), k1); 
    k1=angle/1.1;
    grass(i+=5, int(random(10, 15)), k1); 
    k1=angle*1.8;
    grass(i+=8, int(random(9, 20)), k1);
  }
}

void grass(int x, int units, float angle) {
  pushMatrix();
  translate(x, height);
  scale(2.4);

  int G=int(random(50, 90)); //base color green
  int T=200;
  for (int i = units; i > 0; i--) {
    strokeWeight(i/2);
    stroke(15, G+=7, 28, T-=10);
    line(0, 0, 0, -5);
    translate(0, -2);
    rotate(angle);
  }
  popMatrix();
}


