
void setup()
{
  size(800,300);
  smooth();
  noLoop();
}

void draw()
{
  background(252,240,222);

  for(int i = -50; i<= width+50; i+=80)
  {  
    float rw = random(0.5,1.5);
    float rh = random(0.5,1.5);
    int rs = int(random(255));
    int rsw = int(random(2,10));
    chair(i, height-20, rw,rh, rs,rsw);
  }
}

void chair(float x, float y, float w, float h, int s, int sw)
{
  pushMatrix();
  translate(x,y);
  scale(w,h);
  stroke(s);
  strokeWeight(sw);

  //seat
  line(-30, -80, 30,-80);
  //back
  line(-30, -80, -35, -160);
  //left leg
  line(-30, -80, -35, 0);
  //right leg
  line(30, -80, 35, 0);
  popMatrix();
}


