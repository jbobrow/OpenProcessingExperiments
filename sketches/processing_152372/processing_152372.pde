
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *adapted by Kim Vickery
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */


float[] x;      // current drawing position
float[] y;
float[] dx;    // change in position at each frame
float[] dy;
float[] bx;
float[] by;
float[] ang;
float[] ang_ch;
int num = int(random (8,12));        // number of tops
int frwidth  =500;
int frheight =500;
int green = 128;
int blue  = 128;
int red   =128;
boolean fadeToGreen = true;
boolean fadeToRed = true;
float fadeColorSpeed = 2;

void setup() {
  size(500, 500);
  
  x= new float [num];
  y= new float [num];
  dx  = new float [num];
  dy= new float [num];
  ang = new float[num];
  ang_ch = new float[num];
  bx= new float [num];
  by= new float [num];

  for (int i=0; i<num; i++) { 
    // initial position in the screen
    x[i] = random(frwidth);
    y[i] = random(frheight);
    // dx and dy are the small change in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    ang[i] = random(360);
    ang_ch[i] = random(-0.1, 0.1);
    background(0);
  }
} 
void draw() {
  for (int i=0; i<num; i++) { 

    float rad = radians(frameCount);

    // calculate new position
    x[i] += dx[i];
    y[i] += dy[i];
    ang[i] += ang_ch[i];
    float max = 1;
    float min = -1;

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (x[i] > frwidth-100 || x[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(min, max) : random(min, max);
    }

    if (y[i] > frheight-100 || y[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(min, max) : random(min, max);
    }

    bx[i] = x[i] + 100 * sin(radians(ang[i]));
    by[i] = y[i] + 100 * cos(radians(ang[i]));

    float radius = 100*sin(rad*0.1);
    float handX  = bx[i] + radius * sin(rad*3);
    float handY  = by[i] + radius * cos(rad*3);

    // if number one line then blue-green, if number2 line then red-purple
if ((i%2)==0){ //even case for i
    if (fadeToGreen)
    {
      green = (int)(green + fadeColorSpeed);
      blue  = (int)(blue  - fadeColorSpeed);
    } else
    {
      green = (int)(green - fadeColorSpeed);
      blue  = (int)(blue  + fadeColorSpeed);
    }

    // maximum green
    if (green >= 255) { 
      fadeToGreen = false;
    }
    if (green <= 0)
    {
      fadeToGreen = true;
    }
   
    stroke( 0, green, blue,10);
    strokeWeight(1);
    line(x[i], y[i], handX, handY);
}
if ((i%2)!=0){//odd
    if (fadeToRed)
    {
      red = (int)(red + fadeColorSpeed);
    } else
    {
      red = (int)(red - fadeColorSpeed);
    }

    // maximum red
    if (red >= 255) { 
      fadeToRed = false;
    }
    if (red <= 0)
    {
      fadeToRed = true;
    }

    stroke( red, 0, blue,10);
    strokeWeight(1);
    line( x[i], y[i], handX, handY );
    
  }
}
}




