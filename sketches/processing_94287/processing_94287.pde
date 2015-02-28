
float tileCount = 20;
color circleColor = color(0);
int circleAlpha = 180;
int actRandomSeed = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
}

void draw() {

  translate(width/tileCount/2, height/tileCount/2);

  background(255);
  smooth();
  noFill();

  randomSeed(actRandomSeed);

 
  strokeWeight(mouseY/60);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX);
      float shiftY = random(-mouseX, mouseX);
      stroke(random(255),255,255, circleAlpha);
      ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);
    }
  }
}

void mousePressed() {
  actRandomSeed = (int) random(100000);
}
