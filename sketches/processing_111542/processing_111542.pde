
PImage picture;

void setup()
{
  size(640, 960);
  picture  = loadImage("rollercoaster.jpg");
}

void draw ()
{
  image(picture, 0, 0);
  filter(GRAY);
  fill(255, 255, 255, 0);
  strokeWeight(5);
  rect(90, 350, 70, 75);
  rect(290, 290, 75, 75);
  ellipse(265, 520, 85, 100);
  rect(450, 400, 75, 93);
  strokeWeight(2);
  int x = 64;
  for(int i = 0; i < 10; i++)
  {
    line(x, 0, x, 960);
    x += 64;
  }
  int y = 96; 
  for(int j = 0; j < 10; j++)
  {
    line(0, y, 640, y);
    y += 96;
  }
  float a = 200;
  float preva = 240;
  for(int k = 0; k < 200; k+=20)
  {
   line(preva, 0, a, k);
   preva = a;
   a = random(-110, 110);
  }
  float b = 440;
  float prevb = 480;
  for(int l = 960; l > 760; l-= 20)
  {
   line(prevb, 960, b, l);
   prevb = b; 
   b = random(-110, 110);
  }
  float c = 200;
  float prevc = 200;
  for(int m = 0; m < 20; m++)
  {
   ellipse(450, 480, c, prevc);
   c = random(-50, 50);
   prevc = c;
  }
}


