
PImage photo;
//float x;
int num = 50;
int[] x = new int[num];
int[] y = new int[num];


void setup() {
  size(1500, 1500);
  photo = loadImage("Milk.png");
  noCursor();
  smooth();
  noStroke();
}
void draw() {
  background(random(500));
  for (int i = num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }
  x[0] = mouseX;
  y[0] = mouseY;
  for (int i = 0; i < num; i++) {
   image(photo, x[i], y[i]);
}
}
void keyPressed()
{
switch (key) {
  case 'q':
  case 'Q':
  photo = loadImage("Koopa.png");
  break;
  case 'w':
  case 'W':
  photo.filter(INVERT);
  break;
  case 'e':
  case 'E':
  photo = loadImage("Mario.png");
  break;
  case 'r':
  case 'R':
  photo.filter(DILATE);
  break;
  case 't':
  case 'T':
  photo = loadImage("Tortuga.png");
  break;
  case 'y':
  case 'Y':
  photo.filter(ERODE);
  break; 
}
}
void mousePressed()
{
  image(photo, mouseX, mouseY);
  if (mousePressed == true) {
 
  } 
}


