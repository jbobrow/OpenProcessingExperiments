

void setup(){
  size(400,400);
  smooth();
  background(0);
}


void draw(){
  
  noFill();
  frameRate(24);
  
  stroke(random(255),random(255),random(255));
   beginShape();
  vertex(random(0,400), 200);
  vertex(200, random(0,400));
  vertex(random(0,400), 200); 
  vertex(200, random(0,400));
  endShape(CLOSE);
 } 
  
 
  





