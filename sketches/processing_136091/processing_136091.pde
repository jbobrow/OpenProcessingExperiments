
PImage img;
//PSound sound;
 
int oldx;
int oldy;

float r = random(0,100);
float g = random(0,255);
float b = random(0,255);

void setup() {
 size(500,500); 
 background(r,g,b);
 img = loadImage("blut.gif");
 //sound = loadSound("clong.wav"); 
}

void draw() {
  background(r,g,b);
  //point(mouseX, mouseY);
  //line(mouseX, mouseY, oldx, oldy);
  fadenkreuz(mouseX, mouseY);
  oldx = mouseX;
  oldy = mouseY;
  
  if (mousePressed) {
  image(img, mouseX, mouseY); 
  //sound.loop(1);
  }
}

void fadenkreuz(int x, int y) {
  fill(r,g,b);
  ellipse(x,y,20,20);
  line(x-10,y,x+10,y);
  line(x,y-10,x,y+10);
}

