
PImage still;
PShape amclogo;

int numElements = 50;
color[] colors = new color[numElements];
float spacer, spacer2;
int num=0;
float bg = 0; // BACKGROUND COLOR
float lc = 255; // LOGO COLOR

//color change timer
int threshold2;
int threshold;
int prevMillis = 0;
float t = 0;
int time;

//fade ease
float c_ease = 0.04; //ease speed
float x, y;
float lx;



void setup()
{

  size(800, 300);
  smooth();
  noStroke();

  //time elements
  threshold = 150;
  threshold2 = 150;

  //logo and shapes
  amclogo = loadShape("amc.svg");
  amclogo.disableStyle();
  still = loadImage("image2.png");

  //color generator
  for (int i=0; i<numElements; i++)
  {
    int rx = int(random(still.width));
    int ry = int(random(still.height));
    colors[i] = still.get(rx, ry);
  }
}

void draw()
{
  background(bg);

  //color change timer
  if (millis() - prevMillis >= threshold)
  { 

    t+=50;
    prevMillis += threshold;

    for (int i=0; i<numElements; i++)
    {
      int rx = int(random(still.width));
      int ry = int(random(still.height));
      color c = still.get(rx, ry);
      colors[i] = c;
    }
  }

  //pattern background
  num=0;
  pushMatrix();
  for (int x=0; x<=width; x=x+115)
  {
    for (int y=0; y<=height; y=y+40)
    {   
      pushMatrix();   
      fill(colors[num%numElements]); // % will ensure it never goes over 50 (numElements), giving us an out of bounds error
      translate(x, y);                // in other words it will go: 0,1,2...49,50,0,1,2,3,...
      logo(5, 5);

      popMatrix();
      num++;
    }
  }
  popMatrix();

  bgFader(mouseX);
  logofade(mouseX);
  introFade();
}


//fade at the beginning
void introFade()
{
  pushMatrix();
  float fade = 0;
  time = time+1;
  fade = map(time, 0, 160, 255, 0);
  fill(bg, fade);
  rect(0, 0, width, height);
  popMatrix();
}

//logo abstraction background
void logo(float x, float y)
{
  shape(amclogo, x, y);
  fill(bg);
  rect(0, 38, 100, 20);
}

//logo reveal
void logofade(float mx)
{
  pushMatrix();
  translate(width/2-50, height/2-25);
  float m = map(mouseX, width, 200, 255, 0);
  lx += (m - lx) * c_ease;
  fill(lc, lx);
  shape(amclogo, 0, 0);
  popMatrix();
}

//ellipse fade
void bgFader(float mx)
{
  pushMatrix();
  float m2 = map(mouseX, 0, width, 0, 220);
  float spot = map(mouseX, 0, width, 0, 900);
  y += (m2 - y) * c_ease;
  x += (spot - x) * c_ease;
  fill(bg, y);
  ellipseMode(CENTER);
  ellipse( width/2, height/2, x, x);
  popMatrix();
}


//color generator on key press
/*
void keyPressed()
 {
 for (int i=0; i<numElements; i++)
 {
 
 int rx = int(random(still.width));
 int ry = int(random(still.height));
 color c = still.get(rx, ry);
 }
 }
 */

void mousePressed()
{
  color c = get(mouseX, mouseY);
  float r = red(c);
  float g = green(c);
  float b = blue(c);

  println(r + ", " + g + ", " + b);
}


