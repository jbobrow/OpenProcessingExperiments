
void setup()
{
  size(400, 400);
  colorMode(HSB);
  noStroke();
  smooth();
}

float ccb;    //    changing color background

void draw()
{
  makeFace();
  makeEye(width/3-25, height/3-25);
  makeEye(width*2/3+25, height/3-25);
}

void makeFace()
{
  if (ccb >= 255)  ccb = 0;  else  ccb+=2;
  background(ccb, 255, 255);
  fill(255-ccb, 127, 127);
  ellipse(width/2, height/2, 300, 300);
  fill(0);
  arc(width/2, height*1.1/2, 350, 225, 0, PI);
  fill(255);
  for(int i = 0; i < 3; i++)
  {
    arc(i*80+120, height*1.1/2, 80, 100, 0, PI);
  }
}

void makeEye(float _xpos, float _ypos)
{
  float angle = atan2(_ypos-mouseY, _xpos-mouseX)-PI;
  float dist = dist(_xpos, _ypos, mouseX, mouseY);
  dist = constrain(dist, 0, 50);
  fill(255);
  ellipse(_xpos, _ypos, 125, 125);
  fill(0);
  ellipse(_xpos+cos(angle)*dist, _ypos+sin(angle)*dist, 25, 25);
}


