


PImage img;
float xoff = 0.0;
float yoff = 0.0;
float x = 0;
float y = 0;
int ag = 0;
boolean apple = true;
int al = 0;

void setup() {
  colorMode(HSB, 360, 100, 100); 
  size(700, 700);
  img = loadImage("poker.png");
  background(100, 100, 18);
  image(img, 0, 0);
  //imageMode(CENTER);
}

void draw()
{
  if (apple == true)
  {
    al++;
  }
  else
  {
    al--;
  }
  if (al == 90)
  {
    apple = false;
  }



  if (x>=52)
  {
    x *= -1;
  }
  if (y  <= -2 && y<4)
  {
    y *= -1;
  }

  ag++;
  translate(width/2, height/2); 
  xoff = xoff + .01;
  yoff = yoff + .0005;
  float nx = noise(xoff)*242 ;
  float ny = noise(yoff)*random(-5, 5);
  rotate(ag);

  tint(255, al);
  x+=nx;
  y+=ny;

  image(img, x, y, 80, 110);
  frameRate(16);
}



