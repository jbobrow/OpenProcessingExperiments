

float x, y, wd, ht;
 
void setup ()
{
  size (800, 500);
  smooth ();
  background (225,246,249);
  x = width* .5;
  y = height* .5;
  wd = width* .30;
  ht = height* .30;
  frameRate (8);
}

void draw ()
{
noStroke();
fill(234, 247, 249);
ellipseMode (RADIUS);
ellipse(width/2, height/2, 210, 210);
noStroke();
fill(166, 217, 237);
ellipseMode(CENTER);
ellipse(width/2, height/2, 250, 250);
noStroke();
fill(171, 219,239);
ellipseMode(CENTER);
ellipse(width/2, height/2, 230, 230);
noStroke();
fill(194, 226, 239);
ellipseMode(CENTER);
ellipse(width/2, height/2, 210, 210);
noStroke();
fill(255, 255, 255);
ellipse(width/2, height/2, 100, 80);
noStroke();
fill(199, 220, 242);
ellipse(width/2, height/2, 100, 83);
noStroke();
fill(196, 217, 246);
ellipse(width/2, height/2, 35, 35);
noStroke();
noSmooth();
point(260, 650);

}

void mousePressed()
{
  stroke (222, 199, 239);
  strokeWeight(16);
  noFill();
  ellipse (width/2, height/2, 35, 35); 
  stroke (118, 119, 118);
  strokeWeight(5);
  noFill();
  ellipse (x+.2, y+.2, wd*.2, ht*.2);
stroke (168, 168, 168);
  strokeWeight(8);
  noFill();
  ellipse (x+.1, y+.1, wd*.1, ht*.1);

}
void keyPressed()
{
 
  if ( key == CODED )
  {
    if ( keyCode == DOWN )
    {
      y = y - 5;
    }
    else if (keyCode == CENTER )
    {
      y = y + 5;
    }
    else if (keyCode == UP )
    {
      x = x + 5;
    }
    else if (keyCode == LEFT)
    {x = x - 5;}
  }
}
void mouseReleased ()
{
  wd=random (100, 200);
  ht=wd;
}











