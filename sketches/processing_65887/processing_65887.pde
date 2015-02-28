
int x = 250;
  int y = 250;
  
  float r = random(-250,250);
  int innerR = int(r);
  float l = random(-250,250);
  int innerL = int(l);
  float c = random(-250,250);
  int cShift = int(c);
  int repeats = 0;
  
  int innerRShift = 30;
  int innerLShift = 20;
  int cShiftShift = 10;
  
void setup()
{
  size(500,500);
}

void draw()
{
  size(500,500);
  background(0);
  smooth();
  strokeWeight(2);
  stroke(255);
  
  line(x,y-cShift,x,y-innerR);
  line(x,y-cShift,x-innerL,y);
  line(x,y-innerR,x-innerL,y);
  
  line(x-cShift,y,x,y+innerL);
  line(x-cShift,y,x-innerR,y);
  line(x,y+innerL,x-innerR,y);
  
  line(x,y+cShift,x+innerL,y);
  line(x,y+cShift,x,y+innerR);
  line(x,y+innerR,x+innerL,y);
  
  line(x+cShift,y,x,y-innerL);
  line(x+cShift,y,x+innerR,y);
  line(x+innerR,y,x,y-innerL);
  
  innerR = (innerR+innerRShift);
  innerL = (innerL+innerLShift);
  cShift = (cShift+cShiftShift);
  
  if (innerR > 245){
    innerR = 244;
    r = random(1,6);
    innerRShift = -int(r);
  }
  if (innerR < -245){
    innerR = -244;
    r = random(1,6);
    innerRShift = int(r);
  }
  if (innerL > 245){
    innerL = 244;
    l = random(1,6);
    innerLShift = -int(l);
  }
  if (innerL < -245){
    innerL = -244;
    l = random(1,6);
    innerLShift = int(l);
  }
  if (cShift > 245){
    cShift = 244;
    c = random(1,6);
    cShiftShift = -int(c);
  }
  if (cShift < -245){
    cShift = -244;
    c = random(1,6);
    cShiftShift = int(c);
  }
}

void mousePressed()
{
  /*
  innerR = (innerR+innerRShift);
  innerL = (innerL+innerLShift);
  cShift = (cShift+cShiftShift);
  
  if (innerR > 245){
    innerR = 244;
    r = random(10,60);
    innerRShift = -int(r);
  }
  if (innerR < -245){
    innerR = -244;
    r = random(10,60);
    innerRShift = int(r);
  }
  if (innerL > 245){
    innerL = 244;
    l = random(10,60);
    innerLShift = -int(l);
  }
  if (innerL < -245){
    innerL = -244;
    l = random(10,60);
    innerLShift = int(l);
  }
  if (cShift > 245){
    cShift = 244;
    c = random(10,60);
    cShiftShift = -int(c);
  }
  if (cShift < -245){
    cShift = -244;
    c = random(10,60);
    cShiftShift = int(c);
  }
  */
  
  repeats = repeats+1;
  // save("iteration" + repeats + ".jpg");
}

