
import processing.pdf.*;

PVector [] loc = new PVector [300];
PVector [] dir = new PVector [300];
float [] s = new float [300];

float noiseScale = 80;
float noiseStength = 1;


boolean savePDF = false;
int pdfCounter = 0;
int pdfRecordingLength = 200;

void setup ()
{
  size (600, 600);
  smooth();
  frameRate (30);

  initVariables();
  background (#57385c);
}

void draw ()
{
  //  background (255);


  fill (#ffedbc);
  noStroke();
  stroke (#A75265, 120);

  int i = 0;
  while (i < s.length)
  {
    moveBall(loc [i], dir [i], s [i]);
    checkEdges (loc [i], dir [i]);
    drawBall( loc [i]);
    i = i + 1;
  }

  if (savePDF)
  {
    pdfCounter = pdfCounter + 1;
    println ("recording pdf " +  pdfCounter + " of " + pdfRecordingLength + " frames");

    if (pdfCounter == pdfRecordingLength)
    {
      savePDF = false;
      endRecord();
      println ("done recording");
    }
  }
}

void checkEdges (PVector location, PVector direction)
{
  int outter = 10;
  if (location.x < -outter)
  {
    location.x = random (-outter, width+outter);
    location.y = random (-outter, height+outter);
  }
  if (location.x > width+outter)
  {
    location.x = random (-outter, width+outter);
    location.y = random (-outter, height+outter);
  }

  if (location.y < -outter)
  {
    location.x = random (-outter, width+outter);
    location.y = random (-outter, height+outter);
  }
  if (location.y > height+outter)
  {
    location.x = random (-outter, width+outter);
    location.y = random (-outter, height+outter);
  }
}

void moveBall (PVector location, PVector direction, float speed)
{

  float angle = noise (location.x / noiseScale, location.y / noiseScale, frameCount / noiseScale) * TWO_PI * noiseStength;
  direction.x = cos (angle);
  direction.y = sin (angle);


  PVector velocity = direction.get(); // kopiert direction
  velocity.mult (speed);
  location.add (velocity);
}

void drawBall (PVector location)
{
  ellipse (location.x, location.y, location.z, location.z);
}

void initVariables ()
{
  int i = 0;
  while (i < s.length)
  {
    PVector location = new PVector (random (width), random (height), random (2, 8));

    float angle = random (TWO_PI);
    PVector direction = new PVector (cos (angle) * 1, sin (angle) * 1);

    float speed = random (1, 3);

    loc [i] = location;
    dir [i] = direction;
    s[i] = speed;

    i = i + 1;
  }
}

void mousePressed ()
{
  noiseScale = random (10, 200);
  noiseStength = random (0.3, 10);
  initVariables ();
}

void keyPressed ()
{
  if (key == 's')
  {
    noiseScale = random (10, 200);
    noiseStength = random (0.3, 10);
    initVariables ();

    savePDF = true;
    pdfCounter = 0;
    beginRecord (PDF, "PDF/" + timestamp () + ".pdf");
    background (#57385c);
    println ("started PDF recording");
  }
}

String timestamp ()
{
  return (nf (year(), 4) + nf (month(), 2) + nf (day(), 2) + "_" + nf (hour(), 2) + nf (minute(), 2) + nf (second(), 2));
}

