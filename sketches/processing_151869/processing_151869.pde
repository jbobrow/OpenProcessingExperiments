
/* Creative Coding
 * June 16 2014 - N Balls
 * by Julio Montabes
 * Copyright (c) 2014 Julio Montabes
 *
 * This program draws circles of random radius and random position.
 * If one circle overlap any margin it is projected at a velocity proportional to the overlap and always oriented to
 * the interior of the box.
 *
 * - Press any mouse button to make the image change.
 * - Press 'i' to restart.
 * - Press 's' to save one jpg file.
 *
 * ENJOY!
 */

int iFrames;
int iNum=25;
float[] fOBx = new float[100];
float[] fOBy = new float [100];
float[] fOBVx = new float [100];
float[] fOBVy = new float [100];
float[] fOBradius = new float [100];
color[] fOBcolor = new color [100];
float fElasticity = 2; // Factor of elasticity of the virtual matter of the balls.


void setup() {  //setup function called initially, only once
  size(600, 600);
  background(240);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  iFrames = 0;
  initiateCollection ();
  drawCollection();
}

void draw() {  //draw function loops
  if (mousePressed==false) {
    updateCollection();
    iFrames++;
    drawCollection();
  }
  userEvents();
}

/*    FUNCTIONS ORDERED BY NAME     */

void checkWalls() {

  for (int i=1; i <=iNum; ++i) {

    if (fOBx[i]-fOBradius[i]<0) {
      //println("");
      //println("");
      //println("");
      fOBVx[i]=fElasticity*(fOBradius[i]-fOBx[i]);
      //println("fOBx "+fOBx[i], " < rad "+fOBradius[i], "fOBVx="+fOBVx[i]);
      fOBx[i]=fOBradius[i];
    }
    if (fOBx[i]+fOBradius[i]>width) {
      fOBVx[i]=-fElasticity*(fOBx[i]+fOBradius[i]-width);
      //println("fOBx "+fOBx[i], " + rad "+fOBradius[i], "fOBVx="+fOBVx[i]);
      fOBx[i]=width-fOBradius[i];
    }
    if (fOBy[i]-fOBradius[i]<0) {
      fOBVy[i]=fElasticity*(fOBradius[i]-fOBy[i]);
      //println("fOBy "+fOBy[i], " + rad "+fOBradius[i], "fOBVy="+fOBVy[i]);
      fOBy[i]=fOBradius[i];
    }
    if (fOBy[i]+fOBradius[i]>height) {
      fOBVy[i]=-fElasticity*(fOBy[i]+fOBradius[i]-height);
      //println("fOBy "+fOBy[i], " + rad "+fOBradius[i], "fOBVx="+fOBVy[i]);
      fOBy[i]=height-fOBradius[i];
    }
  }
}

void checkCollisions() {

  for (int i=1; i <=iNum; ++i) { // Under construction
  }
}

void drawCollection() {
  background(100,190,190);
  for (int i=1; i <=iNum; ++i) {
    drawObject (i);
  }
}


void drawObject (int item) {

  fill (fOBcolor[item], 180);
  stroke (1);
  ellipse ( fOBx[item], fOBy[item], fOBradius[item]*2, fOBradius [item]*2);
}

void initiateCollection() {
  for (int i=1; i <=iNum; ++i) {
    fOBx [i]=random (width);
    fOBy [i]=random (height);
    fOBVx [i]=random (-100, 100);
    fOBVy [i]=random (-100, 100);
    fOBradius [i]=random (100);
    fOBcolor [i]=color (random (100, 150), random (100, 150), random (100, 150));
  }
}

void updateCollection() {
  //initiateCollection();
  checkWalls();
  checkCollisions();
  for (int i=1; i<=iNum; ++i) {
    fOBx[i]=fOBx[i]+fOBVx[i]; // The new position is the result of addint to the old one the velocity per 1 frame.
    fOBy[i]=fOBy[i]+fOBVy[i];
  }
}

void userEvents() {
  if (keyPressed && key=='i') {
    switch(key) {
    case 'i':
      initiateCollection();
      drawCollection();
      break;
    case 's':
      saveFrame("NBalls.jpg");
      break;
    }
  }
}



