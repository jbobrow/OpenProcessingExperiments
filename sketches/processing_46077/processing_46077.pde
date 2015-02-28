
//Author: Liliam Rodas
//Purpose: Homework to generate a view of spring. 
// The art work is based in 2D noise with 3D view that generates flower and grass patterns.
//Functioning: Movement of flowers trought grass and their changing behaviour when mouse clicked.
//Reference: previous excercises provided in class and processing.


float xstart, xnoise, ystart, ynoise;
float xstartNoise, ystartNoise;


void setup() {
  size(300, 500, P3D);
  background(5, 59, 7);
  xstart = random(10);
  ystart = random(10);
}


void draw() {

  background(5, 59, 7);

  rotateX(radians(45));
 

  xstartNoise += 0.01;
  ystartNoise += 0.01;
  xstart +=(noise(xstartNoise) * 0.5) - 0.25;  // varies by +/- 0.25 every frame
  ystart +=(noise(ystartNoise) * 0.5) - 0.25;

  xnoise = xstart;
  ynoise = ystart;

  for (int y =0; y <= height; y+=5) {
    ynoise += 0.5;
    xnoise = xstart;

    fill (6, 160, 12);
    noStroke ();

    for (int x = 0; x <= width; x+=4) {
      xnoise += 0.1;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}

void drawPoint(float x, float y, float noiseFactor) {

  pushMatrix();
  translate(x, y);
  rotate(noiseFactor * radians(180));
  float edgeSize = noiseFactor * 20;
 
  noStroke();
  fill(6, 160, 12, 100);
  ellipse (0, 0, edgeSize, edgeSize/2);

  if (mousePressed) {

    beginShape ();

    fill(250, random (24, 220), 7, 100);

    curveVertex (5, 5);
    curveVertex (5, 5);

    curveVertex (random (20), random (20));

    curveVertex (edgeSize-1, (edgeSize/2)-5);
    curveVertex (edgeSize-1, (edgeSize/2)-5);

    endShape ();
  }

  else {
    noStroke ();
    fill(216, random (24, 220), 7);
    ellipse(10, 10, edgeSize-10, (edgeSize/2)-10);
  }

  popMatrix();
}


