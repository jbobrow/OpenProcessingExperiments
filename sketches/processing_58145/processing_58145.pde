
/*
 Erica Zambrano, Creative Computing @ Parsons 
  Animated Scalable Color Wheel 
 
 */

int opacity = 0;
int opacityDirection = 3;
int rotationAngle = 0;


int rMax = 255;
int gMax = 255;
int bMax = 255;
int rMin = 0;
int gMin = 0;
int bMin = 0;



void setup() {

  size(800, 800);   // set any size here as long as it is square!
  background(0);
  smooth();
  noStroke();
}

void draw() {

  translate(width/2, height/2);    // setting the center of the rotation to middle of the window
  rotate(radians(rotationAngle));

  // 'red-to-green third'

  for (int a=0; a<=120; a += 12) {

    fill(rMax, gMin, 0);
    arc(0, 0, width*0.9, height*0.9, radians(a), radians(a+12));
    rMax -= 25;
    gMin += 25;
  }
  rMax = 255;
  gMin = 0;

  // 'green-to-blue third'

  for (int a=120; a<=240; a += 12) {

    fill(0, gMax, bMin);
    arc(0, 0, width*0.9, height*0.9, radians(a), radians(a+12));
    gMax -= 25;
    bMin += 25;
  }
  gMax = 255;
  bMin = 0;

  // 'blue-to-red third'

  for (int a=240; a<=360; a += 12) {

    fill(rMin, 0, bMax);
    arc(0, 0, width*0.9, height*0.9, radians(a), radians(a+12));
    bMax -= 25;
    rMin += 25;
  }
  bMax = 255;
  rMin = 0; 



  rotationAngle += 12;  // let's rotate everything by 12 degrees!



  // Here starts the fade to white.

  fill(255, 255, 255, opacity);
  for (float i = width*0.9; i >= 0; i -= width*0.09) {
    ellipse(0, 0, i, i);
  }

  opacity = opacity + opacityDirection;

  if (opacity >= 255 || opacity<0) {
    opacityDirection = opacityDirection * -1;
  }
}


