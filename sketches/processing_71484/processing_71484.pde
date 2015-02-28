
// Hayley Goldstein CP1 mods 14/15 User input

/**
 drag with left mouse to draw bezier<br>
 drag with right mouse to draw purple circles<br>
 press f to add lines<br>
 press d to change color to green<br>
 press s to change color to red<br>
 **/

void setup()
{
  size(600, 600);
  background(122,122,122);
}

void draw()
{
  if (mouseButton==RIGHT)
  {
    strokeWeight(1);
    stroke(0);
    fill(139, 0, 139);
    ellipse(mouseX, mouseY, 30, 30);
  }  
  if (mousePressed==true && mouseButton==RIGHT && key=='f')
  {
    line(250,250,mouseX,mouseY);
  }
  if (mousePressed==true && mouseButton==RIGHT && key=='d')
  {  
    fill(0, 238, 118);
    ellipse(mouseX, mouseY, 30, 30);
  }
  if(mousePressed==true && mouseButton==RIGHT && key=='s')
  {
    fill(220, 20, 60);
    ellipse(mouseX, mouseY, 30, 30);
  }  
  if (mouseButton==LEFT)
  {

    fill(0, 191, 255);
    strokeWeight(2);
    stroke(0, 0, 255);
    bezier(0, 200, mouseX, mouseY, pmouseX, pmouseY, 200, 200);
    bezier(200, 200, 400-mouseX, mouseY, 400-pmouseX, pmouseY, 400, 200);
    bezier(400, 200, 600-mouseX, mouseY, 600-pmouseX, pmouseY, 600, 200);
  }
}
