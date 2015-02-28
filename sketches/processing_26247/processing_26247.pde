
int x;
PFont STHeiti;
PImage myImage;

int y;
PFont Century;

void setup() {
  size(600,600);
  background(191,216,127);
  x = 0;
  STHeiti = loadFont("STHeiti-48.vlw");
  
  y = 0;
  Century = loadFont("CenturySchoolbook-Italic-48.vlw");
  myImage = loadImage("picture.jpg");
}

void draw() {
  tint(255,0,0,300);
  image(myImage,mouseX,mouseY,300,300);
  fill(255);
  textFont(Century);

  
  fill(0,10);
  textFont(STHeiti);
  text("forest", mouseX, mouseY);
}

