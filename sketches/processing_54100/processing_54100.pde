
color c1, c2, c3;

void setup()
{
  size(600, 400);
  smooth();
  c1=color(249, 249, 8);
  c2= color(11, 155, 89);
  c3= color(118, 192, 64);
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw()
{
  robot(0, 0, 67, 98, 24, 154, 8, 46, c1, 8, 9);
  robot(200, 0, 50, 110, 54, 80, 20, 65, c2, 22, 6);
  robot(400, 0, 80, 90, 8, 175, 4, 8, c3, 19, 52);
}


void robot(int x, int y, int bx, int by, int s, int t, int e, int m, color c, int a, int b)

//float bx body
//float by body
//float s body width
//float t is body height)
//float e feet height
//float m mouth
//float a ear width
//float b ear height

{
  pushMatrix();
  //Face
  //fill(c);
  translate(x, y);
  smooth();

  //face
  fill(255);
  rect(82, 111, 64, 80);


  fill(0);

  ellipse(68, 110, 11, 12);

  ellipse(96, 110, 18, 18);


  rect(81, 145, m, 6);
  fill(255);
  //Body
  rect(bx, 239, s, t);
  rect(by, 239, s, t);

  //Feet
  fill(c);
  rect(43, 333, 54, e);
  rect(115, 333, 54, e);

  //Ears
  fill(c);
  rect(38, 115, a, b);
  rect(126, 115, a, b);

  popMatrix();
}


