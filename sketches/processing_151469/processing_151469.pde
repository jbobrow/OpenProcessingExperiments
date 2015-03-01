
void setup()
{
size( 700,500 );
background( 0 );
stroke( 140,90,140 );
}
 
 
void draw()
 
{
translate(mouseX,mouseY);
rotate(frameCount/5.0);
if (mousePressed) {
   
strokeWeight (1);
stroke ( random(110, 220), random(250, 160), random(80, 120));
 
fill (random(410,460), random(300,280), random (200,180), 35);
 ellipse(0,0, 100,100);
   ellipse(random(0,20), random(0,20) , random(10,10), random(10,10));


}
 }
