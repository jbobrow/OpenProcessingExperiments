
void setup()
{
  size(600,600);
  frameRate(10);
}

void draw()
{
  background(180);
  fill(255);
  stroke(5);
  strokeWeight(1);
  for (float x=0; x< width; x+=5) {
    float rainX = random(3,width);
    float rainSz = random(10,20);
    line( rainX, x, rainX, x + rainSz);
  }
}


void mousePressed()
{
  background(100);
  stroke(255);
  strokeWeight(random(1,5));
  float x = random(0,600);
  float y = random(0,600);
  line(x,0,430,75);
  line(430,75,300,115);
  line(300,115,375,170);
  line(375,170,189,210);
  line(189,210,400,300);
  line(400,300,280,355);
  line(280,355,365,400);
  line(365,400,300,440);
  line(300,440,328,510);
  line(328,510,255,563);
  line(255,563,y,600);   
}
