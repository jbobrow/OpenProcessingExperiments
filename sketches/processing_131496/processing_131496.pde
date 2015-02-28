
int tileCount; 
float tileWidth, tileHeight, shapeSize;
float newShapeSize = shapeSize;
float shapeAngle = 0;
float maxDist, angle, x, y, radius, theta;

color shapeColor = color(0, 130, 164);
int fillMode = 0;
int sizeMode = 0;


void setup() {
  size(500, 500);
  background(255);
  smooth();

  tileCount = 15;
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

      newShapeSize = shapeSize*.7;

      x = width/2 + sin(theta)*radius;
      y = height/2 + cos(theta)*radius;

      angle = atan2(y-posY, x-posX) + radians(shapeAngle);
      float a = map(dist(x, y, posX, posY), 0, maxDist, 0, 1);
      noFill();
      if (a>.3) {
        fill(220);
        strokeWeight(2);
        stroke(20);
      } 
      else
      {
        noStroke();
      }

      pushMatrix();
      translate(posX, posY);
      rectMode(CENTER);
      
      rect(0, 0, newShapeSize, newShapeSize);
      popMatrix();
    }
  }
  theta += 0.0523/2;
}




