


float P; 
float xoff; 


void setup() { 
  size(600, 600, P3D); 
} 


void draw() { 
  background(255); 
  lights(); 
  for (int i = 20; i < width; i+=50) { 
  for (int j = 20; j < width; j+=50) { 
    pushMatrix(); 
    translate(i, j, -300); 
    rotateX(radians(mouseX)); 
    stroke(255); 
    fill(0,30); 
    rotateY(radians(mouseY)); 
    box(200); 
    popMatrix(); 
  } 
  } 
} 
 

