
int rad = 40;
float x, y;
PImage logo;



void setup()
{
  size(960, 400);
  noStroke();

  background(255);
  y = rad;
  x= width/2;
  logo = loadImage("logo.png");
    fill(150, 30);
}

void draw()
{
  background(255);
  image(logo,0,y-350);
  ellipse(x, y, 40, 40);

  if (mousePressed
   && mouseY > Y - rad  && mouseY < y + rad && mouseY < height)
  {
    y = mouseY;
  }  
  else
  {
    y = lerp(y, rad, 0.02);
  }
}




