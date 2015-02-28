
void setup()
{
  size(300, 300);

  faceDrawing(50, 50);
  faceDrawing(150, 50);
}

void faceDrawing(float a, float b)
{
  fill(#FAE7A4);

  ellipse(a, b, 90, 100);
  pushStyle();
  noStroke();
  fill(50, 200, 50);
  ellipse(a-20, b, 8, 10);
  ellipse(a+20, b, 8, 10);
  popStyle();

  pushStyle();
  noFill();
  strokeWeight(5);
  ellipse(a-25, b, 30, 30);
  ellipse(a+25, b, 30, 30);

  arc(a, b, 20, 10, PI, 2*PI);
  strokeWeight(10);
  stroke(200, 0, 0, 100);
  line(a-30, b+15, a-20, b+15);
  line(a+30, b+15, a+20, b+15);
  popStyle();

  line(a, b+5, a, b+10);

  noFill();
  arc(a, b+20, 40, 30, 0, PI);
}


