
PImage at;


void setup() {
  
  size(500,500);
  smooth();
  imageMode(CENTER);
  at=loadImage("at.png");
}
  
void draw(){
  background(255);
  

float angle = frameCount/10.0;
float factor = map(sin(angle), -1, 1, 1,1.1);
 
 translate(mouseX, mouseY);
 scale(factor);
  image(at,0,0); 
  
}







