
void setup(){
  size(400,900);
  smooth();
  background(0);
}


void draw(){
  
  noFill();
  frameRate(24);
  
  stroke(random(25),random(255),random(255));
   beginShape();
  vertex(random(0,800), 400);
  vertex(50, random(0,300));
  vertex(random(0,500), 100); 
  vertex(400, random(0,899));
  endShape(CLOSE);
 } 
  
 
  





