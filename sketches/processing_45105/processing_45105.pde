
float x = random(200, 300) ; 
float y = random(200, 300); 


void setup(){
  background(255); 
  size(600, 600); 
  smooth(); 
  frameRate(100); 
}

void draw(){
  fill(0); 
  ellipse(x, y, 1, 1); 
  x= x + noise(100)-noise(100)+random(2)-random(2); 
  y= y + noise(100)-noise(100)+random(2)-random(2); 
}

void mouseClicked(){
   background(255); 
   x= mouseX; 
   y = mouseY; 
}

