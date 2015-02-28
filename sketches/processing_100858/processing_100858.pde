
/**
 * sketch:  PG_Clock1
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. sin() and cos() values
 * are used to set the position of the hands.
 */
 
int cx, cy, radius;
//----------------------------------------------------------
void setup() 
{
  size(360, 349);
  background(111,44,44);
  frameRate(20);  
}
//----------------------------------------------------------
void pointer(int sw, float value, float len, color col)
{
  stroke(col);
  strokeWeight(sw);
  cx = width / 2;
  cy = height / 2;
  line(cx, cy, cx + cos(value) * radius * len
             , cy + sin(value) * radius * len);
}
//----------------------------------------------------------
void draw() 
{
  copy(0, 0, width, height, 1, 1, width-3, height-3);
  noStroke();
  fill(0, 8);
  rect (1,1,width-3, height-3);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // redraw background
  if (second() == 0) background(111,44,44);
  
  // Draw the hands of the clock
  radius = min(width, height) / 2;
  pointer(6, h, 0.50, color(88,88,255));
  pointer(4, m, 0.55, color(88,255,88));
  pointer(2, s, 0.60, color(255,88,88));

  // Draw the minute ticks
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    strokeWeight(4);
    stroke(255,255,44);
    float angle = radians(a);
    float x = cx + cos(angle) * radius * 0.8;
    float y = cy + sin(angle) * radius * 0.8;
    vertex(x,y);
    if ((a % 90) == 0 ) 
    {  stroke(111,44,111);
       strokeWeight(8);
       vertex(x,y);
    }
  }
  endShape();
}

