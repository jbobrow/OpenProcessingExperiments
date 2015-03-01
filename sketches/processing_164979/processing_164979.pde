
/*@pjs preload="big_a.png,small_a.png,yuki.png";*/
int r = 45;
int n = 400 / r;
int x;

void setup()
{
  size(400,400);
  background(235,45,45,255);
  smooth();
  noStroke();
  noLoop();
    
  PImage img_big_a, img_small_a, img_yuki;
  
  img_big_a = loadImage("big_a.png");
  img_small_a = loadImage("small_a.png");
  img_yuki = loadImage("yuki.png");
  
  rectMode(CORNERS);
  fill(255);
  //strokeWeight(0);
  rect(0, 362, 361, 400);
  
  imageMode(CENTER);
  
  float deg_small_a = 0.0;
  float rad_small_a = radians(deg_small_a);
  tint(255,255,255,255);
  rotate(rad_small_a);
  image(img_small_a,245,288,200,200);

  float deg_big_a = 0.0;
  float rad_big_a = radians(deg_big_a);
  tint(255,255,255,255);
  rotate(rad_big_a);
  image(img_big_a,94,270,200,200);
  
  float deg_yuki = 45.0;
  float rad_yuki = radians(deg_yuki);
  tint(255,255,255,255);
  rotate(rad_yuki);
  image(img_yuki,285,-120,225,225);
}

void draw()
{
  fill(255,65);
  for (int i = 0 ; i < n;i++)
  {
    for (int j = 0; j < n+1;j++)
    {
      if (j % 2 == 0)
      {
        x = i * r * 2;
      }
      else
      {
        x = i * r * 2 + r;
      }
      ellipse(x, j*r, r, r);
    }
  }
}


