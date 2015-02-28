
PImage img;
void setup()
{
  size(600,400);
  img = loadImage("tilt_shift_car.jpg");
}
void draw()
{
  image(img, 0, 0);
}


