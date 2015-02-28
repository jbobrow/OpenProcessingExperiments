
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
float r;
float r2;
float z1;
float z2;
float z3;
float z4;
float z5;
float z6;
float z7;
  
void setup() {
  size(600, 300);
  smooth();
  a = loadImage("1.JPG");
  b = loadImage("2.JPG");
  c = loadImage("3.JPG");
  d = loadImage("4.JPG");
  e = loadImage("5.JPG");
  f = loadImage("6.JPG");
  g = loadImage("7.JPG");
  
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(0);
  image(b,width/2,height/2, 600,300);
  
  float x = random(width);
  float y = random(height);
  float r = random(600);
  float r2 = random(-50, 100);
  float z1 = random(0,255);
  float z2 = random(60,255);
  float z3 = random(100,255);
  float z4 = random(100,255);
  float z5 = random(100,255);
  float z6 = random(150,255);
  float z7 = random(200,255);
  
  tint(z1,z1,z1);
  image(a, r2+40, r2-30, r-20,r-20);
   tint(z2,z2,z2);
  image(b, x/r2, y*4*r2,r+r2, r+r2);
   tint(z3,z3,z3);
  image(c, x/3, y*20, r*5, r*5);
   tint(z4,z4,z4);
  image(d,x*3*r2, y/r2, r*100, r*100);
   tint(z5,z5,z5);
  image(e, x+r2, y-r2, r+40, r+40);
   tint(z6,z6,z6);
  image(f, x*r2*10, y*10/r2, r+r2, r+r2);
   tint(z7,z7,z7);
  image(g, x-20, y+20, r, r);
  

}


