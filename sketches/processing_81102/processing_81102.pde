

void setup(){
  size(1280,720);
  stroke(255);
}
void draw(){
  background(67,12,100);
  if(mousePressed){
    background(100,12,67);
  }
  rect(mouseX,mouseY/2,mouseY,mouseX);
  fill(88,12,255);
  if(mousePressed){
    fill(255,255,255);
  }
  ellipse(mouseY-10,mouseX/2-10,mouseX-10,mouseY-10);
  fill(255,19,100);
  if(mousePressed){
    fill(0,0,0);
  }
}


