
void setup()
{
  smooth();
  size (400,400); 
  frameRate(10);


}

void draw ()

{
  println (mouseX);
  background(150);
  rectMode (CENTER);
  fill(255);
  rect (mouseX,mouseY, 100,100);
  ellipseMode (CENTER);
  fill(0);
  ellipse (mouseX,mouseY,80,80); 
  fill(mouseX,100, mouseY);
  ellipse (mouseX,mouseY,70,70); 

  line (mouseX,mouseY+50, pmouseX+100, pmouseY+200);
  line (mouseX,mouseY+50, pmouseX, pmouseY +200);
  line (mouseX,mouseY+50, pmouseX-100, pmouseY+200);


}

void keyPressed()
{
  
 background(255); 
}

