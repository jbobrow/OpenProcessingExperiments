
/* Hey Raj, you can vary bR, nBalls, orbitOmega (the rotational speed of the wheel)
and the size, which is down in setup. This is our mock - up, so what are we going to
do with to make it interactive? */

float wr; // radius of wheel
float wTheta;
float wOmega;

float orbitTheta; // angle of wheel
float orbitOmega = .015;

float cx; // center of wheel x
float cy;

float v; // translation velocity of wheel, omega * r

int nBalls = 10; // number of balls on the outside of the wheel
float[] ballTheta;
float bR = 20; // radius of each ball





void setup() {
  size(600, 600); // width and height have to be identical, should be divisible by 4
  wr = width / 4;

  orbitTheta = random(0, 2 * PI);
  wTheta = random(0, 2 * PI);

  v = orbitOmega * (width / 2 - wr); // translational velocity of wheel as it rolls inside circle

  wOmega = v / wr;
  // wheel's wOmega must now be computed so that's its rolling speed matches its translational speed

  ballTheta = new float[nBalls];
  for (int i = 0; i < nBalls; i++)
    ballTheta[i] = 2 * PI * i / (float) nBalls;
}





void draw() {
  background(0);

  fill(255); // color of circle inside which wheel is rolling
  ellipse(width / 2, height / 2, width, width); // draw circle inscribed in display window

  fill(255,0,0); // color of balls on wheel

  orbitTheta += orbitOmega; // increment orbit angle, find x and y coords of center of wheel
  cx = width / 2 + (width / 2 - wr) * cos(orbitTheta);
  cy = width / 2 + (width / 2 - wr) * sin(orbitTheta);
  
  // draw one circle in the center of the wheel
//  ellipse(cx, cy, 2 * bR, 2 * bR); 



  wTheta += wOmega; // increment wheel angle

  pushMatrix();
  translate(cx, cy); // shift coord system to center of wheel
  rotate(-wTheta); // if this isn't negative ball looks like it's rolling backwards

  for (int i = 0; i < ballTheta.length; i++)
    ellipse((wr - bR) * cos(ballTheta[i]), (wr - bR) * sin(ballTheta[i]), 2 * bR, 2 * bR);

  popMatrix();
}
