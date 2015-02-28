
PImage img;
PImage img2;

void setup ()
{
  size(920,614);
  img=loadImage("Himmel.jpg");
  img2 = loadImage("Flug.png");

}

void draw()
{
  image(img,0,0,920,614);
  
  pushMatrix();
  
  image(img2,mouseX,mouseY,460,307);
  
 
  popMatrix();
  
  
  
  
}



