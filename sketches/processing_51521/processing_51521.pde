

//------------------------------------------------
// PG_PlayingWithLissa   2012-02-10
//------------------------------------------------

float f = 0.0235;
//------------------------------------------------
void setup () 
{
  size(512, 512, P2D);
  noStroke();
  colorMode(HSB, 256);
}
//------------------------------------------------
void draw () 
{
  fill(frameCount%255,222,122,55);
  ellipse(random(width), 0,44,44);
  ellipse(random(width), width,44,44);
  ellipse(0,      random(height),44,44);
  ellipse(height, random(height),44,44);
  for (int ni = 0; ni < 133; ni++)
  {
    fill((ni+frameCount)%255,222,122,25);
    ellipse(256+266*cos(0.027*(ni*6+frameCount)), 256+266*sin(f*(ni*7+frameCount)),24,24);
  }  
  copy(0, 0, width, height, 2, 2, width-5, height-5);
  fill(255,6);
  rect(0, 0, width, height);
}
//------------------------------------------------
void mousePressed()
{
  f = 0.02+random(0.05);
}
//------------------------------------------------ 
void keyPressed()  
{
  if (key==' ') f = 0.02+random(0.05);
  if (key=='s') save("lissa.png");
}


