
float x, y, wd, ht;
 
void setup ()
{
size(600,600);
smooth ();
background(255,0,0);
x = width* .5;
  y = height* .5;
  wd = width* .30;
  ht = height* .30;
  frameRate (8);

}
void draw ()
{
fill(0,0,255,90);
stroke(255,0,50,70);
ellipse(100,100,50,50);

fill(255,255,255,50);
stroke(0,355,0,20);
ellipse(x,y,wd,ht);

fill(255,255,255,50);
stroke(255,0,0,50);
ellipse(x+.5, y+.5, wd*.80, ht*.80);

fill(255,255,255,50);
stroke(0,0,255,30);
ellipse(x+.5, y+.5, wd*.1, ht*.10);

}

void mousePressed()
{
  stroke (255, 246, random(200));
  strokeWeight(16);
  fill(255, 246, 80, 80);
  ellipse ( mouseX, mouseY, mouseY, mouseY);
}


void keyPressed()
{
 
  if ( key == CODED )
  {
    if ( keyCode == UP )
    {
      y = y - 8;
    }
    else if (keyCode == DOWN )
    {
      y = y + 8;
    }
    else if (keyCode == RIGHT )
    {
      x = x + 8;
    }
    else if (keyCode == LEFT)
    {
      x = x - 8;
    }
  }
}
void mouseReleased ()
{
  wd=random (5, 200);
  ht=wd;
}



