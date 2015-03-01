
// José Manuel Bobadilla Álvaro | Arte Digital, 5to Semestre.


PImage img1, img2;
int selMode = REPLACE;
String name = "Mirada";
int picAlpha = 255;

void setup() {
  size(640, 360, P3D);
  img1 = loadImage("Cap1.jpg");
  img2 = loadImage("Cap2.jpg"); 
  noStroke();
}

void draw() {
  
  picAlpha = int(map(mouseX, 0, width, 0, 255));
  
  background(0);
  
  tint(255, 255);
  image(img1, 0, 0);

  blendMode(selMode);  
  tint(255, picAlpha);
  image(img2, 0, 0);

  blendMode(REPLACE); 
  fill(255);
  rect(0, 0, 94, 22);
  fill(0);
  text(name, 10, 15);
}

void mousePressed() {
  
  if (selMode == REPLACE) { 
    selMode = BLEND;
    name = "Miope";
  
  }
}

void mouseDragged() {
  if (height - 50 < mouseY) {
    picAlpha = int(map(mouseX, 0, width, 0, 255));
  }
}



