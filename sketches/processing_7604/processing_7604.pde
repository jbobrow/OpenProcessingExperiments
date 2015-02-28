
 
float q,w; 
float r = 5.0; 
float theta = 0.0; 
float t = 0.0; 
float inc = 0.02; 
 
void setup(){ 
  size(1000,500); 
  background(225); 
  smooth();  
  frameRate(120); 
 
} 
 
void draw(){ 
 
  float k = noise(t)*2; 
  float x = r*cos(theta); 
  float y = r*sin(theta); 
  //  println("x: " +x+ " y: " +y); 
  colorMode(HSB); 
  fill(r%50,255,50,5); 
  noStroke(); 
  ellipse(x+width/2,y+height/2,tan(theta),tan(theta)); 
  theta += 0.01; 
  r+=inc*2; 
  t+=inc; 
} 
 

