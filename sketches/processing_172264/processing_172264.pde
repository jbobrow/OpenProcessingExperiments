
float season;
class Circ
{
  float opacity, target_opacity, speed;
  float x, y;
  float x1, x2;
  PImage img;
  
  Circ(float _x, float _opacity, int _image)
  {
    x = _x;
    img = loadImage(_image+".png");
    opacity = _opacity;
    target_opacity = _opacity;
    speed = 10;
    y = height/2;
    x1 = 10;
    x2 = 7010;
  } 
  void update()
  {
    opacity+= (target_opacity-opacity)*.02; 
    
    x1-=speed;
    x2-=speed;

    if (x1 <=-7000)
    {
      
      x1 = 7000;
    }
    if (x2 <=-7000)
    { 
      x2 = 7000;
    }
  }
  void display()
  {
    tint(255, opacity*255);
    image(img, x1, 10, 7000, 700);
    image(img, x2, 10, 7000, 700);
  }
}

Circ[] circs = new Circ[1];
int current_season;
void setup()
{
  size(800, 600);
  season = 0; 
  current_season = int(season);
  for (int i = 0; i < circs.length; i++)
  {
    circs[i] = new Circ(100+(i*100), 0, i);

    circs[0].opacity = 1;
    circs[0].target_opacity = 1;
  }
}
void draw()
{
  background(0);
  season+=.01;
  if (season >=1)
    season = 0;
  if (int(season)!=current_season)
  {
    circs[current_season].target_opacity = 1;
    circs[int(season)].target_opacity = 0;
    current_season = int(season);
  }


  for (int i = 0; i < circs.length; i++)
  {
    circs[i].update();
    circs[i].display();
  }
}



