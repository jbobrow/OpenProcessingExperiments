
void draw()
{
  size(500,500);
  
  background(0,0,0);
  stroke(250,250,250);
line(mouseX-50,mouseY-50, mouseX+50,mouseY+50);
line(mouseX+50,mouseY-50, mouseX-50,mouseY+50);
fill(mouseX,0,0);
ellipse(mouseX,mouseY,30,30);
ellipse(mouseX-50,mouseY-50,30,30);
ellipse(mouseX+50,mouseY-50,30,30);


  /* fill(mouseX,mouseX*0.5,mouseY);
  ellipse(mouseX,mouseY,mouseX*0.6,mouseY*0.42);
  fill(mouseY,mouseX*0.2,mouseX);
  rect(mouseX-10,9+mouseX,mouseY*0.5,mouseX*0.7);
  line(0,0,mouseX,mouseY);
  line(500,500,mouseX,mouseY);
line(500,0,mouseX,mouseY);
line(0,500,mouseX,mouseY);
line(250,0,mouseX,mouseY);
 line(0,250,mouseX,mouseY);
line(500,250,mouseX,mouseY);
 line(250,500,mouseX,mouseY);
 */
 
 
}


