
/* @pjs preload="Animals.jpg,background-cute-desktop-animal-animals-gallery-wallpaper.jpg"; */

PImage myimage;
PImage myimage2;
PImage myimage3;

void setup()
{
  size(600,500);
  
  myimage = requestImage("background-cute-desktop-animal-animals-gallery-wallpaper.jpg"); 
  myimage2 = loadImage("Animals.jpg");
  myimage3 = loadImage("black-panther-desktop-wallpaper-download-marvel-drawing-party-baby.jpg");
  
  
}



void draw()
{
  // check the size of your image to know if it has loaded
  // with requestImage()
  if (myimage.width > 0)
  {
  image(myimage,0,0,width,height);
  }
  
  image(myimage2,0,0, 100, 100);
  image(myimage3,500,0,100,100);
  
  for (int x = 0;x < width; x += 100)
  {
    stroke(255);
    line(x,0,x,height);
  }
  for (int y = 0; y <height; y += 100)
  {
    stroke(255,0,0);
    line(0,y,width,y);
  }
  filter(GRAY);
  
  for (int i=0; i<100; i++)
  {
    float r = random(50);
    stroke (r*5);
    line(100, i, 450+r, i);
  }
 
 
}






