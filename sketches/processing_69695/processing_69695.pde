
//homework 4
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin September 2012 Pittsburgh PA 15213 All Rights Reserved

//functions
float dia, dia2, r, g, x;
color c1, c2;

void setup()
{
    size(700, 400);
    smooth( );
    r = random(10, 255);
    g = random(255);
    background(r);
    fill(13, 86, 106, 30);
    c1 = color(random(255), 5);
    c2 = color(random(255), random(255), 106, 25);
    dia = 50;
    dia2 = 100;
    x = 10;

}

void draw( )
{
   //drawn background
   fill(c1);
   rect(0, 0, width, height);
   stroke(255, 255, 255, 70);
   
   translate(mouseX, mouseY);
   
   //invisible ellipse
   stroke(c1);
   fill(c1);
   ellipse(0, 0, dia, dia);
   
   //revolving ellipse
   fill(c2);
   stroke(255, 255, 255, 70);
   rotate(radians(10*frameCount));
   ellipse(dia/2 + dia2/2, 0, dia2, dia2);
}

void keyPressed( )
{
  if ( key == ' ')  // [space bar] key
  {
    c1 = color(random(255), 5); 
    background(random(0, 255));
  }
  if ( key == 'a')  // lower case [a] key
  {
    dia = dia + x;
  }
  if (key == 's') // lower case [s] key
  {
    dia = dia - x;
  }
}

void mousePressed()
{
     c2 = color(random(255), random(255), 106, 25);
     fill(c2);
}


