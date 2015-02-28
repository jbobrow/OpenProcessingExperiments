
size (500, 450);
background ( 254,239,232 );
rectMode(CENTER);
  
float  angolo=0;
  
for (int y=0; y<=height; y+=50)
{
  for (int x=0; x<=width; x+=10)
  {
    angolo -=0.25;
    resetMatrix();
    translate(x, y);
    rotate(angolo);
      
 
fill (random(200,150), random(150,50), random (140,100),100);

 ellipse(0,0, 45,20);
bezier (50,50,60,70,20,70,40,10);

 }
}
