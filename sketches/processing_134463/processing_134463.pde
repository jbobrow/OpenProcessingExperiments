
void setup(){
  size(400,400);
}

void draw(){
  background(0);
  float r=random(255);
  float m=random(255);
  if(mouseButton == LEFT){
    strokeWeight(4);
    stroke(mouseX,mouseY,mouseX-mouseY);
line(mouseX,mouseY,pmouseX,pmouseY);
if(mouseButton == RIGHT){
  strokeWeight(8);
  stroke(mouseY,mouseX,mouseX-mouseY);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }}
  else{
    fill(0);
  }
  ellipse(mouseX,mouseY,50,50);
}

