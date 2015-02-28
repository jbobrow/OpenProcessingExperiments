
PImage rbc;
PImage rbc2;
PImage wbc1;



void setup() {
  size(600,600);
  noStroke();
  background(255);
}

void draw() {
  float a1 = random(1,3);
  float a2 = random(1,3);
  float a3 = random(1,3);
  float a4 = random(1,3);
  float a5 = random(1,3);
  float a6 = random(1,3);
  rbc1(80,100,a1,a2);
  rbc2(420,130,a3,a4);
  wbc1(230,350,a5,a6);
}

void rbc1(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);
 
  rbc = loadImage("rbc1.png");
  image(rbc, a,b);
  
  popMatrix();
}
void rbc2(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);
  
  rbc2 = loadImage("rbc2.png");
  image(rbc2,a,b);
popMatrix();
}
void wbc1(int x, int y,float a, float b) {
  pushMatrix();
  translate(x,y);
  
  wbc1 = loadImage("wbc1.png");
  image(wbc1,a,b);
popMatrix();
}

