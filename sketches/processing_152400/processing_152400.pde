
/*
Quelle:
 Noisy Plates von Michael Roderfeld
 http://dianalange.tumblr.com/post/72549366477/dr-mitch-noisy-plates-generated-with
 bzw.
 http://www.mroderfeld.de/
 */

int linesLength;
float amplitude = 90;
float timeSteps = 0.10;
int randomSeedNum = 0;

void setup ()
{
  size (700, 700);
  smooth();

  linesLength = int (width * 0.99);
}

void draw ()
{
 
    background (255,248,180);

  randomSeed (randomSeedNum);

  translate (width/4, height/4);
  fill (100);
  stroke (255);
  strokeWeight (4);

  rotateNoisyLines();
}

void setRandomValues ()
{
  randomSeedNum = frameCount;

  amplitude = random (10, 100);
  timeSteps = random (0.0005, 0.2);
}

void rotateNoisyLines ()
{
  float angleCount = 0;

  float angle = 0;

  while (angleCount < 360)
  {
    angle = random (1, 6);
    rotate (radians (angle));
    drawNoisyLine();
    angleCount = angleCount + angle;
  }
}

void drawNoisyLine ()
{
  int count = 0;
  float time = 0.0;
  float y = 0;

  beginShape();
  while (count < linesLength)
  {
    y = noise (time)*amplitude;
    vertex (count, y);

    time = time + timeSteps;
    count = count + 9;
  }
  endShape();
}
 /////





void keyPressed ()
{
  if (key == ' ') 
  {
    setRandomValues ();
  }
  
  if (key == '+') 
  {
    randomSeedNum = randomSeedNum + 5;
  }
  
  if (key == '-') 
  {
    randomSeedNum = randomSeedNum - 4;
  }
  
  if (key == 'm')
  {
   amplitude = amplitude + 4; 
  }
  if (key == 'n')
  {
   amplitude = amplitude - 4; 
  }
  
  if (key == 'k')
  {
    timeSteps = timeSteps + 0.002;
  }
  if (key == 'j')
  {
    timeSteps = timeSteps - 0.002;
  }
  
  
  
  
  ////////////////
}


//////




