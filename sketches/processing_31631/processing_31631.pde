
color c1 = color(255);
int transparency= 80;
int maxDistance=500;
PVector mousePos,shapePos;

void setup() {
  size(600, 600,P3D); 
}

void draw() 
{
  background(0);
  smooth();
  noFill();
  stroke(c1,transparency);
  strokeWeight(2);
  for(int i = 0; i <= width; i += 25) {
    for(int j = 0; j <= height; j += 25) {
      mousePos= new PVector (mouseX, mouseY);
      shapePos= new PVector (i, j);
      float diameter = dist(mousePos.x,mousePos.y,shapePos.x,shapePos.y);
      diameter = (diameter/maxDistance)*100;
      pushMatrix();
      translate(i, j, diameter*5 );
      ellipse(0, 0, diameter,diameter);
      popMatrix();
    }
  }
}

