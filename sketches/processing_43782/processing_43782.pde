

PImage[]images=new PImage [5];
PImage img=new PImage();
float x;
float y;
int r;





void setup() {
  size (324, 432);
  for (int i=0; i<images.length;i++)
  {
    images[i] =loadImage (i+".jpg");
  }
  for (int i=0; i< images.length; i++)
    background(images[0]);
}

void draw()
{
  if (mousePressed)

  {
    for (int count = 0;count<5;count ++)

      r=int (random(5));
    image(images[r], 0, 0);
  }
}




