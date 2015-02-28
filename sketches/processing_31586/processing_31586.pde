
color boxFill;
int transparency = int(80);
int maxDistance = int(150);
float movementX = 1000;
float movementY = 500;
float colorchange = float (mouseX);

void setup() { 
  size(1000,500,P3D); 
  colorMode(HSB); 
}

void draw() { 
  background(255);
  movementX = movementX - 8;
  if (movementX < 0){
  movementX = width;
  }
  movementY = movementY - 4;
  if (movementY < 0){
  movementY = height;
  
  }
  smooth();
  noStroke(); 
  for (int gridY = 0; gridY < 500; gridY = gridY + 25){ 
    for (int gridX = 0; gridX < 1000; gridX = gridX + 25){
      float diameter;
      PVector mousePos = new PVector (movementX,movementY);
      PVector shapePos = new PVector (gridX, gridY );  
      diameter = mousePos.dist(shapePos); 
      diameter = diameter/maxDistance*10; 
      pushMatrix(); 
      translate(gridX,gridY,diameter*5);
      rotateY(frameCount * 0.5);
      rotateX(frameCount * 0.5);
      boxFill = color(gridY, gridX/1.5, 255, 50);
      fill(boxFill);
      box (diameter*2);
      popMatrix();    
    }
  }
}

