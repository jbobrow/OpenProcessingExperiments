
int size=500;
int halfsize = size/2;

int rad1 = 100;
int rad2 = 140;

double angle1 = 0.0;
double angle2 = 0.0;

float prevX;
float prevY;

double angleChange = 0.2;
double angle2multiplier = (PI*2)*0.096;

void setup() {
  size(size, size);
  background(255);
  strokeWeight(2);
  strokeCap(ROUND);

  stroke(0,0,0,200);

  prevX = halfsize+rad1*cos((float)angle1)+rad2*cos((float)angle2);
  prevY = halfsize+rad1*sin((float)angle1)+rad2*sin((float)angle2);
}

void draw() {
  float newX = halfsize+rad1*cos((float)angle1)+rad2*cos((float)angle2);
  float newY = halfsize+rad1*sin((float)angle1)+rad2*sin((float)angle2);

  line(prevX, prevY, newX, newY);

  prevX = newX;
  prevY = newY;

  angle1 += angleChange;
  angle2 += angleChange*angle2multiplier;
}
