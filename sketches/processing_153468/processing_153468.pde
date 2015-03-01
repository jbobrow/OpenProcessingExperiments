
void setup()
{
size( 580,580 );
background( 30);

}
void draw()
{
translate(mouseX-1,mouseY-50);
rotate(frameCount/90.2);
if (mousePressed) {
  fill(25,100,280,100);
  noStroke();
arc(50,50,190,50,0.9,1);
}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}


