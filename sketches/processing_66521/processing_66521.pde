
//variables
float speedX, speedY, x, y, ediam, r, g, b;

void setup() {
  size(500, 500);
  smooth();
  ediam = 100;  //diameter
  x = width/2;  // x start point
  y = height/2;  //y start point
  //randomizing speeds
  speedX = random(3, 6);
  speedY = random(4, 6);
  //colors
  r = random(255);
  g = random(255);
  b = random(255);
}


void draw() {
  background(180); //gray background

  //start moving circle 
  x = x + speedX;
  y = y + speedY;

  //colors

  r = r + speedX/2;
  g = g +speedY/2;
  b = b + (speedX+speedY/2);
  r = constrain(r, 0, 255);
  g = constrain(g, 0, 255);
  b = constrain(b, 0, 255);

  //x & y conditionals
  if (x < (0 + ediam/2) || x > (width - ediam/2)) {
    speedX = speedX * -1;  // this change the direction X.
  } 
  if (y < (0+ediam/2) || y > (height - ediam/2)) {
    speedY = speedY * -1;  // this change the direction Y.
  }



  //drawing ellipse
  fill(r, g, b); //cyan fill
  stroke(0); //black stroke
  strokeWeight(3);
  ellipse(x, y, ediam, ediam);

  
}
