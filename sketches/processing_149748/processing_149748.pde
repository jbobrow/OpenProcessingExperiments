
background (90);
size (600,600);
rectMode (CENTER);

float angolo=0;
for (int y=0; y<=height; y+=20)
{
for (int x=0; x<=width; x+=20)
{
  angolo=0.6;
  resetMatrix();
  translate (x,y);
  rotate (angolo);

fill (150);
ellipse (0,0,20,10);
fill (230);
rect (10,10,10,10);
  }
}


