
//DevonJoyce

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(85);
}

void draw()
{
  fill(0,0,0,10);
  rect(0,0, width,height);
  fill(0, 0, random(255));
  ellipse( random(width), random(height),15,15);
  //fill(0,0,0);
  //ellipse(10, 10, frameCount, frameCount);

  
}


