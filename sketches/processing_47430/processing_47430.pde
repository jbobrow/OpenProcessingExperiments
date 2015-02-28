
void setup()
{
  size(300, 300);
  noStroke();
  smooth();
}

void draw ()
{

  strokeWeight(1);

  for (int i = 0; i < width; i++) {
    float r = random(255);
    float x = random(0, width);
    stroke(r, 100);
    line(i, 0, x, height);
  }

  fill(255);
  ellipse(200, 150, 300, 300);


  fill(200);
  ellipse(90, 120, 40, 40);
  ellipse (200, 120, 40, 40);


  for (int i=0; i<width; i++)

  {
    float x = map( mouseX, 0, width, 85, 95 );
    float x2 = map( mouseX, 0, width, 195, 205 );

    fill(0);
    ellipse(x, 124, 20, 20);
    ellipse(x2, 124, 20, 20);
  }
}
