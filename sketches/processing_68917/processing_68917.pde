
// code de http://www.openprocessing.org/sketch/51013 et de http://www.openprocessing.org/sketch/49766 par Thomas O Fredericks

int xT, yT, dT, countLineT;
int xH, yH, wH, hH, countLineH;
boolean stateT, stateH;

void setup() {
  size(400, 400);

  // TOGGLE BUTTON
  xT = width/3;
  yT = height/2;
  dT = 50;
  stateT = false;

  // HOLD BUTTON
  xH = width/3*2;
  yH = height/2;
  wH = 50;
  hH = 50;
  stateH = false;

  noStroke();
  smooth();
  rectMode(CENTER); //oui, ce serais plus facile pour le mouseOver d'être en rectMode corner.
}

void draw() {
  background(100);

  // HOLD BUTTON inversé

  if ( stateH ) {
    if (countLineH<20) { // pour activer le delais d'affichage des lignes.
      countLineH++;
    }
    fill(250, 18, 208);
  } 

  else {
    if (countLineH>-1) { // pour activer le delais d'affichage des lignes.
      countLineH--;
    }  
    fill(10, 250, 8);
  }

  for (int i=0;i<=countLineH;i++) {
    stroke(0);
    strokeWeight(5);
    line (0, i*20-10, 400, i*20-10);
    noStroke();
  }

  rect(xH, yH, wH, hH);

  // TOGGLE BUTTON inversé pour éviter les ligne noire de paraîte par dessus

  if ( stateT ) { 
    if (countLineT<20) { // pour activer le delais d'affichage des lignes.
      countLineT++;
    }
    fill(250, 18, 208);
  } 

  else {
    if (countLineT>-1) { // pour activer le delais d'affichage des lignes.
      countLineT--;
    }    
    fill(10, 250, 8);
  }

  dessinCercleT();

  ellipse(xT, yT, dT, dT);
}


void dessinCercleT() {

  int diaCercleT = 50;
  float rads=0;

  for (int i=0;i<=countLineT;i++) {

    float x1 = xT + cos(rads) * diaCercleT * 0.6 ;
    float y1 = yT + sin(rads) * diaCercleT * 0.6 ;
    float x2 = xT + cos(rads) * diaCercleT;
    float y2 = yT + sin(rads) * diaCercleT;

    stroke(0);
    strokeWeight(5);
    line(x1, y1, x2, y2 );
    noStroke();

    rads=rads+TWO_PI / 20;
  }
}

void mousePressed() {

  //toggle
  float distance = dist( mouseX, mouseY, xT, yT ); // code de http://www.openprocessing.org/sketch/18999
  if ( distance < dT/2 ) {
    if ( !stateT ) {
      stateT = true;
    } 
    else { 
      stateT = false;
    }
  }

  // hold
  if ( mouseX>xH-wH/2 && mouseX<xH+wH/2 && mouseY>yH-hH/2 && mouseY<yH+hH/2 ) {
    stateH = true;
  }
}

void mouseReleased() {
  stateH = false;
}
