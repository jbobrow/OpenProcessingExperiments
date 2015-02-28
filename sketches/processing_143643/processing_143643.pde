
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Shin Yeonsik
// ID: 

float angle; 


void setup(){  
size(600, 600); 
smooth(); 
} 

void draw(){ 
  for(int i = 0; i<600; i = i+20){ 
  for(int j = 0; j<600; j = j+20){
      rect(i, j, 80,80); 
      fill(0); 
      rect(i, j, 20, 20); 
      fill(255,255,255); 
      rect(i, j, 5, 10); 
      fill(0); 
  }
  
  }
}

