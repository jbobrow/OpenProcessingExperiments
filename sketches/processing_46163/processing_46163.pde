
PImage myImage1;
PImage myImage2;

void setup() {
  size(1000,1000);
  myImage1 = loadImage("yellow.jpg");
  myImage2 = loadImage("star.jpg");
}

void draw() {
  tint( 10, 100, 600, 40);
  image(myImage1, 250, 250, 500, 500);
  
  tint(70, 0, 500, 100);
  image(myImage2, mouseX, mouseY);
}

