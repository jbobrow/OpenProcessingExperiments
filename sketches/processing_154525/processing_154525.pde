

float noiseScale = 80.0;
float startNoise = 0;

void setup() {
  size(600, 200);
  smooth();

  frameRate (30);
}


void draw()
{
  fill(#57385c, 120);
  noStroke();
  rect (0, 0, width, height);
  fill (#ffedbc);
  
  if (mousePressed && mouseButton == LEFT)
  {
    noiseScale = map (mouseX, 0, width, 1, 300);
  }
   else if (mousePressed && mouseButton == RIGHT)
  {
    startNoise = map (mouseX, 0, width, 0 / noiseScale, width/ noiseScale);
    
  }


  int x = 0;
  while (x < width)
  {
    float y = noise (startNoise + x / noiseScale);
    y = map (y, 0, 1, 50, 150);

    ellipse (x, y, 6, 6);

    x = x + 6;
  }
}

void keyPressed ()
{
  noiseSeed ( round (random (100000)));
}

