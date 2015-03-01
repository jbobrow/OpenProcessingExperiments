
//flowersForAlgebra
//pramaterizing flower patterns with code to create an infinite variation of blossoms

float posX, posY;
float centerSize;
float flowerSize = 200;
boolean randomize = true;

void setup() {
  size(800, 800);
  posX = width/2;
  posY = height/2;
  smooth();
}

void draw() {

  translate(flowerSize/2, flowerSize/2);

  if (randomize) {
    background(255);
    noStroke();
    for (int i = 0; i < width/flowerSize; i++) {
      for (int j = 0; j < height/flowerSize; j++) {
        posX = flowerSize * i;
        posY = flowerSize * j;
        sprigs(posX, posY, 3, 7, #80ED0E, 255, .20, .40, .40, .60);

        centerSize = random(flowerSize * .1, flowerSize * .45);
        center(posX, posY, centerSize, #ED4A0E, 220);

        innerRing(posX, posY, .70, .30, .60, 3, 13, #ED0EBD, 100);
        innerRing(posX, posY, .90, .10, .60, 3, 6, #E9ED0E, 170);
        innerRing(posX, posY, .10, .90, .60, 3, 13, #0E47ED, 100);
        innerRing(posX, posY, .20, .20, .35, 5, 7, #FF7403, 160);
      }
    }
    randomize = false;
  }
}

void mouseReleased() {
  randomize = !randomize;
}


void innerRing(float x, float y, float sizeW, float sizeH, float distFC, int lowCount, int highCount, color c, int alpha) {
  pushMatrix();
  pushStyle();
  translate(x, y);
  float ringCount = int(random(lowCount, highCount));
  fill(c, alpha);
  for (int i = 0; i < ringCount; i++) {
    ellipse(0 + (distFC * flowerSize/2), 0, sizeW * flowerSize/2, sizeH * flowerSize/2);
    rotate(radians(360/ringCount));
  }
  popMatrix();
  popStyle();
}

void center(float x, float y, float size, color c, int alpha) {
  pushMatrix();
  pushStyle();
  translate(x, y);
  fill(c, alpha);
  ellipse(0, 0, size, size);
  popMatrix();
  popStyle();
}

void sprigs(float x, float y, int lowCount, float highCount, color c, int alpha, float cp1, float cp2, float cp3, float cp4) {
  pushMatrix(); 
  pushStyle();
  translate(x, y);
  fill(c, alpha);
  float sprigCount = int(random(lowCount, highCount));
  for (int i = 0; i < sprigCount; i++) {
    bezier(0, 0, cp1 * flowerSize/2, cp2 * flowerSize/2, cp3 * flowerSize/2, cp4 * flowerSize/2, 0, flowerSize/2);
    bezier(0, 0, cp1 * flowerSize/2, -cp2 * flowerSize/2, cp3 * flowerSize/2, -cp4 * flowerSize/2, 0, -flowerSize/2);
    rotate(radians(360/sprigCount));
  }
  popMatrix();
  popStyle();
}

