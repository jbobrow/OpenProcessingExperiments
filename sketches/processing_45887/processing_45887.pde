
float n = 0;
float o = 0;
float p = random(255);
float q = random(255);
int x = 0;

void setup()
{
  size(800, 800);
  colorMode(RGB, 255);
  background(255);
  smooth();
}

void draw() 
{
  strokeWeight(4);
  stroke(128*noise(p), 64+128*noise(q), 128, 128);
  line(x, (height/2)+(width/4)*noise(o), x, (height/3)+(width/4)*noise(n));
  
  n+=0.01;
  o+=0.005;
  p+=0.001;
  q+=0.001;
  x++;
  
  if (x>width)
  {
    x = 0;
    stroke(255, 32);
    fill(255, 32);
    rect(0, 0, width, height);
  }
}

