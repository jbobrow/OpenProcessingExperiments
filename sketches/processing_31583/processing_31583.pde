
int colour = 255;

int transparency = 80;

int maxDistance = 150;

void setup(){
  size(600,600,P3D);
}

void draw(){
  
  background (0);
  smooth();
  noFill();
  
  stroke(colour);
  strokeWeight (1);
  
   PVector shapePos; 
 PVector mousePos;
  
  for (int gridX = 0; gridX < width; gridX = gridX + 25){
    for (int gridY = 0; gridY < height; gridY = gridY + 25){
    

 
 shapePos= new PVector (gridX, gridY);
 mousePos= new PVector (mouseX, mouseY);
 
float distance = PVector.dist(mousePos, shapePos);
  float diameter = 40*distance/ maxDistance;
  
  pushMatrix();
  translate (gridX, gridY, diameter*5);
  ellipse (0,0, diameter, diameter);
  popMatrix();
  
}
}

}
  
  

