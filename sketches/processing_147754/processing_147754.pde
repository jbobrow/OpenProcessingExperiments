
// http://dianalange.tumblr.com/post/72549366477/dr-mitch-noisy-plates-generated-with

int centerRadius = 20, minRadius = 100, maxRadius = 300, amplitude = 20;
int noiseSeedNum = 10;
float maxAngleSteps = 1, noiseScale  = 40;

void setup ()
{
  size (700, 700);
  smooth();
  noLoop();
}

void draw ()
{
  background (247);
  noFill();

  translate (width/2, height/2);
  noiseSeed (noiseSeedNum);

  float angle = 0;


  while (angle <= 360)
  {

    strokeWeight ( random (0.25, 2));
    stroke (0, random (30, 80));

    beginShape();
    int finalRadius = (int) random (minRadius, maxRadius);

    drawNoise (0, centerRadius, finalRadius, amplitude, noiseScale);

    float rotateVal = random (maxAngleSteps);
    rotate (rotateVal);
    angle += rotateVal;
  }
}

void drawNoise (int startY, int startX, int endX, float amplitude, float noiseScale)
{
  beginShape();
  for (int i = startX; i < endX; i+= 2)
  {
    float noiseVal = startY+noise (i / noiseScale) * amplitude;

    vertex (i, noiseVal);
  }
  endShape();
}

void initWithRandomValues ()
{
  centerRadius = int (random (10, 200));
  maxRadius = int (random (300, width/2-10));
  minRadius = int (random (centerRadius, maxRadius));
  amplitude = int (random (10, 50));
  noiseSeedNum = int (random (100000000));
  maxAngleSteps = random (0.5, 4);
  noiseScale = random (10, 60);
}

void mousePressed ()
{
  initWithRandomValues();
  redraw();
}

void keyPressed ()
{
  if (key == ' ')
  {
    redraw();
  }

  if (key == 'n')
  {
    initWithRandomValues();
    redraw();
  }
}

