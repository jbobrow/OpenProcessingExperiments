
PImage img;
color c;
int pasPixel=1;

void setup()
{
  img=loadImage("lena.jpg");
  size(img.width, img.height);
  image(img, 0,0);
  noStroke();
}

void draw()
{
  //image(img,0,0);
  for (int i=0; i<width; i=i+pasPixel)
  {
    for (int j=0; j<height; j=j+pasPixel)
    {
      c=img.get(i,j);
      //EXEMPLE1: Pixelem la imatge
      fill(c);
      rect(i,j,pasPixel,pasPixel);
    }
  }
}

void keyPressed()
{
  if (keyCode==UP)
    pasPixel=pasPixel+1;
  if (keyCode==DOWN)
    pasPixel=pasPixel-1;  
}
