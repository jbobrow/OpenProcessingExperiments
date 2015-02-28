
float rot = 0;

void setup()
{
  size(500,500);
  smooth();
  noFill();
  stroke(0);
  background(255);
  rot = random(PI*30);
}

void draw()
{  
  float r = .5*sin(rot/11)+.6 + .5*cos(rot/3)+.6;
  float s = .5*sin(rot/7)+.6 + .5*cos(rot/5)+.6;
  stroke(50+150*(.5*sin(rot/7)),50+150*(.5*sin(rot/11+PI/12)),50+150*(.5*sin(rot/3-PI/16)));
  translate(width/2,height/2);
  rotate(rot);
  CreateThing(r*-width/4,r*-height/4,r*width/4,r*height/4,10);
  rotate(rot+PI/1.2);
  stroke(50+150*(.5*sin(rot/5)),50+150*(.5*sin(rot/6+PI/2)),50+150*(.5*cos(rot/4-PI/5)));
  CreateThing(s*-width/4,s*-height/4,s*width/4,s*height/4,10);

  rot += PI/32;

  filter(BLUR,1);
}

void CreateThing(float xs, float ys, float xe, float ye, float gap)
{
  float w = xe - xs;
  float h = ye - ys;

  for(float i = 0; i <= w; i += gap)
  {
    line(xs,ys+i,xs+i,ys+h);
  }
}


