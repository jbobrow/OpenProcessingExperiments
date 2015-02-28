
PImage moon, ufo, stars, earth;
float ufo_x, ufo_y;
float comet_x, comet_y, comet_a;

void draw()
{
  background(0, 0, 0);
  image(stars, 0, 0);
  
  image(moon, 150, 150);
 
  
  image(earth, 20, 20);
  
  
  if (ufo_x < 350)
    ufo_x += 1.1;
    
  if (ufo_y < 400)
    ufo_y ++;
    
  if (ufo_x >= 350 && ufo_y >= 400)
  {
    ufo_x = 0;
    ufo_y = 0;
    comet_x = 400;
    comet_y = 100;
    comet_a = 0;
  }  
  
  float distance = 1;
  for (int i = 0; i < 15; i++)
  {
    fill(255, 255, 255, 10);
    ellipse(comet_x + distance, comet_y - distance, 30, 30);
    distance = distance +3;
  }
  comet_x -= cos(radians(comet_a)) + 1;
  comet_y += sin(radians(comet_a)) + 1;
  comet_a += .4;
  
  fill(255,200 + random(45),45);
  ellipse(comet_x, comet_y, 33, 33);
  image(ufo, ufo_x, ufo_y);
  
  
    
}

void setup()
{

  size(600, 600);
  stars = loadImage("stars.jpg");
  moon = loadImage("moon.png");
  ufo = loadImage("ufo.png");
  earth = loadImage("earth-transparent.png");
  
  ufo_x = 1;
  ufo_y = 1;
  
  comet_x = 400;
  comet_y = 100;
  
}

