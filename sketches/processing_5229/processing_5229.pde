
float x, y; 
float size = 1.0; 
 
void setup()  
{ 
  size(300,300); 
  noStroke(); 
  frameRate(2.5); 
} 
 
void draw()  
{ 
  background(0); 
  strokeWeight(120); 
  for(int i = 0; i < width; i++) { 
  float r = random(255); 
  float x = random(0, width); 
  stroke(r, 100); 
  line(i, 0, x, height); 
} 
 
 
} 


