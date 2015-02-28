
PImage img;
PImage img2;

void setup()
{
  size(1000,600);
  img = loadImage("windrader2.jpg");
  img2 = loadImage("windrad.png");
}


void draw()
{
  
 image(img, 1000/2, 600/2);
  pushMatrix();
  translate(440, 170);
  imageMode(CENTER);
  rotate(radians(mouseY+mouseX*1.2)); 
  image(img2,0,0,100,100);
  popMatrix();

  pushMatrix();
  translate(333, 231);
  imageMode(CENTER);
  rotate(radians(mouseY+mouseX*1.1)); 
  image(img2,0,0,75,75);
  popMatrix();
  
}


