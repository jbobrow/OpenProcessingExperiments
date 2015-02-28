
void setup()
{
size (480,480);
background (255);
stroke (255,40);
frameRate (50);
noFill ();
}

void draw()
{
 
  if (mousePressed) {
   translate(mouseX,mouseY);
   rotate(frameCount/5.0);
   
   stroke (random(255), random(255), 255);
   scale (random(2));
   triangle(-10,80, 50,20, 90,80);
} 
}
void keyReleased()
{
if (key=='n' || key=='N') {
background(0);
} else if (key=='b' || key=='B') {
background(255);
}
}
