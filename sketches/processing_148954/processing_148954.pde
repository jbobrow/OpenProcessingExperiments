

// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Hyungi 

float x; 
float y; 


void setup() { 
  size(600, 600); 
  background(0); 
  smooth(); 
 noLoop();
}

void draw () { 
  for (int y = 0; y <=height; y +=20) { 
    for (int x = 0;x <=width; x +=20) { 
      ellipse(x, y, 30, 30);
      stroke(0);  
      fill(random(100), random(150),150, 100); 
     
    }
  }
} 

