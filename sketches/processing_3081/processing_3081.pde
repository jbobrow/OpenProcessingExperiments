

float rot = 60; 
float rad = screen.height; 
float speed = 0.01; 
float circleSize = 9; 
float seed = 20; 
float seed2 = 40; 
 
 
void setup(){ 
  size(500,500); 
  background(156,234,54); 
  smooth(); 
}; 
 
 
 
 
void draw(){ 
   
  rad = noise(seed)*400; 
  seed = seed + 0; 
   
  circleSize = noise(seed2)*random(seed); 
  seed2 = seed2 + 20; 
   
  translate(350,130); 
  rotate(rot); 
  stroke(55,250,255,25); 
  line(0,0,rad,0); 
  fill(54,234,200); 
  rect(rad,0,circleSize,circleSize); 
   
  rot = rot+200; 
  rad = random(25,98); 
   
   rad = noise(seed)*400; 
  seed = seed + 0.03; 
   
  circleSize = noise(seed2)*8; 
  seed2 = seed2 + 0.03; 
   
  translate(90,150); 
  rotate(rot); 
  stroke(234,234,54); 
  line(0,0,rad,0); 
  fill(54,95,234); 
  ellipse(rad,0,circleSize,circleSize); 
   
  rot = rot+speed; 
  rad = random(0,54); 
   
   
}; 
 
 
void keyPressed(){ 
  save("circle" + key +".png"); 
}; 

