

color c = 0;
int t = 80;
int maxDistance = 150;

void setup(){
  size(600, 600, P3D);
}

void draw() {
  
  background(255);
  smooth();
  noFill();
  stroke(c);
  strokeWeight(3);
  
  for (int gridX = 0; gridX <= height; gridX = gridX + 25){
    for (int gridY = 0; gridY <= width; gridY = gridY + 25){
      
    
   PVector mousePos, shapePos;
    
   mousePos = new PVector(mouseX, mouseY);
    
    shapePos = new PVector(gridX, gridY);
    
    float diameter = PVector.dist(mousePos,shapePos);
    
    diameter = diameter / maxDistance * 40;
    
    pushMatrix();
    
    translate(gridX, gridY, diameter * 5);
    rect(0, 0, diameter, diameter);
    
    popMatrix();

   
    }

    }
}




