
/* @pjs preload="farfalla2.png", "fiori.jpg"; */
 
PImage farfalla; 
void setup()

{
   
  size (500,500);
   
PImage fiori = loadImage("fiori.jpg");

 
image (fiori, 0,0);
farfalla = loadImage("farfalla2.png");
 
   
}
   
void draw()
{
  translate (mouseX,mouseY);
 rotate(frameCount/10.0);
  tint(random(255),random(255),random(255));
if (mousePressed) {
scale (random (1));
 image( farfalla, 0,0 );
}
{

}  
}


