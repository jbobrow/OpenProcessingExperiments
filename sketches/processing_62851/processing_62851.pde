
void setup() {
  size(700, 700);
 noCursor();
 background(#191970);
}

void draw (){
  float yone=random(205, 255);
  float ytwo=random(220, 255);
if(mousePressed==true)
{
  strokeWeight(3);
  stroke(255, ytwo, yone);
  line(mouseX+7, mouseY, mouseX-7, mouseY);
  line(mouseX+5, mouseY+5, mouseX-5, mouseY-5);
  line(mouseX-5, mouseY+5, mouseX+5, mouseY-5);
}
else
{
  strokeWeight(2);
  stroke(#63B8FF);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
}

