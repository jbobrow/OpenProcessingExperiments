
PImage foto;
int pos;
void setup()
{
  size(400,400);
  foto= loadImage("Lenna.jpg");
  pos=-400;
}
void draw()
{
  background(0);
  if(pos<0)
  {
    image(foto,pos,pos);
    pos++;
  }
  else
  {
    image(foto,pos,pos);
  }
}
