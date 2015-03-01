
void setup()
{
  size(500,500);
  ellipseMode(RADIUS);
  smooth();
  colorMode(HSB, 1);
}

void draw()
{
  float rad = width/2;
  background(0,0,0);

  pushMatrix();
  translate(width/2,height/2);
  rotate(-PI/2);
  float wedge = TWO_PI/59;
  noStroke();
  for (int i = 0; i < 60; ++i) {
    fill(i/60.0,1,1);
    float a = i*TWO_PI/60.0;
    pushMatrix();
    rotate(a);
    float x2 = cos(-wedge/2)*rad*.95;
    float y2 = sin(-wedge/2)*rad*.95;
    float x3 = cos(wedge/2)*rad*.95;
    float y3 = sin(wedge/2)*rad*.95;
    triangle(0,0,x2,y2,x3,y3);
    popMatrix();
  }
  popMatrix();  
  
  float as = map(second(),0,60,0,1); // angle of second hand, from 12
  float am = map(minute(),0,60,0,1); // angle of minute hand, from 12
  float ah = map(hour(),0,24,0,2); // angle of hour hand, from 12
  ah -= (int) ah;
  
  noStroke();
  fill(ah,1,1);
  ellipse(width/2,height/2,rad*.9,rad*.9);
  fill(am,1,1);
  ellipse(width/2,height/2,rad*.6,rad*.6);
  fill(as,1,1);
  ellipse(width/2,height/2,rad*.3,rad*.3);
}
