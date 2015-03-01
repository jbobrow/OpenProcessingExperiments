
int pos = 15;

void setup() {
size(600,600);
}
void draw() {
  background(255,mouseY+1,mouseX+2);
  line(mouseX-40,mouseY-40,mouseX+40,mouseY+40);
  line(mouseX-40,mouseY+40,mouseX+40,mouseY-40);
  fill(mouseX+2,mouseY+1,4);
  ellipse(mouseX,mouseY,mouseX*0.2,mouseY*0.2);
  fill(mouseX+5,mouseY+6,4);
  ellipse(mouseX+40,mouseY+40,mouseX*0.1,15);
  ellipse(mouseX-40,mouseY-40,15,mouseY*0.1);
  fill(mouseX*5,70,mouseY+1);
  ellipse(mouseX+40,mouseY-40,15,15);
  ellipse(mouseX-40,mouseY+40,15,15);
  
  pos = pos+1;
  rect(pos,pos,25,25);
}


