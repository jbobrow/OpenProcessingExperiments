
void setup()
{
  smooth();
  background(0);
  size(300, 300);
  noCursor();
}

int inner_radius = 10;
int c_radius = 300;
int distance = 5;
float stroke_weight = 0.5;
boolean bstroke = false;

void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i < c_radius; i+=distance)
  {
    fill(#FFFFFF, i/inner_radius);
    strokeWeight(stroke_weight);
    stroke(#000000);
    if (bstroke == false)
    {
      noStroke();
    }
    ellipse(mouseX, mouseY, c_radius - i, c_radius - i);
  }
}

void keyPressed()
{
  if (key == '+' && inner_radius > 1) {
    inner_radius--;
  }
  if (key == '-') {
    inner_radius++;
  }
  if (key == 'g') {
    c_radius++;
  }
  if (key == 'k') {
    c_radius--;
  }
  if (key == 'm' && distance > 1) {
    distance--;
  }
  if (key == 'n') {
    distance++;
  }
  if (key == 's' && stroke_weight > 0.2) {
    bstroke = true; 
    stroke_weight-=0.1;
  }
  if (key == 'w') {
    bstroke = true; 
    stroke_weight+=0.1;
  }
  if (key == 'x') {
    bstroke = false;
  }
  if (key == 'd')
  {
    distance = 5;
    c_radius = 300;
    inner_radius = 10;
    stroke_weight = 0.5;
  }
}

