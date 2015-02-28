
void setup() 
{ 
  size(500,500); 
  frameRate(2); 
  background(255,106,126); 
} 
void draw(){  
  ellipse(250,250,100,100);
  ellipse(random(500),random(500),55,55); 
  
} 
void mousePressed(){ 
  fill(random(252),random(56),random(82));
}




