
void setup()
{
size( 500,500 );
colorMode (HSB, 360,100,100);
background(360);
stroke( 360,40 );
}
void draw()
{
if (mousePressed) {
translate(mouseX,mouseY);
rotate(random(PI));
strokeWeight(10);
fill (random(21,360), random(0,50), random (90,100), 100);
ellipse(0,0,random(30,200), random(30,200));
point(0,0);

}
}
void keyReleased()
{
if (key=='f' || key=='F') {

  background(360);
}
}
