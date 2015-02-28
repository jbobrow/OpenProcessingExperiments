
void setup()
{
  size(500, 500);
  background(60, 33, 29);
}

void draw()

{
  for (int i = 0; i <5; i++)
  {
    for (int j = 0; j <5; j++)
    {
      face(i*100 - 50, j*100 - 50);
    }
  }
}



void face( int x, int y)

{
  stroke(60, 33, 29);
  fill(154, 82, 50);
  ellipse(x +75, y +100, 10, 10);
  ellipse(x + 125, y +100, 10, 10);
  ellipse(x +100, y +100, 50, 45);
  rect(x +78, y +95, 16, 10);
  rect(x +106, y +95, 16, 10);
  ellipse(x +86, y +100, 2, 3);
  ellipse(x +114, y +100, 2, 3);
  ellipse(x +100, y +105, 5, 3);
  line(x +98, y +115, x +102, y +115);
  beginShape();
  vertex(x +115, y +80);
  vertex(x +112, y +75);
  vertex(x +112, y +79);
  vertex(x +100, y +75);
  vertex(x +87.5, y +78);
  vertex(x +78, y +85);
  vertex(x +73, y +95);
  vertex(x +95, y +92);
  vertex(x +114, y +85);
  vertex(x +125, y +95);
  vertex(x +122, y +92);
  vertex(x +115, y +80);
  endShape();
}



