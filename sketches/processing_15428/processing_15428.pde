
float w=random(1,100);
void setup() {
  size(800,540);
  smooth();
  background(255);
}
void draw() {
  stroke(0);
  noFill();
  rectMode(CENTER);
  rect(width/2,height/2,w,mouseY);
  w=w+1;  
}
  
                                
