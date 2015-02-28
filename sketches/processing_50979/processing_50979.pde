
//homework #6 2.2.2012
//copyright Victoria Adams
 
color c;
color e;
float ix, iy, id, ixSpeed, iySpeed, tx, ty, td, txSpeed, tySpeed;

void setup ()
{
  size (400, 400);
  background (0);
  smooth ();
  
  c = color (random(255), random(255), random(25));
  e = color (255, 237, 134);
  ix = 0;
  iy = 0;
  id = 100;
  ixSpeed = 2;
  iySpeed = 2;
  tx = 0;
  ty = 0;
  td = 100;
  txSpeed = 2;
  tySpeed = 2;
}
 
void draw ()
{
   drawInitials (ix, iy, id);
   moveInitials ();
   prepWindow ();
   drawInitials (tx, ty, td);
   bounceInitials ();
}

void bounceInitials ()
{
  tx = tx + txSpeed;
  if (tx > width)
  {
    txSpeed = -txSpeed;
  }
  
  if (tx <0)
  {
    txSpeed = txSpeed+5;
  }

  ty = ty +tySpeed;
  if (ty > height)
  {
    tySpeed = -tySpeed;
  }
  
  if (ty <0);
  {
    tySpeed = tySpeed+5;
  }
}

void prepWindow ()
{
  fill (200, 200, 0, 10);
  rect (0, 0, width, height);
}

void moveInitials ()
{
  ix = ix + ixSpeed;
  if (ix > width + id/2)
  {
    ix = 0;
  }

  iy = iy +iySpeed;
  if (iy > height + id/2)
  {
    iy = 0;
  }

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
                
                
