
int colorR;
int colorG;
int colorB;
int circleR;
int circleG;
int circleB;

void setup() {
  size(255,255);
  colorR = 255;
  colorG = 255;
  colorB = 255;
  circleR = 0;
  circleG = 0;
  circleB = 0;
  background(colorR,colorG,colorB);
}

void draw() {
  background(colorR-mouseY,colorG-mouseY,colorB-mouseY);
  ellipseMode(CENTER);
  
  noStroke();
  fill(circleR+mouseY,circleG+mouseY,circleB+mouseY);
  ellipse(width/2,height/2,150,150);
  noFill();
  
  if (mouseY < height/2) {
    PFont font;
    fill(colorR-mouseY,colorG-mouseY,colorB-mouseY);
    font = loadFont("Futura-Bold-48.vlw");
    textFont(font, 32);
    text("SUN", 95, 140);
  }
  
  if (mouseY > height/2) {
    PFont font;
    fill(colorR-mouseY,colorG-mouseY,colorB-mouseY);
    font = loadFont("Futura-Bold-48.vlw");
    textFont(font, 32);
    text("MOON", 70, 140);
  }
  
}


