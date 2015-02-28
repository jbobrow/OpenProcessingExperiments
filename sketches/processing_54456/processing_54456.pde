
//Problem Set 2.4 by Nathan Smofsky
//Using a boolean value to signal when two rectangles overlap

float x1;
float y1;
float height_1 = 150;
float width_1 = 250;

float x2;
float y2;
float height_2 = 50;
float width_2 = 75;
//-------------------------------------------------------

void setup() {
  size(500, 500);
  noStroke();
  smooth();
}
//-------------------------------------------------------

void draw () {
  background(100);
  x1=125;
  y1=125;
  x2=mouseX;
  y2=mouseY;

  rect(x1, y1, width_1, height_1);
  rect(x2, y2, width_2, height_2);
  //--------------------------------------------------------

  if (overlap(x1, y1, width_1, height_1, x2, y2, width_2, height_2) ) {
    fill(255);
  }
  else {
    fill(0);
  }
}
//--------------------------------------------------------

boolean overlap(float x1, float y1, float width_1, float height_1, float x2, float y2, float width_2, float height_2)
{
  if (x1 > x2+width_2 || x1+width_1 < x2 || y1 > y2+height_2 || y1+height_1 < y2) {
    return false;
  } 
  else {
    return true;
  }
}


