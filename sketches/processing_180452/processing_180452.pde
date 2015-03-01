
void setup ( )
{
  size (800,600);
  background(random(122));
}

void draw ( )
{
  translate (width/random(1,39),height/random(1,34));
  rotate(PI/random(1,923));
  fill(random(55,255));
  rect(0,0,030,100);
}

