
float tileCount = 20;
int circleAlpha = 13;
int actRandomSeed = 0;

void setup() {
  size(500, 500);
  colorMode(HSB);
  background(255);
}

void draw() {
  noStroke();
  fill(255, 30);
  rect(0, 0, 500, 500);

  translate(width/tileCount/2, height/tileCount/2);

  smooth();
  noFill();

  randomSeed(actRandomSeed);

  stroke(mouseX/2, 255, 255, circleAlpha);
  strokeWeight(3+mouseY/250);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = width/tileCount * gridX*2;
      float posY = height/tileCount * gridY;

      float shiftX = random(-mouseX, mouseX);
      float shiftY = random(-mouseX, mouseX);

      ellipse(posX+shiftX, posY+shiftY, 60-mouseX/100, 60-mouseX/100);
    }
  }
}


