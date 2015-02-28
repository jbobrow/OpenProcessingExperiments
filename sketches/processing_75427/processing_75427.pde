
//Andy Li, 100 randomShapes, Computer Programming I, Mods 14-15
//special thanks to my good friend laura
PImage g;
void setup()
{
  size(600,400,P3D);
  frameRate(2);
  g = loadImage("bokeh-photography-9.jpg");
  
}
void draw()
{
  image(g,0,0,600,400);
  smooth();
  int x = 2;
  int y = 1;
  noStroke();
  fill(234,64,64);
  while(x < 51)
  {
    ellipse(int(random(600)), int(random(400)), 20, 20);
    x++;
  }
  fill(255,220,106);
  while(y < 51)
  {
    ellipse(int(random(600)), int(random(400)), 20, 20);
    y++;
  }
}


