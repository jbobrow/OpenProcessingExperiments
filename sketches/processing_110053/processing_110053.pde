
//abby frankola
//afrankol
//copyright 2013

float x, y, w, h;

void setup( )
{
  size (400, 400);
  fill (65, 47, 130); 
  noStroke();
  x= width * .5;
  y= height * .5;
  w= width * .15;
  h= height * .15;
  background (235, 232, 233);
  frameRate(24);
}

void draw( )
{
  background(235,232, 233);
 
  if (mousePressed == true)
   {
   frameRate(10);
   fill(235, 232, 233);
   }
   //(mouseReleased == true)
    {
    ellipse(pmouseX, pmouseY, w, h);
    frameRate(27);
  x= x + 1 ; 
   }
}

void keyPressed()
{
 if (key == CODED )
 {
   if (keyCode == UP)
   {
   ellipse(x, y, w, h );
   }
   if (keyCode == DOWN)
   {
   
    ellipse(x, y, w, h );
   }
 }
}

void mouseReleased()
{
 w=random (5,200);
 h= w;
}


void mouseMoved()
{
  fill(random(255), random(255),random(255));
}  


void mousePressed()
{
  fill(random(255), random(255), random(255));
  
}




