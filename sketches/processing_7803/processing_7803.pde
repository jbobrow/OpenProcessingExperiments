
// Keith O'Hara <kohara@bard.edu>
// Feb 22 2010 Lecture

float angle;
void setup()
{
  size(400, 400);
  stroke(196);
  smooth();
  PFont font = loadFont("Tahoma-Bold-48.vlw");
  textFont(font);
  textAlign(CENTER, CENTER);
  angle = 0;
}
void draw()
{
  background(24);
  
  translate(200, 200);
  rotate(radians(-90));
  
  float x = 100*cos(radians(angle));
  float y = 100*sin(radians(angle));
  line(0, 0, x, y);

  pushMatrix();
  rotate(radians(90));
  text(int(angle)%360, 0, 0);
  popMatrix();

  ellipse(x, y, 20, 20);
  angle = angle + 1; 
}


