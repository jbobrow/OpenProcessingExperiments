
PImage brain1;
PImage brain2;

float X;
float Y;

void setup() {
size(640, 480);
smooth();

brain1 = loadImage("brain1.jpg");
brain2 = loadImage("brain2.jpg");

}

void draw() {
  tint(255,255);
  image (brain1, -25, -10);
  
  
  float X = map(mouseX, 518, 92, 255, 0);
  //float Y = map(mouseY, 425, 61, 255, 0);
  tint (255, X);
  //tint (255, Y);
  image (brain2, -25, -10);
  
  
}


