
// Draw a nice view!

//Where y is the passage of time.
float y=0;
PImage sun;
void setup()
{
  sun = loadImage("sun.png");
  size(830,400);
  frameRate(20);
  noSmooth();
}
void draw()
{
  color c = color(y*0.01,(y*0.06)*2,y*0.01);
  background(c);
  println(brightness(c));
  cloudScape();
  //y+=0.93;
  y+=10;
  println(y);
}

class Cloud
{
  Cloud()
  {
    
  }
}

void cloudScape()
{
  //Color the sky.
  for(int y=0; y < height+50; y++)
  {
    color from = color(122,93,142);
    color to = color(241, 120, 104);
    color A = lerpColor(from, to, y*0.005);
    stroke(A);
    blendMode(ADD);
    line(0, y, width, y);
    blendMode(BLEND);
  }
  for(int x=0; x < width; x++)
  {
    float noiseVal = noise(y*atan(y/x)*0.07,
                           x*0.024);
    stroke(255,220+(y*0.04),80+(y*0.02));
    line(x, height/2+noiseVal*80-80, x, height);
  }
  //Draw the sun.
  if(y >= 4400)
  {
    image(sun, width/5+(y*0.07), -20-(4400*0.07));
  }
  else
  {
    image(sun, width/5+(y*0.07), -20-(y*0.07));
  }
  drawGradient(width/2+73+(y*0.07), height/2+100-(y*0.07)); 
  //Clouds.
  for(int x=0; x < width; x++)
  {
    float noiseVal = noise(y*4*atan(y/(x/2))*0.02,
                           x*0.02);
    stroke(255,220+(y*0.011),130+(y*0.011));
    line(x, height/2+noiseVal*65-40, x, height);
  }
  for(int x=0; x < width; x++)
  {
    float noiseVal = noise(y*4*0.02,
                           x*0.019);
    stroke(255,220+(y*0.015),200+(y*0.015));
    line(x, height/2+noiseVal*50+30, x, height);
  }
  for(int x=0; x < width; x++)
  {
    float noiseVal = noise(y*cos(x*3)*0.02,
                           x*0.06);
    stroke(255,180+(y*0.025),255);
    line(x, height/2+noiseVal*100+80, x, height);
  }
  for(int x=0; x < width; x++)
  {
    float noiseVal = noise(809,
                           x*0.05);
    stroke(0,180,120);
    line(x, height/2+noiseVal*30+140, x, height);
  }
  /*blendMode(ADD);
  noStroke();
  fill((y*0.1));
  rect(0, 0, width, height);*/
}
void drawGradient(float x, float y) 
{
  int radius = width;
  float h = 0;
  for (int r = radius; r > 0; r-=100) {
    blendMode(ADD);
    fill(h);
    noStroke();
    ellipse(x, y, r, y*0.02+r*cos(r));
    h = (h + 1) % 255;
    blendMode(BLEND);
  }
}


