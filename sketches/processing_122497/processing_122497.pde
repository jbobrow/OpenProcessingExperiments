
PImage img;
PImage platan;
color c;
int pasPixel=1;
float nivellGris;
color cBN;
float umbral=128;

void setup()
{
  img=loadImage("obama.jpg");
  size(img.width, img.height);
  image(img, 0,0);
  noStroke();
}

void draw()
{
  img=loadImage("obama.jpg");
  for (int i=0; i<width; i=i+1)
  {
    for (int j=0; j<height; j=j+1)
    {
      c=img.get(i,j);
      //EXEMPLE2: Passem la imatge a Blanc i Negre
      nivellGris=brightness(c);
      umbral=map(mouseX, 0, width, 0, 255);
      if (nivellGris>umbral)
        cBN=color(255);  
      else
        cBN=color(0);
        img.set(i,j, cBN);
     }
  }
  image(img,0,0);
}

void keyPressed()
{
  if (keyCode==UP)
    umbral=umbral+1;
  if (keyCode==DOWN)
    umbral=umbral-1;  

}

