

color shapecolor = color(250,250,165,120);
int transparency = int(80);
int maxDistance = int(150);



float colorchange = float (mouseX);


void setup() { 
  size(1000,500,P3D); 
  
  colorMode(HSB);
  
}

void draw() { 
  background(0);
  smooth();
  noFill(); 
  stroke(colorchange+mouseY,255,255); 
  strokeWeight(3);
  for (int gridY = 0; gridY < 500; gridY = gridY + 25){ 
    for (int gridX = 0; gridX < 1000; gridX = gridX + 25){
      float diameter;
      PVector mousePos = new PVector (mouseX,mouseY);
      PVector shapePos = new PVector (gridX, gridY );  
      diameter = mousePos.dist(shapePos); 
      diameter = diameter/maxDistance*10; 
      pushMatrix(); 
      translate(gridX,gridY,diameter*5); 
      ellipse (0,0,diameter,diameter);
      popMatrix();    
    }
  }
}

void mousePressed(){
colorchange+=50;
colorchange%=150;

}

