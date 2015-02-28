
//William T, Function and Animation, CP1 mods 14-15
float stretch = 10;
float one = 1;
float upwards = 60;
void setup()
{
  size(500, 400);
  smooth();
  frameRate(250);
}
void draw()
{

  background(0);
  arm();
  if (stretch > 100)
  {
    Falcon();
    text("FALCON PUNCH",230,100);
    textSize(30);
  }
}
void arm()
{
  stroke(0);
  fill(117, 36, 224);
  rect(-10, 250 - upwards, 160, 50);
  fill(255, 0, 0);
  rect(stretch - 10, 247.5 - upwards, 130, 55);
  fill(255);
  ellipse(135 + stretch, 270 - upwards, 50, 75);
  line(145 + stretch, 245 - upwards, 160 + stretch, 245 - upwards);
  line(148 + stretch, 260 - upwards, 160 + stretch, 260 - upwards);
  line(148 + stretch, 270 - upwards, 160 + stretch, 270 - upwards);
  line(147 + stretch, 285 - upwards, 160 + stretch, 285 - upwards);
  stretch = stretch + one;
  if (stretch > 125)
  {
    one = -1;
  }
  if (stretch < 0)
  {
    one = 1;
  }
}

void Falcon()
{
  stroke(255, 28, 5);
  strokeWeight(2);
  fill(252, 163, 46);
  beginShape();
  vertex(130, 110);
  vertex(350, 125);
  vertex(290, 150);
  vertex(290, 175);
  vertex(300, 175);
  curveVertex(300, 175);
  curveVertex(300, 175);
  curveVertex(320, 170);
  curveVertex(337, 182);
  curveVertex(337, 182);
  vertex(337, 182);
  vertex(337, 187);
  curveVertex(337, 182);
  curveVertex(337, 182);
  curveVertex(315, 186);
  curveVertex(300, 190);
  curveVertex(280, 200);
  curveVertex(250, 220);
  curveVertex(250, 220);
  vertex(250, 220);
  vertex(250, 240);
  vertex(255, 250);
  vertex(250, 255);
  vertex(252, 250);
  vertex(245, 245);
  vertex(245, 255);
  vertex(240, 255);
  vertex(240, 230);
  curveVertex(240, 230);
  curveVertex(240, 230);
  curveVertex(220, 200);
  curveVertex(160, 180);
  curveVertex(160, 180);
  vertex(220, 170);
  vertex(150, 160);
  vertex(210, 150);
  vertex(140, 140);
  vertex(200, 130);
  endShape(CLOSE);
}


