
//homework #5 1.31.12
//copyright Victoria Adams

color c;
color e;
float d;
void setup ()
{
  size (400, 400);
  background (0);
  smooth ();
  d = 200;
}

void draw ()
{
  
}

void drawInitials (float x, float y, float d)
{
  stroke (e);
  strokeWeight (.01*d);
  fill (c);
  ellipse (x, y, d, d);
   
  //letter A
    
  stroke (e);
  strokeWeight (.03*d);
  line (x - .05*d, y + .5*d, x + .15*d, y);
    
  stroke (e);
  strokeWeight (.05*d);
  beginShape ();
  curveVertex (x + .3*d, y);
  curveVertex (x + .15*d, y);
  curveVertex (x + .25*d, y + .15*d);
  curveVertex (x + .45*d, y + .25*d);
  curveVertex (x + .4*d, y + .3*d);
  endShape();
    
  stroke (e);
  strokeWeight (.03*d);
  line (x + .04*d, y + .30*d, x + .25*d, y + .15*d);
   
  //letter V
    
  stroke (e);
  strokeWeight (.03*d);
  line (x - .35*d, y - .35*d, x - .1*d, y);
    
  stroke (e);
  strokeWeight (.05*d);
  noFill();
  beginShape ();
  curveVertex (x + .1*d, y + .15*d);
  curveVertex (x - .1*d, y);
  curveVertex (x, y - .25*d);
  curveVertex (x + .2*d, y - .44*d);
  curveVertex (x + .35*d, y - .5*d);
  endShape();
}

void mousePressed ()
{
  drawInitials (mouseX, mouseY, d);
  c = color (random(255), random(255), random(25));
  e = color (255, 237, 134);
}

void keyPressed ()
{
  if (keyCode == UP)
  {
    d = d+10;
  }
  if (keyCode == DOWN)
  {
    d = d-10;
  }
}
                
                
