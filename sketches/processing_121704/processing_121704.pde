
/*
 author: mpinner
 date: 2013-11-22
 
 intent: simulate rgb led staff for testing sequeces
 
*/

void setup() {
  frameRate(60);
  colorMode(RGB, 256);
  size(800, 800, OPENGL);
  sphereDetail(12);
  return;
}

void draw() {
  background(0);
  staff();
  return;
}

void staff() {

  int ledCount = 240;
  int ledZStepSize = 3;
  int ledSize = 4;

  int staffRadius = 5;

  int staffBrightness = 16;
  int staffLength = ledCount;


  pushMatrix();
  translate(width / 2.0, height / 2.0);
  rotateX(radians(90));
  rotateY(radians(frameCount));



  // rotateX(radians(mouseY/(float)height*360));


  rotateY(radians((float)mouseX/width*360));

  pushMatrix();
    rotateX(radians(90));
  fill(staffBrightness, staffBrightness, staffBrightness);
  noStroke();
  cylinder(staffRadius-1, ledZStepSize*ledCount, 12);
popMatrix();


  for (int i = 0 ; i < ledCount; i++) {
    pushMatrix();

    int radius = 5;
    translate(
    (float)(radius*Math.cos(i)), 
    (float)(radius*Math.sin(i)), 
    (float)ledZStepSize*(i-ledCount/2));

    int ledOffBrightness = 16;
    fill(ledOffBrightness, ledOffBrightness, ledOffBrightness);

    fillFromIndex(1, frameCount, i, ledCount);
    noStroke();

    sphere(ledSize);   // so set 'scale' small & draw a big one.
    popMatrix();
  }

  popMatrix();

  return;
}



// Slightly different, this makes the rainbow equally distributed throughout
void fillFromIndex(int wait, long millis, int index, int maxIndex) {

  long slice = (millis / wait) % maxIndex; 

  if (slice == index) {
    //blue
    fill(0, 0, 255);
  }

  if (maxIndex - slice == index) {
    //white 
    fill(255, 255, 255);
  }

  if ((maxIndex + maxIndex/2 + slice) % maxIndex == index) {
    // light blue
    fill(0, 255, 255);
  }

  if ((maxIndex + maxIndex/2 - slice) % maxIndex == index) {
    // pink
    fill(255, 0, 255);
  }
}



void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];

  //get the x and z position on a circle for all the sides
  for (int i=0; i < x.length; i++) {
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0, -h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
  }

  endShape();

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0, h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], h/2, z[i]);
  }

  endShape();
}



