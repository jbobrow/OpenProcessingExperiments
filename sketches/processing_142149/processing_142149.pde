
// Generative Tile
//
// Jenny Hsu
// Benjamin Bacon
// Creative Computing Section B
// 26 March 2014
//
// based on this code: http:generative-gestaltung.de/P_2_1_1_04


int tileCount;
float tileWidth, tileHeight, shapeSize;
float newShapeSize = shapeSize;
float shapeAngle = 0;
float maxDist, angle, x, y, radius, theta;

color shapeColor = color(234, 154, 2);
int fillMode = 0;
int sizeMode = 0;

void setup() {
  size(600, 600);
  background(255);
  smooth();

  tileCount = 8;
  shapeSize = width/tileCount;

  tileWidth = width/float(tileCount);
  tileHeight = height/float(tileCount);
  maxDist = sqrt(sq(width)+sq(height));
  radius = width/3;
}


void draw() {

  background(255);

  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      float posX = tileWidth*gridX + tileWidth/2;
      float posY = tileHeight*gridY + tileWidth/2;


      newShapeSize = shapeSize;

      x = mouseX/2 + sin(theta)*radius;
      y = mouseY/2 + cos(theta)*radius;

//      angle = atan2(y-posY, x-posX) + radians(shapeAngle);
      angle = atan2(mouseX, mouseY) + radians(shapeAngle);
      float a = map(dist(mouseX, mouseY, posX, posY), 0, maxDist, 10, 255);
      fill(shapeColor, a);  

      pushMatrix();
      translate(posX, posY);
      rotate (angle);
      rectMode(CENTER);

      noStroke();
      rect(0, 0, newShapeSize, newShapeSize);
      popMatrix();
    }
  }
  
  // capture photo; usually keep it turned off
//  theta += 0.0523;
//  if (frameCount % 2 == 0 && frameCount < 150) saveFrame("image-###.gif");
  
}



