
void setup()
{
size( 600, 600 );
background( 0 );

}
 
 
void draw()
 
{
translate(mouseX,mouseY);
rotate(frameCount/10.0);
if (mousePressed) {
   stroke ( random(0, 255), random(0, 255), 0);
 fill (random(0, 255), random(0,255), random (0, 255), random (0, 255));
 rect(0, random (0, 50), (10), random (0, 200));
}
 }
