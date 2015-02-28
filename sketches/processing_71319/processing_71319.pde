
void setup()
{
  smooth();
  size (400,400);
  frameRate(10);
 
 
}
 
void draw ()
 
{
  println (mouseX);
  background(255);
  rectMode (CENTER);
  stroke(140,43,43);
  line (mouseX,mouseY+50, pmouseX+80, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX+20, pmouseY +200);
  line (mouseX,mouseY+50, pmouseX-80, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX-20, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX+40, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX-40, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX+60, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX-60, pmouseY+200);
  
  fill(255);
  ellipseMode (CENTER);
  fill(0);
  strokeWeight(2);
  
  fill(mouseX,100, mouseY);
  ellipse (mouseX,mouseY,120,120);
  fill(100, mouseY);
 ellipse(mouseX+10,mouseY+30, 20,20);
  fill(100, mouseY);
 ellipse(mouseX+10,mouseY+30, 10,10);

 line (mouseX-30,mouseY-20, mouseX-10, mouseY-10);
 line (mouseX+30,mouseY-20, mouseX+10, mouseY-10);
 
}
 
void keyPressed()
{
   
 background(255);
}


