
color shapecolor = color(255);
int transparency = int(80);
int maxDistance = int(150);

void setup() {
  size(600,600,P3D);
}

void draw() {
  background(0);
  smooth();
  noFill();
  stroke(shapecolor);
  strokeWeight(1);
  for (int gridY = 0; gridY < 600; gridY = gridY + 25){
    for (int gridX = 0; gridX < 600; gridX = gridX + 25){
      float diameter;

      PVector mousePos = new PVector (mouseX,mouseY);
      PVector shapePos = new PVector (gridX, gridY );
      diameter = mousePos.dist(shapePos);
      diameter = diameter/maxDistance*40;
      ellipse (gridX,gridY,diameter,diameter);
      
    
    
    
    
    }
  
  }
  










}

