
float dim = 600 / 4;
float angle = 0;
int centerX = 300, centerY = 300;
float currX, currY;
float rand = random(50);

void setup() {
  size(600,600);
  smooth();
  noCursor();
  background(255);
  noFill();
  ellipse(centerX, centerY , dim, dim);
}

void draw() {
  strokeWeight(1);
  stroke(rand + mouseX/3 + 55, rand + mouseX/3 + 5, rand + mouseX/3 - 10);
  for (float j = 0; j < 6.2; j+=1.049)
  {
  currX = centerX + (dim / 2) * cos(j);
  currY = centerY + (dim / 2) * sin(j);
  ellipse(currX , currY, dim, dim);
  }
  
}

void lineAngle(int x, int y, float angle, float length)
{
  line(width/2, height/2, x+cos(angle)*length, y-sin(angle)*length);
}


