
// hw4
// Copyright Melissa Mak, September 2013, Pittsburgh, PA

float x, y, wd, ht;
color col;

void setup()
{
  size(400, 400);
  x = 0;
  y = 0;
  wd = width;
  ht = height;
  background(col);
  col = color(random(255), random(255), random(255), 50);
  stroke(255);
  strokeWeight(3);
  
}

void draw()
{
  frameRate(5);
  line(10 + mouseX, 50 + mouseY, random(mouseX-mouseY), random(mouseY-mouseX));

}

void mouseMoved()
{
  fill(10, 10, 10, 100);

}

void mousePressed() 
{
  stroke(col);
  col = color(random(255), random(255), random(255));
}

void mouseDragged()
{
  frameRate(10);
  ellipse(200, 200, mouseX - mouseY, mouseY - mouseX);
}

void keyPressed()
{
   if ( keyCode == ' ' )
    {
      background(0);
    }
    else if ( keyCode == '1' )
    {
      strokeWeight(4);
    }
    else if ( keyCode == '2' )
    {
      strokeWeight(5);
    }
    else if ( keyCode == '3' )
    {
      strokeWeight(6);
    }
}








