
size (500, 450);
background ( 0, 100, 150 );
rectMode(CENTER);
 
float  angolo=0;
 
for (int y=0; y<=height; y+=25)
{
  for (int x=0; x<=width; x+=25)
  {
    angolo -=0.25;
    resetMatrix();
    translate(x, y);
    rotate(angolo);
     
    fill( random(100, 250) );
    bezier (0,0, 100,70, 40,100, 0,0);
  }
}


