
//Proficient with points, using image as described in the Pointillism by Daniel Shiffman
PImage img;
int smallPoint, largePoint;

void setup() {
  size(1621, 1920);
  img = loadImage("FRACTAL.jpg");
  smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  noStroke();
  background(255);
}

void draw() {
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(x,y, pointillize, pointillize);
  
  if (keyPressed) {
  saveFrame("images/artwork-###.png");
  }
}
  

