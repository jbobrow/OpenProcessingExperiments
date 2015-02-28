
PImage foto;

void setup()
{
  size(800,600);
  foto=loadImage("prat.jpg"); //la imagen tiene que estar en un subdirectorio que se llame data del sketch
}

void draw()
{
  image(foto, 0, 0, width, height);
  fill(100, 150);
  rect(200,200, 400,300);
}
