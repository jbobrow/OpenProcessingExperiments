

void setup()
{
size( 800,600 );
background( 0 );
stroke( 180,100,200 );
}


void draw()

{
translate(mouseX,mouseY);
rotate(frameCount/10.0);
if (mousePressed) {
  
strokeWeight (1);
stroke ( random(130, 200), random(150, 100), random(180, 100));

fill (random(210,360), random(0,50), random (90,10), 35);
 triangle(150,100,50,45,32,61);
}
 }










