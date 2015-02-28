
 
float q,w; 
float r = 15.0; 
float theta = 0; 
float t = 0.50; 
float inc = 0.01; 
 
void setup(){ 
  size(1000,500); 
  background(255); 
  smooth();  
  frameRate(200); 
 
} 
 
void draw(){ 
 
  float k = noise(t)*2; 
  float x = r*atan(theta); 
  float y = r*sin(theta); 
   colorMode(HSB); 
  fill(r%50,255,5,55); 
  noStroke(); 
  ellipse(x+width/2,y+height/2,tan(theta),sin(theta)); 
  theta += 0.85; 
  r+=inc*2; 
  t+=inc; 
} 
 

