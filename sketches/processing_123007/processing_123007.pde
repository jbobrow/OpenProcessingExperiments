
int lastSecond;
int secondsElapsed = 0;
int dot = 0;

void setup()
{
  size(300, 1200, P3D);
  rectMode(CORNER);
}

void draw()
{
  lights();


  float sWidth= map(secondsElapsed, 0, 60, 0, 600);

  float sandHeight= map(secondsElapsed, 0, 60, 1200, 0);


  if (second() != lastSecond)
  {
    secondsElapsed++;
    lastSecond = second();

    dot += sandHeight/60;

    if (dot > sandHeight)
      dot = 0;

    if (sandHeight==0)
      secondsElapsed= 0;
  }

  background(85);
  fill(0);
  pushMatrix();
  translate(145, dot, 20);
  rotateY(0.5);
  fill(255);
  box(10, 10, 10);
popMatrix();
  noStroke();
  fill(255);
  rect(50, 0, 200, 1200);
  fill(0);
  rect(50, 0, 200, sandHeight);
}
