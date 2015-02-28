
/**
 * Clock. 
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. In this example, sin() and cos() values
 * are used to set the position of the hands.
 */

void setup() {
  size(240, 240);
  stroke(255);
  smooth();
}

void draw() 
{
  // the time scale
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI* 2) - HALF_PI;

  // decide the background, if the time is am, than the background is bright; if not, the background is dark.
  if (h<(HALF_PI*3) && (-h)<HALF_PI)
  {
    background(255,250,205);
    fill(175,225,mouseX*3);
    noStroke();
    // draw the 12 hour scale
    strokeWeight(2);
    for (int a = 0; a < 360; a+=6) {
      float x = 120 + ( cos(radians(a*5)) * 72 );
      float y = 120 + ( sin(radians(a*5)) * 72 );
      ellipse(x, y,10,10);
    }

    // draw the two eyes
    strokeWeight(3);
    fill(255,106,106);
    ellipse (120+cos(radians(24*5)) * 72, 120+sin(radians(24*5)) * 72,30,30);
    ellipse (120+cos(radians(12*5)) * 72, 120+sin(radians(12*5)) * 72,30,30);

    //the ture time
    stroke(139,126,102);
    strokeWeight(1);
    ellipse (cos(s) * 25+120 , sin(s) * 25+120,6,6);
    strokeWeight(2);
    ellipse (cos(m) * 37 + 120, sin(m) *37 + 120,8,8);
    strokeWeight(4);
    ellipse(cos(h) * 50 + 120, sin(h) * 50 + 120,10,10);

    // Draw the 12 hour ticks
    strokeWeight(2);
    for (int a = 0; a < 360; a+=6) {
      float x = 120 + ( cos(radians(a*5)) * 72 );
      float y = 120 + ( sin(radians(a*5)) * 72 );
      point(x, y);
    }
  }    

  else {
    // decide the background, if the time is am, than the background is bright; if not, the background is dark.
    background(139,137,112);
    fill(80,mouseX*3,mouseX);
    noStroke();
    // draw the 12 hour scale
    strokeWeight(2);
    for (int a = 0; a < 360; a+=6) {
      float x = 120 + ( cos(radians(a*5)) * 72 );
      float y = 120 + ( sin(radians(a*5)) * 72 );
      ellipse(x, y,10,10);
    }  
    // draw the two eyes
    strokeWeight(3);
    fill(255,30,30);
    ellipse (120+cos(radians(24*5)) * 72, 120+sin(radians(24*5)) * 72,30,30);
    ellipse (120+cos(radians(12*5)) * 72, 120+sin(radians(12*5)) * 72,30,30);
    //the ture time
    stroke(255);
    strokeWeight(1);
    ellipse (cos(s) * 25+120 , sin(s) * 25+120,6,6);
    strokeWeight(2);
    ellipse (cos(m) * 37 + 120, sin(m) *37 + 120,8,8);
    strokeWeight(4);
    ellipse(cos(h) * 50 + 120, sin(h) * 50 + 120,10,10);
    // Draw the 12 hour  ticks
    strokeWeight(2);
    for (int a = 0; a < 360; a+=6) {
      float x = 120 + ( cos(radians(a*5)) * 72 );
      float y = 120 + ( sin(radians(a*5)) * 72 );
      point(x, y);
    }
  }
}



