
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Young Ji
// ID: 201420069

void setup(){ 
  size(600,600); 
  noLoop();  
  background(0); 
} 
void draw(){ 
  stroke(255); 
  for (int i = 10; i < width-9; i = i + 10) { 
      for (int j = 10; j < height; j = j + 10){  
        strokeWeight(random(1)); 
        line(i,j,300,300); 
      } 
  }
} 

