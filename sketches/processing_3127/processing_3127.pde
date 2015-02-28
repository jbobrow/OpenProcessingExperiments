
PImage a, b, c;
int xPos = 0;
int alphaB = 0;
int maxAlphaB = 105;

void setup() {
  size(400, 400);
  a = loadImage("test1.jpg");
  b = loadImage("test2.jpg");
  int dimension = (b.width*b.height); // b wird mitberechnet
  b.loadPixels();
  for (int i = 0; i < (400*400); i++) {
  }
  frameRate(60);
}

void draw() {
  imageMode(CORNER);
  tint(255, 255, 255, 255);
  image(a, 0, 0);
  imageMode(CENTER);
  tint(255, 255, 255, alphaB);
  image(b, xPos + width / 2, height / 2, b.width - maxAlphaB + alphaB, b.height - maxAlphaB + alphaB);
  
  if (alphaB < maxAlphaB) alphaB += 1;
}

void mouseDragged() {
  xPos += mouseX - pmouseX;
  xPos = constrain(xPos, -width+50, width-50);
}

