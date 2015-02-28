
float x = random(200, 300) ; 
float y = random(200, 300); 

void setup(){
  background(255); 
  size(600, 600); 
  smooth(); 
}

void draw(){
  fill(0); 
  ellipse(x, y, 1, 1); 
  x= x + random(5)-random(5); 
  y= y + random(5)-random(5); 
}

void mouseClicked(){
   background(255); 
   x= random(200); 
   y = random(200); 
}

