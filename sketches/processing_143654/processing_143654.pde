
 // Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Mirae
// ID: 201420064

 
 void setup() {
  size(600, 600);
  background(255);
  noLoop();
  smooth();
}

void draw() {
 stroke(0);
  for (int i = 10; i < width; i += 20) {
  for (int j = 10; j < height; j += 20) {
 
    rectMode(CENTER);
    fill(255);
    rect(0, i, j, 10);
    
    fill(255);
    rect(i, 0, 10, j);
    
    fill(0);
    rect(0, j, i, 10);
    
    fill(255);
    rect(j, 0, 10, i);
    
    fill(0);
    rect(i, j, 0, 10);
    
    fill(255);
    rect(j, i, 10, 0);
    
        
    fill(0);
    rect(i, j, 10, 0);
    
    fill(255);
    rect(j, i, 0, 10);
   
  }
}
}
