
float counter = 0;

void setup()
{
  size(600, 400);
  colorMode(HSB, 360, 100, 100);
  background(281, 34, 87);
}

void draw()
{
  background(281, 34, 87);

  translate(width/2, height/2);

  //Körper
  fill(281, 0, 88);
  noStroke();
  ellipse(0, 0, 200, 200);

  //Mund
  fill(360, 100, 0);
  noStroke();
  ellipse(0, 20, 75, 55);
  fill(281, 0, 88);
  noStroke();
  ellipse(0, 10, 85, 55);

  //Augen + Nase
  fill(360, 100, 0);
  noStroke();
  ellipse(-30, -10, 20, 20);
  ellipse(30, -10, 20, 20);
  ellipse(0, 10, 5, 5);

  float a = map(sin(counter), 1, -1, 30, 100);
  float counter_Mouse = map(mouseX, 0, width, 0.02, 0.06);

  //Hände + Beine
  pushMatrix();
  translate(sin(counter)*120, cos(counter)*120);   
  fill(a, 100, 100);
  ellipse(0, 0, 40, 40);
  popMatrix();

  pushMatrix();
  translate(-sin(counter)*120, -cos(counter)*120);   
  fill (a, 100, 100);
  ellipse(0, 0, 40, 40);
  popMatrix();

  pushMatrix();
  translate(-sin(counter)*120, -cos(counter)*-120);   
  fill (a, 100, 100);
  ellipse(0, 0, 40, 40);
  popMatrix();

  pushMatrix();
  translate(-sin(counter)*-120, cos(counter)*-120);   
  fill (a, 100, 100);
  ellipse(0, 0, 40, 40);
  popMatrix();

  counter += counter_Mouse;
}
