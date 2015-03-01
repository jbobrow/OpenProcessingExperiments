
//Juliana Hong julianah
//Copyright
float x;
float y;
PImage photo;
void setup()
{
size(400, 400);
background(0,0,0);
photo = loadImage("sky.JPG");

}

void draw()
{
if (x<width)
{
  clear();
  x+=3;
  
}
else{
  x= 0;
}


if (y<height)
{
  y+=3;  
}
else{
  y= random(0,400);
}

image(photo, x, y, 150, 100);
  fill(255,0,155);

}





