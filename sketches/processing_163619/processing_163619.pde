
void setup()

{
  size(600,600);
  noStroke();
  frameRate(15);
  smooth(8);
}

void draw()
{
  background(#1F1C1C);
  stroke(230);
  strokeWeight(1);
  for (float x=0; x<width; x+=15) {
    float X=random(0,width);
    float Sz=random(10,30);
    line(X,x,X,x+Sz);
  }
}

void mousePressed()
{
  background(150);
  smooth(200);
}
