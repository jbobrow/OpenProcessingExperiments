
float w = 140, h = 65, d = 90, border = 10, nHeight = 30, def = 3;
final static int FRONT = 0, SIDE = 1, TOPP = 2;
PVector nRoot = new PVector(random(123), random(123), random(123));
PVector nSpeed = new PVector(random(-.1, .1), random(-.1, .1), random(-.1, .1));

void setup()
{
  size(350, 300, OPENGL);
  stroke(0, 150);
}

void draw()
{
  background(220);
  translate(width/2, height/2);
  rotateX(map(mouseY, 0, height, PI, -PI));
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  nRoot.add(nSpeed);
  display(FRONT);
  display(SIDE);
  display(TOPP);
}

void display(int p_face)
{
  float n, a = 0, b = 0, c = 0, i, j;
  pushMatrix();
  switch(p_face)
  {
  case FRONT:
    a = w;
    b = h;
    c = d;
    break;
  case SIDE:
    a = d;
    b = h;
    c = w;
    rotateY(HALF_PI);
    break;
  case TOPP:
    a = w;
    b = d;
    c = h;
    rotateX(HALF_PI);
    break;
  }
  for (i = -a/2; i < a/2; i+=def)
  {
    for (j = -b/2; j < b/2; j+=def)
    {
      n = noise(nRoot.x+i/100, nRoot.y+j/100, nRoot.z-c/2) - .5;

      if (abs(i) > a/2 - border)
      {
        n *= map(abs(i), a/2 - border, a/2, 1, 0);
      }
      if (abs(j) < b/2 - border)
      {
        n *= map(abs(j), b/2 - border, b/2, 1, 0);
      }

      point(i, j, c/2 + n*nHeight);
      point(i, j, -c/2 - n*nHeight);
    }
  }
  popMatrix();
}



