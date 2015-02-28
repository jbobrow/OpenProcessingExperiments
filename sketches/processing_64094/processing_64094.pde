
PImage e1;
PImage e2;
PImage e3;
PImage e4;
PImage g1;
  
void setup() {
  size(600, 600);
  e1 = loadImage("1.jpg");
  e2 = loadImage("2.jpg");
  e3 = loadImage("3.jpg");
  e4 = loadImage("4.jpg");
  g1 = loadImage("gopher.png");
  frameRate(1);
  imageMode(CENTER);
}
  
void draw() {
  background(0);
  float x = random(width);
  float y = random(height);
  float d = random(100, 300);
  float a = random(25,255);
  float g = random(50,150);
  float xx= random(100,500);
   
  tint(255, 255, 255, a); 
  image(e1, x, y, d, xx);
  image(e2, d, d,xx,d);
  image(e3, 300,d,x,y);
  image(e4, d,400,d,d);
  image(g1,450,300,g,g);
}

