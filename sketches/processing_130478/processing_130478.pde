
PImage img;
PImage img2;
PImage img3; 

void setup()
{
  size(500,483);
  img = loadImage("_DSC0343a.jpg");
  img2 = loadImage("_DSC0346a.jpg");
  img3 = loadImage("_DSC0001.png");
  
}

void draw()
{
  imageMode(CENTER);
  image(img, width/2, height/2);
  //image(img2, 0, 0);
  image(img3, mouseX, mouseY);
 
  
 



  }
void mousePressed()
{
 if (mousePressed && (mouseX>190 && mouseX<300) && (mouseY>182 && mouseY<440) )
  {
    img = img2;
  }   
}   


