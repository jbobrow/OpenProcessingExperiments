
//Kristen CHon Copyright 2014 #4 HW

//mousePressed: When pressing mouse, a white ellipse appears behind the ellipse under void draw
//keyPressed: When key "s" is pressed, the background color changes 
//mouseWheel: When mouse is scrolled, the background color changes to navy (300).
float x, y, wd, ht;


void setup()
{
   size(400, 400);
   x=mouseX;
   y=mouseY;
   wd=100;
   ht=100;
}

void mouseWheel(MouseEvent event)
{
  background(300);
}

void mousePressed()
{
  noStroke();
  fill(255, 255, 255);
  ellipse (mouseX, mouseY, wd+x, ht+y);
  //fill(random(255), random(255), random(255));
  
}


void draw()
{
  noStroke();
  fill(7, 142, 116);
  ellipse(mouseX, mouseY, .2*wd, .2*ht);
}
void keyPressed()
{
  if (key=='s');
  fill(random(255), random(255), random(255));
  rect(x, y, 4*wd, 4*ht);
}




