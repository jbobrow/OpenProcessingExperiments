
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: EOM hyebin
// ID: EOM HYE BIN


void setup() { 
  size (600, 600); 
  background(255); 
  smooth(); 
} 

void draw() { 


  fill(255, 255, 255, 0); 
  for (int a=2; a<width; a=a+50) { 
    for (int b=2; b<height; b=b+50) { 
      fill(100, 100, 100, 1); 
      strokeWeight(5); 
      stroke(255); 
      rect(a, b, 30, 30); 
      rect(a+15, b, 30, 30); 
      rect(a, b+15, 30, 30); 
      rect(a+15, b+15, 30, 30); 
    } 
  } 
}
