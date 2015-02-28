
void setup(){
  background(30);
  size(400,400);
  smooth();
}
 
void draw(){
  frameRate(100);
  float r=random(40,150);
  stroke(255,30);
  line(400,400,mouseX,mouseY);
  noStroke();
  if(mousePressed == true) {
  triangle (0,0,mouseX,mouseY,mouseX/5,0);
  fill(210,r,30,50);
    }
  
}
