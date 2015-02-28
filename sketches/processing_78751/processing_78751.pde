
void setup() {
  size(400,400);
  smooth();
  noStroke();
}

void draw() {
  background(20,25,80);
  
  fill(0);
  ellipse(200,200,400,400);
  
  fill(70,130,180);
  arc(200,200,360,360,radians(270),radians(270 + hour()*6));
  
  fill(95,158,160);
  arc(200,200,260,260,radians(270),radians(270 + minute()*6));
  
  fill(224,255,255);
  arc(200,200,200,200,radians(270),radians(270 + second()*6));
  
  fill(0);
  ellipse(200,200,160,160);
  
  
  


}

