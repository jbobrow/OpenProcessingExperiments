
void setup()
{
  size(400,400);
  strokeWeight(2);
  frameRate(20);
}

void draw()
{
  background(random(256),random(256),random(256));
  stroke(random(256),random(256),random(256));
  line(200,200,random(400),random(400));
  stroke(random(256),random(256),random(256));
  line(0,0,random(400),random(400));
  stroke(random(256),random(256),random(256));
  line(400,0,random(400),random(400));
  stroke(random(256),random(256),random(256));
  line(0,400,random(400),random(400));
  stroke(random(256),random(256),random(256));
  line(400,400,random(400),random(400));
}

