
//Lisa L, Function and Animation, CP1 Mods 16/17

int swim = 0;
void setup()
{
  size(500, 500);
  background(87, 155, 222);
  smooth();
}
void draw()
{
  fish();
  seaweed();
}
void seaweed()
{
  stroke(54, 180, 46);
  fill(54, 180, 46);
  beginShape();
  curveVertex(90, 500);
  curveVertex(90, 500);
  curveVertex(80, 480);
  curveVertex(100, 420);
  curveVertex(80, 360);
  curveVertex(100, 330);
  curveVertex(80, 270);
  curveVertex(105, 230);
  curveVertex(100, 270);
  curveVertex(120, 330);
  curveVertex(110, 360);
  curveVertex(120, 420);
  curveVertex(115, 500);
  curveVertex(115, 500);
  endShape();

  beginShape();
  curveVertex(380, 500);
  curveVertex(380, 500);
  curveVertex(400, 420);
  curveVertex(380, 360);
  curveVertex(400, 330);
  curveVertex(395, 270);
  curveVertex(405, 230);
  curveVertex(425, 270);
  curveVertex(420, 330);
  curveVertex(410, 360);
  curveVertex(420, 420);
  curveVertex(415, 500);
  curveVertex(415, 500);
  endShape();
}
void fish()
{
  if (swim < 551)
  { 
    noStroke();
    fill(87, 155, 222);
    rect(0,200,500,100);
    stroke(240, 164, 0);
    fill(240, 164, 0);
    ellipse(swim, 250, 60, 45);
    triangle(swim - 28,250,swim - 50,230, swim - 50, 270);
    noStroke();
    fill(255);
    ellipse(swim + 12,245,10,10);
    stroke(0);
    fill(0);
    ellipse(swim + 13,246,5,5);
    line(swim + 5,242,swim + 12,239);
    line(swim + 14,258,swim + 21,258);
    swim = swim + 5;
    if (swim > 550)
    {
      swim = 0;
    }
    frameRate(25);
  }
}
