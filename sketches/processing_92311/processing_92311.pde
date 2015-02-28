
float ConstmouseY;
void setup() {
  size(400, 400);
smooth(40);
strokeWeight (10);
}

void draw() {
  background(128);
  stroke(0);
  fill(250,224,212);
  ellipse (200,200,300,300);
  stroke(0);
  line(200,250,200,200);//nose
  fill(0,0,0);
  stroke(255);
  ellipse (130,170,50,mouseX/5);//Left Eye
  ellipse (270,170,50,mouseY/5);//Right Éye
  fill(255,0,0);//redmouse
  stroke(0);
  rect(100,250,200,mouseX/5);
  
}
