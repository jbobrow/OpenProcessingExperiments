
PShape s;
float rangle,angle = 0.0;
int cols = 10;
int rows = 10;


void setup()
{
  size(800, 800);
  colorMode(HSB, 100);
  s = loadShape("Nintendo_logo.svg");
  smooth();
  frameRate(2);
}

void draw()
{
  float h = 10;
  float sw = 0;
  float sat = 10;
  background(15,2,98);
  shapeMode(CENTER);
  translate(50, 50);
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j++)
    {
      h++;
      sat = sat + .8;
      sw = sw + .1;
      logo(i*width/cols, j*height/rows, sw, h, sat);
    }
  }
}


void logo(float x, float y, float sw, float h, float sat)
{
  pushMatrix();
  translate(x, y);
  scale(random(1.1,1.9));
  s.disableStyle();
  strokeWeight(sw);
  fill(h,sat,100);
  shape(s, -15, -15, 40, 40);
  popMatrix();
}

