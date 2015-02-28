
void setup(){
size(500, 500);
smooth();
}

void draw(){
  background(250, 0, 0);
fill(250, 250, 250);
ellipse(mouseX, mouseY, 250, 250);
ellipse(mouseX-125, mouseY-125, 100, 100);
ellipse(mouseX+125, mouseY-125, 100, 100);
ellipse(mouseX+125, mouseY+125, 100, 100);
ellipse(mouseX-125, mouseY+125, 100, 100);
fill(0);
triangle(mouseX-10, mouseY-5, mouseX+10, mouseY-5, mouseX, mouseY-20);
ellipse(mouseX-50, mouseY-50, 25, 25);
ellipse(mouseX, mouseY-75, 25, 25);
ellipse(mouseX+50, mouseY-50, 25, 25);
ellipse(mouseX, mouseY+50, 40, 80);
}

                
                                
