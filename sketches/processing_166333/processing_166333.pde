
void draw()
{
  size(500,500);
  
  background(0,0,0);
  stroke(250,250,250);
line(mouseX-50,mouseY-50, mouseX+50,mouseY+50);
line(mouseX+50,mouseY-50, mouseX-50,mouseY+50);
fill(mouseX,0,0);
ellipse(mouseX,mouseY,20+mouseX*0.3,20+mouseY*0.3);
ellipse(mouseX-50,mouseY-50,30-mouseX*0.1,30-mouseY*0.1);
ellipse(mouseX+50,mouseY-50,30-mouseY*0.05,30-mouseX*0.05);

 
}


