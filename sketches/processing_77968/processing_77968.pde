
PImage img1;
PImage img2;

int i = 1;

void setup()
{
  
  size(640,230);
  background(255);
  img1 = loadImage("FineText.jpg");
  img2 = loadImage("GlitchyText.jpg");

}

void draw()
{
  
  if ( i < 60 )
  {
    i++;
    image(img1,0,0);  
  }
  
  else if ( i == 60 )
  {
    i++;
    image(img2,0,0);
  }
  
  else if ( i == 61 )
  {
    i++;
    image(img2,0,0);
  }

  else if ( i == 62 )
  {
    i++;
    image(img2,0,0);
  }
  
  else if ( i == 63 )
  {
    i++;
    image(img2,0,0);
  }
  
  else if ( i == 64 )
  {
    i++;
    image(img2,0,0);
  }
  
  else if ( i == 65 )
  {
    i = 1;
    image(img1,0,0);
  }
  
}

