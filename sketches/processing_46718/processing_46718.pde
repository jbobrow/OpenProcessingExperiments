
int total = 0;
int inside = 0;

void setup()
{
  size(200,200);
  background(0);
  frameRate(200);
  noFill();
}

void draw()
{
  stroke(0, 0, (int)random(150, 255));
  strokeWeight(1);
  for(int i = 0; i < 10000; ++i)
  {
    float x = random(1.0);
    float y = random(1.0);
    point((int)(x * width), (int)(y * height));
    
    if(dist(0,0,x,y) < 1.0)
      ++inside;
    ++total;
  }
  
  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  arc(0, height, width * 2, height * 2, TWO_PI-PI/2, TWO_PI);
  
  fill(0);
  noStroke();
  rect(0, height - 15, 60, 15);
  
  fill(255);
  text(String.valueOf((float)inside / (float)total * 4.0), 0, height - 3);
}

