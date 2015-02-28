
/*
James Liu
Press q-increase the width
      w-increase the height
      e-decrease width
      r-decrease height
Left click-rectangle
Right click-clear
*/
    
int H;
int W;
void setup()
{
  background(255);
  size (500, 500);
  smooth();
  H=20;
  W=20;
}

void draw()
{
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, H, W);
}

void mousePressed()
{
   if (mousePressed && (mouseButton == LEFT))
  {
    fill(random(255), random(255), random(255));
    rect(mouseX-18, mouseY-20, 40, 40);
  }  

   if (mousePressed && (mouseButton == RIGHT))
  {
    background(255);	
  }
}

void keyPressed()
{
if(key=='q' || key == 'q')
{
  H=H+10;
}
if (key=='w' || key == 'w')
{
 W=W+10; 
}
if(key=='e' || key == 'e')
{
  H=H-10;
}
if (key=='r' || key == 'r')
{
 W=W-10; 
}
}

