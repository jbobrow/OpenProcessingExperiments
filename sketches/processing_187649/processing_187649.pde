
PVector location1, speed1;
PVector location2, speed2;
int diameter = 50;

void setup()
{
  size(800, 500);
  background(255);
  location1 = new PVector(50, height/2);
  speed1 = new PVector(7, 3);
  location2 = new PVector(width/2, height/2);
  speed2 = new PVector(-3, 4);
}

void draw()
{
  background(255);

  //Ball #1 
  fill(0, 255, 0);
  stroke(0, 255, 0);
  ellipse(location1.x, location1.y, diameter, diameter); //leading ball
  location1.add(speed1);
  if (location1.x + diameter/2 >= width || (location1.x - diameter / 2) <= 0)
    speed1.x *= -1;
  if (location1.y + diameter/2 >= height || location1.y - (diameter / 2) <= 0)
    speed1.y *= -1;

  //Ball #2 
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(location2.x, location2.y, diameter, diameter); //trailing ball
  location2.add(speed2);
  if (location2.x + diameter/2 >= width || (location2.x - diameter / 2) <= 0)
    speed2.x *= -1;
  if (location2.y + diameter/2 >= height || (location2.y - diameter / 2) < 0)
    speed2.y *= -1;

  fill(0);
  strokeWeight(3);
  stroke(0);
  drawArrow(location1.x, location1.y, location2.x, location2.y, 0, 6, true);
}

//Drawing an arrow
void drawArrow(float x0, float y0, float x1, float y1, float beginHeadSize, float endHeadSize, boolean filled) 
{

  PVector d = new PVector(x1 - x0, y1 - y0);
  d.normalize();

  float coeff = 1.5;

  strokeCap(ROUND);

  line(x0+d.x*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  y0+d.y*beginHeadSize*coeff/(filled?1.0f:1.75f), 
  x1-d.x*endHeadSize*coeff/(filled?1.0f:1.75f), 
  y1-d.y*endHeadSize*coeff/(filled?1.0f:1.75f));

  float angle = atan2(d.y, d.x);

  if (filled) {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    triangle(-beginHeadSize*coeff, -beginHeadSize, 
    -beginHeadSize*coeff, beginHeadSize, 
    0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    triangle(-endHeadSize*coeff, -endHeadSize, 
    -endHeadSize*coeff, endHeadSize, 
    0, 0);
    popMatrix();
  } else {
    // begin head
    pushMatrix();
    translate(x0, y0);
    rotate(angle+PI);
    strokeCap(ROUND);
    line(-beginHeadSize*coeff, -beginHeadSize, 0, 0);
    line(-beginHeadSize*coeff, beginHeadSize, 0, 0);
    popMatrix();
    // end head
    pushMatrix();
    translate(x1, y1);
    rotate(angle);
    strokeCap(ROUND);
    line(-endHeadSize*coeff, -endHeadSize, 0, 0);
    line(-endHeadSize*coeff, endHeadSize, 0, 0);
    popMatrix();
  }
}

