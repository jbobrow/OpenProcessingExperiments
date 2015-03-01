
/* Creative Coding
 * June 16 2014 - N Balls
 * by Julio Montabes
 * Copyright (c) 2014 Julio Montabes
 *
 * This program draws circles of random radius and random position.
 * If one circle overlap any box margin it is projected at a velocity proportional to the overlap and always oriented to
 * the interior of the box.
 * If one circle collides with another they expell each other adding to the actual velocity of each one a vector
 * proportional to the width of the intersection of the two circles and opposite oriented to the center of each other
 *
 * - Press any mouse button to make the image change.
 * - Press 'i' to restart.
 * - Press 'l' swaps Contact Lines visible / unvisible.
 * - Press 's' to save one jpg file.
 *
 * ENJOY!
 */

int iFrames;
int iNum=25;
float gravity=9.8;

float[] fOBx = new float[100];
float[] fOBy = new float [100];
float[] fOBVx = new float [100];
float[] fOBVy = new float [100];
float[] fOBxo = new float [100]; // Point where the circle was clicked related to its center
float[] fOByo = new float [100];
float[] fOBradius = new float [100];
color[] fOBcolor = new color [100];
float[] fNx = new float[100];
float[] fNy = new float[100];
boolean[] bOBClicked = new boolean[100];

float fElasticity = 1; // Factor of elasticity of the virtual matter of the balls.
float fLastMillis = 0; // Last milisecond mouseClicked happened.

boolean bSeeLines = true;
boolean bMouvement = true;


void setup() {  //setup function called initially, only once
  size(600, 600);
  background(240);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  iFrames = 0;
  initiateCollection ();
  drawCollection();
  mouseReleased();
}

void draw() {  //draw function loops
  if (bMouvement) {
    updateCollection();
    iFrames++;
    drawCollection();
  }
  //userEvents();
}

void keyPressed() {
  //if (keyPressed) {
    switch(key) {
    case 'i':
      initiateCollection();
      drawCollection();
      break;
    case 'l':
      bSeeLines = bSeeLines==false;
      break;
    case 'm':
      bMouvement = bMouvement==false;
      break;
    case 's':
      saveFrame("NBalls.jpg");
      break;
    }
  }
//}
void mousePressed() {
  if (bOBClicked[0]==false) {
    for (int i=1; i<=iNum; ++i) {
      if (fOBx[i]-fOBradius[i]<mouseX && mouseX<fOBx[i]+fOBradius[i] && fOBy[i]-fOBradius[i]<mouseY && mouseY<fOBy[i]+fOBradius[i]) {
        bOBClicked[i]=true;
        fOBxo[i]=fOBx[i]-mouseX;
        fOByo[i]=fOBy[i]-mouseY;
        //println("Touched ", i);
      }
    }
  }
  bOBClicked[0]=true;
}

void mouseReleased() {
  for (int i=0; i<=iNum; ++i) {
    bOBClicked[i]=false;
    fOBxo[i]=0;
    fOByo[i]=0;
  }
}


void mouseWheel(MouseEvent event){
  float e = event.getCount();
  gravity+=e;
}


void mouseClicked() {
    if (millis()-fLastMillis<500) {
    println("DOBLE CLICK");
      initiateCollection ();
      drawCollection();
      mouseReleased();
    }
    fLastMillis=millis();
}


/*    FUNCTIONS ORDERED BY NAME     */

void checkWalls() {

  for (int i=1; i <=iNum; ++i) {

    if (fOBx[i]-fOBradius[i]<0) {
      fOBVx[i]=fElasticity*(fOBradius[i]-fOBx[i]);
      fOBx[i]=fOBradius[i];
    }
    if (fOBx[i]+fOBradius[i]>width) {
      fOBVx[i]=-fElasticity*(fOBx[i]+fOBradius[i]-width);
      fOBx[i]=width-fOBradius[i];
    }
    if (fOBy[i]-fOBradius[i]<0) {
      fOBVy[i]=fElasticity*(fOBradius[i]-fOBy[i]);
      fOBy[i]=fOBradius[i];
    }
    if (fOBy[i]+fOBradius[i]>height) {
      fOBVy[i]=-fElasticity*(fOBy[i]+fOBradius[i]-height);
      fOBy[i]=height-fOBradius[i];
    }
  }
}

void checkCollisions() {

  for (int i=1; i <=iNum; ++i) { // Under construction
    for (int j=1; j<=iNum; ++j) {
      float Dij=sqrt(sq(fOBx[i]-fOBx[j])+sq(fOBy[i]-fOBy[j])); // Distance from i to j circle center.
      float SRij=fOBradius[i]+fOBradius[j]; // Sum of radius
      // Calculation of the distance between the center points of i and j objects.
      if (Dij<SRij && i!=j) {

        // Calculation of the vector opposite to the one formed by the two center points of the objects colliding
        float xR=fOBx[i]-fOBx[j]; 
        float yR=fOBy[i]-fOBy[j];
        fNx[i]=xR;
        fNy[i]=yR;
        // Addition to the actual velocity of the collition vector. The strength of the impact is proportional to the 
        // intersection of the two circles at the very moment of the frame time. 
        fOBVx[i]+=xR*(SRij-Dij)/SRij;
        fOBVy[i]+=yR*(SRij-Dij)/SRij;
      }
    }
  }
}

void checkForces() {

  for (int i=1; i <=iNum; ++i) {
    // Let's add gravity...
    fOBVy[i]+=gravity;
    // Human forces
    if (bOBClicked[i]==true) {
      fOBVx[i]=mouseX-pmouseX;
      fOBVy[i]=mouseY-pmouseY;
    }
  }
}

void drawCollection() {
  background(100, 190, 190);
  for (int i=1; i <=iNum; ++i) {
    drawObject (i);
  }
}


void drawObject (int item) {
  // draws the circle
  fill (fOBcolor[item], 180);
  noStroke();
  ellipse ( fOBx[item], fOBy[item], fOBradius[item]*2, fOBradius [item]*2);
  // draws the line
  if (bSeeLines) {
    stroke(0, 255, 255, 255);
    line(fOBx[item], fOBy[item], fOBx[item]-fNx[item], fOBy[item]-fNy[item]);
  }
}

void initiateCollection() {
  for (int i=1; i <=iNum; ++i) {
    fOBx [i]=random (width);
    fOBy [i]=random (height);
    fOBVx [i]=random (-100, 100);
    fOBVy [i]=random (-100, 100);
    fOBradius [i]=random (90);
    fOBcolor [i]=color (random (100, 150), random (100, 150), random (100, 150));
  }
}

void updateCollection() {
  checkWalls();
  checkCollisions();
  checkForces();
  for (int i=1; i<=iNum; ++i) {
    fOBx[i]=fOBx[i]+fOBVx[i]; // The new position is the result of addint to the old one the velocity per 1 frame.
    fOBy[i]=fOBy[i]+fOBVy[i];
    if (bOBClicked[i]==true) {
      fOBx[i]=mouseX+fOBxo[i];
      fOBy[i]=mouseY+fOByo[i];
    }
  }
}




