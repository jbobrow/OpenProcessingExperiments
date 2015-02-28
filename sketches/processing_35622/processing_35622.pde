
void setup(){
  size(300,300);
  colorMode(HSB, width);
}

int x = 0;
int y = 30;

void draw(){
  background(0);
  stroke(300);
  line(0,0,mouseX+y,mouseX+y);
  line(0,300,mouseY+y,mouseY+y);
  line(300,0, mouseX+y, mouseY+y);
  line(300,300, mouseY+y,mouseX+y);
  noStroke();
  fill(x,mouseX,mouseX);
  ellipse(mouseX, mouseY, mouseX,mouseX);
  ellipse(mouseY, mouseX, mouseY,mouseY);
  x++;
}  

void mouseDragged(){
 fill(0);
 ellipse(mouseX,mouseY,mouseX-10,mouseX-10);
 fill(mouseY,mouseY,mouseY);
 ellipse (mouseY,mouseX, mouseY-10, mouseY-10);
 
}



