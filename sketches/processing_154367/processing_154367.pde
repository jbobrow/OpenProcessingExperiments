
//Agustey Mongia
//copyright notice

float x=0;
float y=100;
float dx=2;
float sz=75;
PImage pic;

void setup()
{
  size(400, 400);
  pic = loadImage("dolphin1.jpg");

};

void draw()
{
  background(0);
  image(pic, x, y-75, sz, sz);
  image(pic, x, y, sz, sz);
  image(pic, x, y+75, sz, sz);
  image(pic, x, y+150, sz, sz);
  image(pic, x, y+225, sz, sz);
  x = x+dx;
  
  if (x > width)
  {
   x = 0; 
  };
};


