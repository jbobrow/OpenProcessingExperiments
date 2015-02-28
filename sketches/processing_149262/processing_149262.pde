
void setup()
{
size( 480,480 );
background( 0,0,0 );
noFill ();
}
void draw()
{
if (mousePressed) {
stroke( random(255),random(255),random(255),random(120) );
translate(mouseX,mouseY);
rotate(frameCount/10.0);
arc (50,50, 70,70,0,3);
line(0,0,random(200),0);
triangle(0,0, 80,0, 0,80);
}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}

