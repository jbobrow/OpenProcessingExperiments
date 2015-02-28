
/**
 * Color Circles - How to play:
 *   Press 'k' to set the circles in black color;
 *   Press 'w' to set the circles in white color;
 *   Press 'r' to change the red level of circles;
 *   Press 'g' to change the green level of circles;
 *   Press 'b' to change the blue level of circles;
 *   Press 's' to stop the animation;
 *
 *   Enjoy it! ;)
 */


/** Coords to draw */
float x;
float y;

float esize;

/** Colors of the draw */
float redLevel;
float greenLevel;
float blueLevel;
int levelAlpha;

boolean stop;

void setup() {
  size(400, 400);
  background(0);
  
  // Inits
  redLevel = 255;
  greenLevel = 255;
  blueLevel = 255;
  
  stop = false;
  
  smooth();
}


void draw() {
  if (!stop) {
  x = random(width);
  y = random(height);
  esize = random(40, 70);
  
  levelAlpha = ceil(random(150, 250));
  
  noStroke();
  fill (redLevel, greenLevel, blueLevel, levelAlpha);
  
  ellipse(x, y, esize, esize);
  }
}


void keyPressed() {
  if (keyCode == 'R' || keyCode == 'r') {
    redLevel = ceil(random(255));
  } else if (keyCode == 'G' || keyCode == 'g') {
    greenLevel = ceil(random(255));
  } else if (keyCode == 'B' || keyCode == 'b') {
    blueLevel = ceil(random(255));
  } else if (keyCode == 'W' || keyCode == 'w') {
    redLevel = 255; greenLevel = 255; blueLevel = 255;
  } else if (keyCode == 'K' || keyCode == 'k') {
    redLevel = 0; greenLevel = 0; blueLevel = 0;
  } else if (keyCode == 'S' || keyCode == 's') {
    stop = !stop;
  }
}

