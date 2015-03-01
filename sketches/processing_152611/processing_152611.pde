
void setup()
{
size( 480,480 );
background( 0,0,0 );

noFill ();
}
void draw()
{

if (mousePressed) {
stroke(255,240);
translate(mouseX,mouseY);
rotate(frameCount/10.0);
line(mouseX,mouseY,3,0);
}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}



