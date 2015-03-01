
void setup()
{
  size(600,600);
  strokeWeight(4);
}

void draw()
{
  fill(0,0,256);
  rect(100,200,200,200);
  fill(256,0,0);
  rect(175,300,50,100);
  point(185,350);
  line(100,200,200,100);
  line(200,100,300,200);
  fill(256,0,0);
  rect(110,225,50,50);
  fill(256,0,0);
  rect(240,225,50,50);
  point(130,250);
  point(260,250);
  smooth();
  strokeWeight(random(25));
  stroke(random(200),0,256);
  point(300,300);
}


