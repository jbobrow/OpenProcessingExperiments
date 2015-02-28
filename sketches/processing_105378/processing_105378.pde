
void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  background(255);
  noStroke();
  fill(33);
  zeroPos(9, 9);
}

void zeroPos(int amount, int sides) {
  float gutter = (height*width)/30000;
  float posX = (width-gutter) / (amount+1);
  float posY = (height-gutter) / (amount+1);
  
  for (int i=1; i < amount+1; i++) {
    for (int j=1; j < amount+1; j++) {
      translate (j*posX, i*posY);
      randomPolygon(sides, posX/4);
      translate(-j*posX, -i*posY);
    }
  }
}

void randomPolygon (int sideCount, float radius) {
  float theta = 0.0;
  float x = 0.0;
  float y = 0.0;
  
  float randomX, randomY;
  
  
  beginShape();
  
  for (int i=0; i < sideCount; i++) {
    randomX = random(0, (radius*2)/(sideCount/2));
    randomY = random(0, (radius*2)/(sideCount/2));
    x = cos(theta)*radius + randomX;
    y = sin(theta)*radius + randomY;
    vertex (x,y);
    theta += TWO_PI/sideCount;
  }
  endShape(CLOSE);
}
