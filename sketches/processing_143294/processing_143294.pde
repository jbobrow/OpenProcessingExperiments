
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song YoungJun
// ID: 201420083

float angle;

void setup()
{
  size(600, 600);
  background(#325A7D);
}

void draw()
{
  background(0);
  noStroke(0);
  fill(255, 50);

  for (int i=0; i<width; i = i+10) {
    ellipse(i, i, 30, 30);
    ellipse(i, height-i, 30, 30);
    ellipse(width/2, i, 30, 30);
    ellipse(i, height/2, 30, 30);
    ellipse(width/2+i, i, 30, 30);
    ellipse(i, height/2+i, 30, 30);
    ellipse(width/2+i, height-i, 30, 30);
    ellipse(i, height/2-i, 30, 30);
    ellipse(0, i, 30, 30);
    ellipse(i, 0, 30, 30);
    ellipse(width, i, 30, 30);
    ellipse(i, height, 30, 30);
  }
}

