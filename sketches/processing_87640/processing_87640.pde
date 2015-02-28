
float i=0;

void setup()
{
 size(800,600);
 background(9,21,47);
 smooth();
 frameRate(30); 
}

void draw()
{
if (i<width)
reflection();
}

void reflection()
{
    stroke(0);
  fill(random(0,255),random(0,255),random(0,255));
  filter(BLUR,1);
  rect(random(0,800),(300), random(10,50), random(10,200));
  pushMatrix();
  translate(400,300);
  rotate(radians(180));
   stroke(255,0,0);
   fill(255,255,0);
   rect(random(-400,400),(0), random(10,50), random(10,200));
  popMatrix();
}
