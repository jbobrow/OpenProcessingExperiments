
//soheew@andrew.cmu.edu soheew copyright

int x, y, x1, y1, z;
void setup ( )
{
  size (400,400);
  background (255);
  z=10;
  x=25;
  y=15;
  x1=25;
  y1=20;
  loop ();
  frameRate (10); 
 
}
 
 
 
void draw() {
  whiletxPhase ( );
  y = ( y + x1 ) % height;
}
 
void whiletxPhase ( )
{
  int x = 10;
  while (x<width)
  {
    noStroke ( );
    fill (random(255), random(255), random(255));
    ellipse (x+2,y+10,z*.5,z*.5);
    rect( frameCount%width, mouseY,  mouseX-mouseY, mouseY- mouseX);
    ellipse( frameCount%width, mouseY,  mouseX-mouseY, mouseY- mouseX);

 
    x=x+x1;
  }
}
 
 
 
void keyPressed ( )
{
 if (key == ' '){
 
   background (255);
 fill (random(255), random(255), random(255) );
 }
 
//if(keyPressed) saveFrame("hw3_v2.jpg");

}
 


