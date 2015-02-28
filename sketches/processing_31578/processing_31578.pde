
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
  for (int i = 0; i < 600; i = i + 25){
    for (int j = 0; j < 600; j = j + 25){
      float diameter;

      PVector mousePos = new PVector (mouseX,mouseY);
      PVector shapePos = new PVector (i, j );
      diameter = mousePos.dist(shapePos);
      ellipse (i,j,diameter,diameter);
      
    
    
    
    
    }
  
  }
  










}

