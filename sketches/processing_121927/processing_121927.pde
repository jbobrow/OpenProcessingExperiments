
void setup() 
{
  size(225, 230);
}

void draw()
{
  background(color(240, 248, 255));
  translate(width/2, height/2+20);

  // Clock markers
  drawMinutes();
  drawHours();
  drawQuarters();

  // Clock hands
  drawSecHand();
  drawMinHand();
  drawHourHand();

  // Clock center point
  noStroke();
  fill(153);
  ellipse(0, 0, 9, 9);

  drawTextTime();
}


void drawMinutes()
{
  for(int m = 1; m <= 60; m++)
  {
    pushMatrix();
    float angle = radians(map(m, 0, 60, 0, 360));
    rotate(angle);
    strokeCap(ROUND);
    stroke(150);
    strokeWeight(3);
    line(80, 0, 90, 0);
    popMatrix();
  }
}

void drawHours()
{
  for(int h = 1; h <= 12; h++)
  {
    pushMatrix();
    float angle = radians(map(h, 0, 12, 0, 360));
    rotate(angle);
    strokeCap(PROJECT);
    stroke(100);
    strokeWeight(5);
    line(80, 0, 90, 0);
    stroke(color(0, 200, 0));
    strokeWeight(3);
    line(80, 0, 90, 0);
    popMatrix();
  }
}

void drawQuarters()
{
  for(int q = 1; q <= 4; q++)
  {
    pushMatrix();
    float angle = radians(map(q, 0, 4, 0, 359));
    rotate(angle);
    strokeCap(ROUND);
    stroke(100);
    strokeWeight(9);
    line(80, 0, 90, 0);
    point(70, 0);
    stroke(color(255, 0, 0));
    strokeWeight(5);
    line(80, 0, 90, 0);
    point(70, 0);
    popMatrix();
  }
}

void drawSecHand()
{
  pushMatrix();
  float secs = radians(map(second(), 0, 60, -90, 270)); 
  rotate(secs);  
  line(0, 0, 60, 0);
  popMatrix();
}

void drawMinHand()
{
  pushMatrix();
  float mins = radians(map(minute(), 0, 60, -90, 270));
  rotate(mins);
  line(0, 0, 69, 0);
  popMatrix();
}

void drawHourHand()
{
  pushMatrix();
  float hours = radians(map(hour(), 0, 12, -90, 270));
  rotate(hours);
  line(0, 0, 45, 0);
  popMatrix();
}

void drawTextTime()
{
  textSize(24);
  fill(0, 102, 153);
  String time = (hour() + ":" + minute() + ":" + second());
  textAlign(CENTER);
  text(time, 0, -107);
}



