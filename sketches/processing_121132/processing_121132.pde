
float counter = 0; 
void setup() 

{ 
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
} 


void draw() 


{ 
  float h = map(sin(counter), -1, 1, 0, 25); 
   background (h, 100, 60);
   counter += 0.01;
  
  translate(width/2, height/2); 
  pushMatrix(); 
  translate(-50, sin(counter)*100);
  fill(1,1,0);
  triangle(30, 75, 58, 20, 86, 75);
  popMatrix(); 
  counter += 0.3;
} 

