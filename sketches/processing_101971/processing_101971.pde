
// float t = 0;
float x_temp = 0;
float y_temp = 0;
float x = 0;
float y = 0;
float ang = 0;
float amp = 0;
float lad = 0;


void setup()
{
  size(480, 480);
  background(0);
  smooth();
  rectMode(CENTER);
}


void draw()
{
  background(0);
  translate(60, 60);
  for (int i=0; i<400; i=i+60)
  {
    for (int j=0; j<400; j=j+60)
    {
      noStroke();
      float far1 = map(i, 0, 200, 0, 255);
      float far2 = map(j, 0, 200, 0, 255);
      ang = map(dist(i, j, mouseX, mouseY), 0, 200, 0, PI/2);
      lad = 30;
      pushMatrix();
      translate(i, j);
      rotate(ang);
      amp=amp-(ang*radians(0.01));
      fill (far1, far2, 0, 100);
      rect(0, 0, 2*lad+40, lad);
      rect(0, 0, 2*lad+20, lad);
      rect(0, 0, 2*lad, lad);
      fill (0, 0, 0, 255);
      ellipse(0, 0, (j+20)/20, (j+20)/20);
      popMatrix();
    }
  }
}
