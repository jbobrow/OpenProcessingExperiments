
//Lawrence Jiang, Computer Prog Block 6, Rotating Cubes
//hold mouse to change color, press space to clear page

float x = 0;
float y = 0;
float s = 10;
float changes = 1;
float changec = 1;
float changeb = 1;
float b=255;

void setup()
{
  size(800, 600, P3D);
  smooth();
  background(0);
}

void draw()
{
 
  
  fill(b);
  translate(mouseX, mouseY, 0);
  strokeWeight(5);
  stroke(255-b);
  rotateX(x);
  x = x + .1;
  rotateY(y);
  y=y + .1;
  if (mousePressed==true)
  {
    b=b-changeb;
  }
  if (b<0)
  {
    changeb = -1;
  }
  if (b>255)
  {
    changeb = 1;
  }

  box(s);
  s = s + changes;
  if (s>200)
  {
    changes = -1;
  }
  if (s<0)
  {
    changes = 1;
  }
}

void keyPressed()
{
   float c4= int(random(0, 255));
  float c5= int(random(0, 255));
  float c6= int(random(0, 255));
  if (key==' ')
  {
    background(c4, c5, c6);
  }
}
