
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: SHIN Yeonsik
// ID: dnmys11


void setup() { 
  size(600, 600); 
  smooth(); 
  background(0); 
} 

void draw() { 
for (int i = 5; i < 650; i = i +100) { 
for (int j = 5; j < 650; j = j +100) { 
      strokeWeight(10); 
      stroke(0, 0, 0); 
      noFill(); 
      
      strokeWeight(4); 
      stroke(255); 
      fill(#FFF700); 
      rect(i, j, 90, 90); 
      
      noFill(); 
      fill(#FF0303); 
      strokeWeight(4); 
      rect(i,j,10,10); 
      } 
  } 
} 

