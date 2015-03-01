
/**
 * My Process0
 *
 * By Juan Sebastian Robles Jimenez
 *
 * My own interpretation of Process0
 * 's' Saves the actual frame.
 * '+' Increases the "alpha" of the background.
 * '-' Decreases the "alpha" of the background.
 * 
 * Try changing the transparency levels to see what happens...
*/


int nCircles = 200;

// Elements' attribute
float posX[];
float posY[];
float vX[];
float vY[];
float r[];

// Surface attributes
int x1, y1, w, h;

// gray level
int gray, currGray;

// "blendness factor"
int blendF;

void setup()
{
  size(1000, 800);
  gray = 255;
  currGray = -1;
  
  // Surface initialization
  x1 = 20;
  y1 = 20;
  w = width - 40;
  h = height - 40;
  
  // Elements' initialization
  posX = new float[nCircles];
  posY = new float[nCircles];
  vX = new float[nCircles];
  vY = new float[nCircles];
  r = new float[nCircles];
  
  for (int i = 0; i < nCircles; ++i) {
    posX[i] = random(60, width - 60);
    posY[i] = random(60, height - 60);
    vX[i] = random(-10, 10);
    vY[i] = random(-10, 10);
    r[i] = random(10, 50);
  }
  
  // Blend factor
  blendF = 5;
  
  frameRate(60);
  blendMode(BLEND);
}

void draw()
{
  fill(gray, blendF);
  rect(0, 0, width, height);
  noFill();
  stroke(0);
  rect(x1, y1, w, h);

  // Evaluating and drawing circles
  for (int i = 0; i < nCircles; ++i) {
    drawCircle(posX[i], posY[i], r[i]);
    for (int j = i + 1; j < nCircles; ++j) {
      // If a pair intersects draw a line
      if (dist(posX[i], posY[i], posX[j], posY[j]) < (r[i] + r[j]) / 2) {
        stroke(i % 2 == 0 ? 255 : 0, 0, i % 2 != 0 ? 255 : 0);
        line(posX[i], posY[i], posX[j], posY[j]);
      }
    }
    
    // Adjust spped to constrain surface
    if ((posX[i] + (r[i] / 2) >= (x1 + w) || posX[i] - (r[i] / 2) <= x1)) {
      vX[i] *= -1;
    }
    
    if ((posY[i] + (r[i] / 2) >= (y1 + h) || posY[i] - (r[i] / 2) <= y1)) {
      vY[i] *= -1;
    }
    
    // Apply speed
    posX[i] += vX[i];
    posY[i] += vY[i];
  }   
  
  // Iterate gray values for background
  currGray *= frameCount % 255 == 0 ? -1 : 1;
  gray += currGray;
}

void drawCircle(float x, float y, float r)
{
  stroke(0);
  point(x, y);
  ellipse(x, y, r, r);  
}

void keyPressed()
{
  switch (key) {
    case 's':
      saveFrame("process0.jpg");
    break;
    case '+':
      ++blendF;
    break;
    case '-':
      --blendF;
    break;
  }
}
