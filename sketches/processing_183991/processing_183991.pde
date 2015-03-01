


void setup() {
size(500,500);
background(155,0,0);
}
 

void draw() 
{
  stroke(0,200,0);
  fill(0,0,155);
  ellipse(255, 255, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(500, 0, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(0, 0, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(0, 500, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(500, 500, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(500,255, mouseX, mouseY);
stroke(mouseX,mouseY,mouseX);
line(0, 255, mouseX, mouseY);
 
}

