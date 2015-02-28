
void setup(){
  size(200,200);
}

void draw(){
  background(255,255,255);
  fill(255,230,0);
  ellipse(mouseX,mouseY,width/1.666,height/1.666);
  fill(0);
  ellipse(mouseX+20,mouseY-20,width/20,height/20);
  ellipse(mouseX-20,mouseY-20,width/20,height/20);
  ellipse(mouseX,mouseY+20,width/10,height/10);
}

