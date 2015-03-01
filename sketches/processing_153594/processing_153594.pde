
void setup()
{
size( 550,550 );
background( random(255),random(255),random(255),random(120));

}
void draw()
{
if (mousePressed) {
stroke( random(255),random(255),random(255),random(120) );
fill(random(255),random(255),random(255));
translate(mouseX,mouseY);
rotate(frameCount/10.0);
//arc (50,50, 70,70,0,3);
ellipse(50,50,70,70);
line(0,0,random(200),0);
ellipse (0,0, 40,0);
}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}

