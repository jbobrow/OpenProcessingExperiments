
PImage bg,a;

void setup()
{
  size(1024,768);
   bg = loadImage("http://spinoff.comicbookresources.com/wp-content/uploads/2011/05/candy-land.jpg");
   
  
}//

void draw()
 { 
  background(255);
  image(bg,mouseX-512,mouseY-384);
  ellipse(mouseX, height/2+25, mouseY/2+25, mouseY/2+25);
  fill(255, 240, 0);
  int inverseX = width-mouseX;
 }//


