
void setup(){
  size(200,200);
}

void draw(){
  background(255,255,255);
  fill(247,202,224);
  ellipse(mouseX,mouseY,width/1.666,height/1.666);
  fill(255,255,255);
  ellipse(mouseX+23,mouseY-21,width/5.5,height/5.5);
  fill(0);
  ellipse(mouseX+15,mouseY-25,width/20,height/20);
  fill(255,255,255);
  ellipse(mouseX-23,mouseY-20,width/5,height/5);
  fill(0);
  ellipse(mouseX-15,mouseY-25,width/20,height/20);
  fill(173,110,140);
  ellipse(mouseX,mouseY+20,width/4,height/8);
  fill(0);
  ellipse(mouseX-10,mouseY+20,width/15,height/18);
  fill(0);
  ellipse(mouseX+10,mouseY+20,width/15,height/18);
  noCursor();
}

