
/*
Radadada It's Justin's World. Move the mouse to make art. Press
space to start a new canvas. Your art will not be saved. Now grade
me and go away. Just Kidding. Stay.
*/


void setup()
{
  size (640,480);
  smooth();
}

void draw()
{
  fill(random(255),random(255),random(255));
  line(pmouseY,pmouseY,mouseX,mouseY);
  line(pmouseY+50,pmouseY+50,mouseX+50,mouseY+50);
  line(pmouseY,pmouseX,mouseY,mouseX);
  line(pmouseY+50,pmouseX+50,mouseY+50,mouseX+50);
  rect(mouseX,mouseY,50, 50);
  rect(mouseY,mouseX,50, 50);
  
  line(pmouseY,pmouseY,mouseY,mouseX);
  line(pmouseY+50,pmouseY+50,mouseY+50,mouseX+50);
  rect(mouseX,mouseX,50, 50);
  rect(mouseY,mouseX,50, 50);
  
  if(keyPressed)
  {
   if (key == ' ') 
   {
     background (255);
   }
  }
}

