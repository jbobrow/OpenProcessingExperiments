
void setup()
{
size (500,500);
background (0);
stroke (255,10);
}
 
void draw()
{
  
  if (mousePressed) {
    translate(mouseX,mouseY);
 rotate(random(PI));
   stroke (random(0,255), random(0,255), random (0,255));
   noFill ();
   ellipse (0,0, random(0,80),random(150,10));
   ellipse(0,0, 40,40);
   ellipse(random(0,20), random(0,20) , random(10,10), random(10,10));
}
}
void keyReleased()
{
if (key=='c' || key=='C') {
background(0);
}
}

