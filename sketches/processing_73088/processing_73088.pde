
//cole Pierce CP1 mods 4-5
int a=0;
int b=0;
int c=0;
int d=200;
int e=200;
int f=0;
int g=0;
int h=0;
int i=0;
int j=0;
int k=0;
float x=0;
float y=0;
void setup()
{
  size(500, 500, P3D);
}
void draw()
{
    background(255-b, 255-c, 255-a);
  camera(-300-mouseX*4, -300-mouseY*4, 200, 0, 0, 0, 0, 1, 0);
  frameRate(30);
  lights();


  rotateX(y);
  rotateY(x);
  translate(d, e);
  fill(a, b, c);
  box(f/4);

  rotateX(y);
  rotateY(x);
  translate(150+d, 150+e);
  fill(c, a, b);
  box(f/3);
  
  rotateX(y);
  rotateY(x);
  translate(150-d, 150-e);
  fill(b, c, a);
  box(f/2);

  rotateX(y);
  rotateY(x);
  translate(-d, -e);
  fill(g, h, i);
  sphere(f/4);

  rotateX(y);
  rotateY(x);
  translate(d, e);
  fill(h, i, g);
  sphere(f/3);
  
  rotateX(y);
  rotateY(x);
  translate(200-d, 200-e);
  fill(g, i, h);
  sphere(f/5);

  d=d+int(random(-5, 5));
  e=e+int(random(-5, 5));
  x=x+random(.1);
  y=y+random(.1);
  f=f+int(random(-15, 20));
 
}

void mouseClicked()
{
  a=int(random(255));
  b=int(random(255));
  c=int(random(255));
  g=int(random(255));
  h=int(random(255));
  i=int(random(255));
}
void keyPressed()
{
  a=0;
  b=0;
  c=0;
  d=200;
  e=200;
  f=0;
  g=0;
  h=0;
  i=0;
  x=0;
  y=0;
}

