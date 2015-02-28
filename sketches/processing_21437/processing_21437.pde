
void setup()
{
  size(500, 100);
  background(255);
  for (int i = 10; i < 450; i = i + 30)
  {
    wave(i, 10);
  }
}

void wave(int x, int y)
{
  pushMatrix();
  translate(x, y);
  stroke(0);
  strokeWeight(2);
  fill(20, 165, 183);
  beginShape();
  vertex(10, 60);
  vertex(40, 60);
  bezierVertex(40, 60, 20, 50, 30, 30);
  bezierVertex(30, 30, 10, 32, 10, 60);
  endShape();
  //ellipse
  stroke(1.5);
  strokeWeight(2);
  fill(250, 114, 23);
  triangle(15, 56, 20, 47, 28, 56);
  popMatrix();
}


