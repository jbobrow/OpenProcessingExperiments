
PImage img;
PImage Limg;
PImage Oimg;
PImage Vimg;
PImage Eimg;
void setup()
{
  size(600,600);
  img = loadImage("himmel.jpg");
  Limg = loadImage("L.png");
  Oimg = loadImage("O.png");
  Vimg = loadImage("V.png");
  Eimg = loadImage("E.png");
}
void draw()
{
  imageMode(CORNER);
  image(img,0,0);
  
  if (mouseX <= 50)
  {
    image(Limg,mouseX,300,300,300);
  }
  
  if (mouseX >50 && mouseX <=150 )
  {
    image(Oimg,mouseX,300,300,300);
  }

  if (mouseX >=150 && mouseX <=250)
  {
    image(Vimg,mouseX,300,200,300);
  }
  
  if (mouseX >=250)
  {
    image(Eimg,mouseX,300,300,300);
  }

}


