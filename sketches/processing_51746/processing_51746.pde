
import ddf.minim.*;
Minim minim;
AudioInput in;

float startTheta = .1;
float thetaVel = 0.3;
float amplitude = .1;

PImage clean;
PImage topPart;
PImage bottomPart;
PImage hydro;
PImage water;


void setup() {
  size(300, 900);
  smooth();

  clean = loadImage("clean.jpg");
  topPart = loadImage("tubeTop.png");
  bottomPart = loadImage("bottomPart.png");
  hydro = loadImage("hydro.png");
  water = loadImage("water.png");

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {

  image(clean, 0, 0);
  image(hydro,0,0);
  //background(255);

  startTheta += in.left.get(0)*50 + 0.1;
  float theta = startTheta;

  //rect (theta,theta, 10, 10);


  //for (int z = 0; z <=height; z += 10) {
  for (int x = 0; x <= width; x += 10) {

    float y = map(sin(theta), -1, 1, 0, width);
    stroke(0);
    //fill(0);
    fill(in.right.get(0)*50, 0, 0);
    //rect ( x, y, 10, 10);
    theta += (thetaVel);
  }

  float y = map(sin(theta), -1, 1, 0, height);
  //image(topPart, 0, 0);
  image (topPart, 0, y / 20 * PI - 15);
  image(bottomPart, 0, 0);
  image(water, 0, y / 20 * PI - 15);
}


void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();

  super.stop();
}


