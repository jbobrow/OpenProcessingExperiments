
int counter;
float x,y;
float angolo;
void setup()
{
  size(800,600);
  background(255);
 x=0;
 y=0;
 angolo =0;
}
void draw()
{
  translate(width/2,height/2);
rotate(angolo);
fill(0,255,0);
strokeWeight(3);
point(x,y);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
y+=0.1;
angolo += PI/48;
}
