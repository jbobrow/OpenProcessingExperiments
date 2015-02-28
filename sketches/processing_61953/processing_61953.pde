
PImage img1, img2;
PGraphics masker;
int step;
color c;


void setup() {
  size(400,400);
  background(0);
  noStroke();
  smooth();
 
  img1 = loadImage("kohl1.png");
  img2 = loadImage("kohl2.png");
  
  step = (width - 40) / 10;
 
  // Build image mask
  masker = createGraphics(width, height, JAVA2D);
  masker.beginDraw();
  masker.background(255);
  masker.fill(0);
  for (int gridY = step; gridY <= width - step; gridY += step) {
    for (int gridX = step; gridX <= width - step; gridX += step) {      

      masker.noStroke();
      masker.ellipse(gridX, gridY, 30, 30);
    }
  }
  
  
  masker.endDraw(); 
}

void draw() {
  rect(0,0,400,400);
  int transY = (int) map(mouseY, 0, 400, -20, 20);
  int transX = (int) map(mouseX, 0, 400, -20, 20);
  image(img1,transX,transY);
  image(img2,0,0);
  img2.mask(masker);
}

