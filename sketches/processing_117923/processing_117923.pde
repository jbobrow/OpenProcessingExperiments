
PImage bats;
PImage joker;
PImage deadjoker;
PImage gotham;

float xvalue;
float yvalue;

float xvalue2;
float yvalue2;

float t; // angle
float t2;

int bouncer;
int deadcounter;
int s;


void setup()
{
  size(500, 500);
  s = 100;
  bats = loadImage("batman.png");
  joker = loadImage("joker.png");
  deadjoker = loadImage("deadjoker.png");
  gotham = loadImage("gotham.jpeg");

  background(0);

  xvalue = 300;
  yvalue = 300;

  xvalue2 = 100;
  yvalue2 = 100;

  t = random(0, TWO_PI); // random angle

  t2 = random(0, TWO_PI); // random angle

  bouncer = 15;
}

void draw()
{
  background(0);
  imageMode(CORNER);
  image(gotham,0,0,width,height);

  ellipse(xvalue, yvalue, s, s);
  imageMode(CENTER);
  image(bats, xvalue, yvalue, s, s);

  ellipse(xvalue2, yvalue2, s, s);
  if(deadcounter != 40)
  {
    image(deadjoker, xvalue2, yvalue2, s, s);
    ++deadcounter;
  }
  else
  {
    image(joker, xvalue2, yvalue2, s, s);
  }

  xvalue = xvalue+2*cos(t);
  yvalue = yvalue+2*sin(t);

  xvalue2 = xvalue2+2*cos(t2);
  yvalue2 = yvalue2+2*sin(t2);
  if (xvalue>width) t=PI-t;
  if (xvalue<0) t=PI-t;
  if (yvalue>height) t=TWO_PI-t;
  if (yvalue<0) t=TWO_PI-t;

  if (xvalue2>width) t2=PI-t2;
  if (xvalue2<0) t2=PI-t2;
  if (yvalue2>height) t2=TWO_PI-t2;
  if (yvalue2<0) t2=TWO_PI-t2;
  
  if(abs(yvalue-yvalue2)<s+1 && abs(xvalue-xvalue2)<s+1) // hit
  {
  if (yvalue>yvalue2) t=TWO_PI-t;
  if (yvalue<yvalue2) t=TWO_PI-t;
  if (xvalue2>xvalue) t2=PI-t2;
  if (xvalue2<xvalue) t2=PI-t2;
  deadcounter = 0;
  }
  
  /*if(abs(xvalue-xvalue2)<s && abs(yvalue2-yvalue)<s)
  {
    if (yvalue>yvalue2) t=PI-t;
    if (yvalue<yvalue2) t=TWO_PI-t;
    if (xvalue2>xvalue) t2=TWO_PI-t2;
    if (xvalue2<xvalue) t2=PI-t2;
    deadcounter = 0;
  }*/
}


//If the 2 x's are between a range of



