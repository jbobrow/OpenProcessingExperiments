
int colour =225;

int transparency = 80;

int maxDistance = 400;

void setup() {

  size(600, 600, P3D);
}

void draw() {

  background(0);
  smooth();
  noFill();
  stroke(colour);
  strokeWeight(1);

  PVector mousePos, shapePos;
  for (int gridX=0; gridX<width; gridX=gridX+25) {
    for (int gridY=0; gridY<height; gridY=gridY+25) { 
      mousePos = new PVector (mouseX, mouseY);
      shapePos = new PVector (gridX, gridY);

      float diameter = dist(mousePos.x, mousePos.y, shapePos.x, shapePos.y);
      diameter = diameter*40/maxDistance;

      pushMatrix();
      translate(gridX, gridY, diameter*5);
      ellipse( 0, 0, diameter, diameter);
      popMatrix();
    }
  }
}


