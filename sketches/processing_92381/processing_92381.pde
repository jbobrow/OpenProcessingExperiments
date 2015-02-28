
/*
title : !!!!!
 description : !!!!!!
 created : jan 2013
 by : Alexandre Michael-R.
 */

float leftEyeX = -32;
float leftEyeY = -40;
float leftEyeR = 4;

float rightEyeX = 23;
float rightEyeY = -41;
float rightEyeR = 3.5;

float opaEye;

float couleur = 59;
float transitionCouleur;

float zoomCible1 = 38;
float zoomCible2 = 38;
float zoomCible3 = 2;
float zoom1;
float zoom2;
float zoom3;

float oscTete;

float x;
float y;

int etatTete;
int etatEye;

void setup() {
  size(400, 400);
  smooth();
  rectMode(CENTER);
  frameRate(30);
  colorMode (HSB, 359, 99, 99, 250); //valeurs max pour HSB

  x = width /2;
  y = width /2;

  oscTete=1;
}

void draw() {
  /*
  x = mouseX;
   y = mouseY;
   */
  background (110, 0, 70);
  pushMatrix();
  translate(x, y);


  //Oscillation de la tête
  y+=sin(radians(oscTete*6))*0.3;
  oscTete++;



  //****************ZONES INTERACTIVES RECTANGULAIRES *****************
  boolean sourisAGaucheDeDroite1 = mouseX < x - 6 + 75; //zone détectée par souris
  boolean sourisADroiteDeGauche1 = mouseX > x - 6 - 75; //deux rectangles formant une croix
  boolean sourisEnBasDuHaut1 = mouseY > y - 30 - 50;
  boolean sourisEnHautDuBas1 = mouseY < y - 30 + 50;
  boolean sourisAGaucheDeDroite2 = mouseX < x -1 + 40;
  boolean sourisADroiteDeGauche2 = mouseX > x - 1 - 40;
  boolean sourisEnBasDuHaut2 = mouseY > y - 5 - 85;
  boolean sourisEnHautDuBas2 = mouseY < y - 5 + 85;

  //*********TRNANSITION DE TEINTE**********
  if (etatTete == 0) {
    if (( sourisAGaucheDeDroite1
      && sourisADroiteDeGauche1
      && sourisEnBasDuHaut1 
      && sourisEnHautDuBas1) ||
      ( sourisAGaucheDeDroite2
      && sourisADroiteDeGauche2
      && sourisEnBasDuHaut2 
      && sourisEnHautDuBas2)) {
      transitionCouleur = +2 ; //AVEC curseur : la teinte augmente(+2)
    }
    else {
      transitionCouleur = -2; //SANS curseur : la teinte diminue(-2)
    } 
    couleur = couleur + transitionCouleur;
    couleur = constrain(couleur, 59, 180);
    fill(couleur, 85, 50);
  }

  if (etatTete == 1) {
    //carré activé (NOIR)
    if (( sourisAGaucheDeDroite1
      && sourisADroiteDeGauche1
      && sourisEnBasDuHaut1 
      && sourisEnHautDuBas1) ||
      ( sourisAGaucheDeDroite2
      && sourisADroiteDeGauche2
      && sourisEnBasDuHaut2 
      && sourisEnHautDuBas2)) {
      transitionCouleur = +5; //AVEC curseur : la teinte augmente(+5)
    }
    else {
      transitionCouleur = -2; //SANS curseur : la teinte diminue(-2)
    }

    couleur = couleur + transitionCouleur; // assouplissement
    couleur = constrain(couleur, 190, 349); // détermine la valeur de teinte min et max
    fill(couleur, 85, 50); // la couleur de remplisage selon la valeur de teinte
  }
  
  
  
  //******************************************************


  //pique1 
  beginShape();
  curveVertex(54.0, -55.0);
  curveVertex(-2.0, -48.0);
  curveVertex(-31.0, -64.0);
  curveVertex(-27.0, -79.0);
  curveVertex(-9.0, -83.0);
  curveVertex(2.0, -91.0);
  curveVertex(12.0, -101.0);
  curveVertex(23.0, -109.0);
  curveVertex(39.0, -116.0);
  curveVertex(62.0, -120.0);
  curveVertex(49.0, -114.0);
  curveVertex(42.0, -101.0);
  curveVertex(42.0, -86.0);
  curveVertex(56.0, -75.0);
  curveVertex(51.0, -58.0);
  curveVertex(21.0, -49.0);
  curveVertex(3.0, -48.0);
  curveVertex(-81.0, -49.0);
  endShape();

  //pique2
  beginShape();
  curveVertex(-41.0, -25.0);
  curveVertex(-23.0, -62.0);
  curveVertex(-32.0, -76.0);
  curveVertex(-52.0, -75.0);
  curveVertex(-65.0, -81.0);
  curveVertex(-81.0, -90.0);
  curveVertex(-98.0, -88.0);
  curveVertex(-88.0, -85.0);
  curveVertex(-84.0, -73.0);
  curveVertex(-90.0, -61.0);
  curveVertex(-98.0, -50.0);
  curveVertex(-96.0, -39.0);
  curveVertex(-80.0, -33.0);
  curveVertex(-51.0, -34.0);
  curveVertex(-31.0, -43.0);
  curveVertex(-15.0, -61.0);
  endShape();


  //pique3
  beginShape();
  curveVertex(-68.0, -48.0);
  curveVertex(-96.0, -44.0);
  curveVertex(-94.0, -28.0);
  curveVertex(-98.0, -18.0);
  curveVertex(-101.0, -8.0);
  curveVertex(-102.0, 1.0);
  curveVertex(-100.0, 12.0);
  curveVertex(-96.0, 23.0);
  curveVertex(-96.0, 15.0);
  curveVertex(-90.0, 5.0);
  curveVertex(-81.0, 3.0);
  curveVertex(-75.0, 5.0);
  curveVertex(-67.0, 12.0);
  curveVertex(-54.0, 9.0);
  curveVertex(-45.0, -13.0);
  curveVertex(-50.0, -44.0);
  curveVertex(-67.0, -58.0);
  curveVertex(-89.0, -53.0);
  curveVertex(-118.54935, -12.750488);
  endShape();

  //pique4
  beginShape();
  curveVertex(-48.0, 96.0);
  curveVertex(-16.0, 94.0);
  curveVertex(-1.0, 100.0);
  curveVertex(14.0, 103.0);
  curveVertex(7.0, 99.0);
  curveVertex(11.0, 94.0);
  curveVertex(24.0, 79.0);
  curveVertex(13.0, 62.0);
  curveVertex(-16.0, 66.0);
  curveVertex(-24.0, 81.0);
  curveVertex(-1.0, 118.0);
  endShape();


  //formeDeTete
  beginShape();
  curveVertex(39.0, 62.0);
  curveVertex(29.0, 79.0);
  curveVertex(18.0, 89.0);
  curveVertex(1.0, 90.0);
  curveVertex(-18.0, 89.0);
  curveVertex(-36.0, 73.0);
  curveVertex(-46.0, 59.0);
  curveVertex(-57.0, 34.0);
  curveVertex(-80.0, 8.0);
  curveVertex(-93.0, -21.0);
  curveVertex(-99.0, -46.0);
  curveVertex(-89.0, -61.0);
  curveVertex(-76.0, -74.0);
  curveVertex(-57.0, -77.0);
  curveVertex(-25.0, -87.0);
  curveVertex(-3.0, -87.0);
  curveVertex(31.0, -85.0);
  curveVertex(53.0, -77.0);
  curveVertex(70.0, -64.0);
  curveVertex(76.0, -44.0);
  curveVertex(80.0, -26.0);
  curveVertex(72.0, -1.0);
  curveVertex(63.0, 11.0);
  curveVertex(53.0, 23.0);
  curveVertex(43.0, 38.0);
  curveVertex(39.0, 61.0);
  curveVertex(29.0, 79.0);
  endShape(CLOSE);

  //ombrageYeux
  fill(0, 0, 0, 130);
  beginShape();
  curveVertex(-7.0, -40.0);
  curveVertex(-19.0, -31.0);
  curveVertex(-17.0, -23.0);
  curveVertex(-13.0, -18.0);
  curveVertex(-16.0, -21.0);
  curveVertex(-15.0, -31.0);
  curveVertex(-1.0, -39.0);
  curveVertex(6.0, -39.0);
  curveVertex(12.0, -37.0);
  curveVertex(15.0, -35.0);
  curveVertex(18.0, -33.0);
  curveVertex(21.0, -32.0);
  curveVertex(23.0, -37.0);
  curveVertex(42.0, -35.0);
  curveVertex(34.0, -52.0);
  curveVertex(9.0, -45.0);
  curveVertex(-12.0, -43.0);
  curveVertex(-25.0, -49.0);
  curveVertex(-44.0, -59.0);
  curveVertex(-55.0, -39.0);
  curveVertex(-55.0, -36.0);
  curveVertex(-49.0, -38.0);
  curveVertex(-48.0, -31.0);
  curveVertex(-40.0, -29.0);
  curveVertex(-36.0, -30.0);
  curveVertex(-20.0, -31.0);
  curveVertex(25.0, 15.0);
  endShape();

  //texture/cercles ---------------
  //moyensCercles - contour

  if ( random(100) < 2 ) {
    zoomCible1 = random(10, 33);
    zoomCible2 = random(11, 32);
    zoomCible3 = random(7, 14);
  }

  // Assouplissement
  zoom1 = ( zoomCible1 - zoom1 )  * 0.1 + zoom1;
  zoom2 = ( zoomCible2 - zoom2 )  * 0.13 + zoom2;
  zoom3 = ( zoomCible3 - zoom3 )  * 0.07 + zoom3;
  //haut-centre-droit #1
  fill(0, 0, 0, 30);
  ellipse(5, -70, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(5, -70, i, i);
  }      

  //haut-centre-droit #2
  fill(0, 0, 0, 40);
  ellipse(35, -67, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(35, -67, i, i);
  }      

  //haut-droit #3
  fill(0, 0, 0, 20);
  ellipse(59, -50, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(59, -50, i, i);
  }      

  /*haut-droit #4 */
  fill(0, 0, 0, 35);
  ellipse(62, -20, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(62, -20, i, i);
  }

  /*haut-centre-droit #5 */
  fill(0, 0, 0, 35);
  ellipse(46, 5, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(46, 5, i, i);
  }

  /*bas-centre-droit #6 */
  fill(0, 0, 0, 25);
  ellipse(30, 31.5, zoom2, zoom2); 

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(30, 31, i, i);
  }

  /*bas-centre-droit #7 */
  fill(0, 0, 0, 25);
  ellipse(23, 60, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(23, 60, i, i);
  }

  /*bas-centre #8 */
  fill(0, 0, 0, 25);
  ellipse(-1, 75, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-1, 75, i, i);
  }

  /*bas-gauche #9 */
  fill(0, 0, 0, 40);
  ellipse(-27, 60, zoom1, zoom1); 

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-27, 60, i, i);
  }

  /*bas-gauche #10 */
  fill(0, 0, 0, 40);
  ellipse(-38, 32, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-38, 32, i, i);
  }      

  /*haut-gauche #11 */
  fill(0, 0, 0, 40);
  ellipse(-57, 9, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-57, 9, i, i);
  }

  /*haut-gauche #12 */
  fill(0, 0, 0, 40);
  ellipse(-73, -16, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-73, -16, i, i);
  }      

  /*haut-centre-gauche #13 */
  fill(0, 0, 0, 25);
  ellipse(-79, -46, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-79, -46, i, i);
  }      

  /*haut-centre-gauche #14 */
  fill(0, 0, 0, 40);
  ellipse(-53, -60, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-53, -60, i, i);
  }      

  /*haut-centre-gauche #15 */
  fill(0, 0, 0, 25);
  ellipse(-25, -70, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-25, -70, i, i);
  }      

  /*------------------------------------------------------------
  /*moyensCercles - centre
  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(20, 80, zoom3, zoom3);

  for (int i = 12; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(20, 80, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 60);
  ellipse(-21, 80, zoom3, zoom3);

  for (int i = 10; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-21, 80, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 60);
  ellipse(-44, 50, zoom3, zoom3);

  for (int i = 4; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-44, 50, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 40);
  ellipse(-1, 45, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-1, 45, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(-12, 17.5, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-12, 17, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(15.5, 4, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(15.5, 4, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 57);
  ellipse(32.5, -21, zoom2, zoom2);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(32.5, -21, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(5.3, -22, zoom2, zoom2);

  for (int i = 23; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(5.3, -22, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 50);
  ellipse(-11, -1, zoom1, zoom1);

  for (int i = 25; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-11, -1, i, i);
  }       

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 50);
  ellipse(-11.5, -26, zoom3, zoom3);

  for (int i = 9; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-11.5, -26, i, i);
  } 

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(-28, -21, zoom2, zoom2);

  for (int i = 24; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-28, -21, i, i);
  } 

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(-30, -43, zoom1, zoom1);

  for (int i = 22; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-30, -43, i, i);
  } 

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 45);
  ellipse(-6, -45, zoom2, zoom2);

  for (int i = 24; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-6, -45, i, i);
  } 

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 55);
  ellipse(19, -45, zoom2, zoom2);

  for (int i = 23; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(19, -45, i, i);
  } 

  /*haut-centre-droit #1 */
  fill(0, 0, 0, 65);
  ellipse(-51.5, -27, zoom1, zoom1);

  for (int i = 16; i > 0; i= i-1) {
    noStroke();
    fill(326, 0, 0, 2);
    ellipse(-51.5, -27, i, i);
  }       
  /*---------------------------------------------------------*/

  /*ombrageYeux2*/
  fill(0, 0, 0, 130);
  beginShape();
  curveVertex(-16.0, -21.0);
  curveVertex(-15.0, -35.0); /*o*/
  curveVertex(-1.0, -40.0); /*o*/
  curveVertex(6.0, -41.0);
  curveVertex(12.0, -39.0);
  curveVertex(19.0, -36.0); /*o*/
  curveVertex(20.0, -38.0); /*o*/
  curveVertex(21.0, -39.0); /*o*/
  curveVertex(23.0, -40.0); /*o*/
  curveVertex(38.0, -37.0); /*o*/
  curveVertex(32.0, -48.0); /*o*/
  curveVertex(9.0, -43.5); /*o*/
  curveVertex(-8.0, -41.0); /*o*/
  curveVertex(-21.0, -43.0); /*o*/
  curveVertex(-40.0, -52.0); /*o*/
  curveVertex(-51.0, -43.0); /*o*/
  curveVertex(-48.0, -40.0); /*o*/
  curveVertex(-45.0, -34.0); /*o*/
  curveVertex(-44.0, -32.0); /*o*/
  curveVertex(-36.0, -33.0); /*o*/
  curveVertex(-31.0, -35.0); /*o*/
  curveVertex(-17.0, -34.0); /*o*/
  curveVertex(25.0, 15.0);
  endShape();

  /*bouche*/
  fill(0, 0, 0, 140);
  beginShape();
  curveVertex(48.0, 56.0);
  curveVertex(35.0, 35.0);
  curveVertex(23.0, 47.0);
  curveVertex(9.0, 56.0);
  curveVertex(0.0, 62.0);
  curveVertex(-16.0, 54.0);
  curveVertex(-25.0, 45.0);
  curveVertex(-40.0, 37.0);
  curveVertex(-52.0, 29.0);
  curveVertex(-61.0, 20.0);
  curveVertex(-66.0, 5.0);
  curveVertex(-73.0, -7.0);
  curveVertex(-80.0, -15.0);
  curveVertex(-66.0, -21.0);
  curveVertex(-54.0, -18.0);
  curveVertex(-43.0, -14.0);
  curveVertex(-26.0, -5.0);
  curveVertex(-12.0, 1.0);
  curveVertex(8.0, -6.0);
  curveVertex(25.0, -13.0);
  curveVertex(44.0, -13.0);
  curveVertex(55.0, -25.0);
  curveVertex(64.0, -26.0);
  curveVertex(63.0, -13.0);
  curveVertex(55.0, 13.0);
  curveVertex(46.0, 24.0);
  curveVertex(38.0, 73.0);
  endShape();

  /*langue*/
  fill(0, 70, 55, 220);
  beginShape();
  curveVertex(48.0, 56.0);
  curveVertex(34.0, 38.0);
  curveVertex(23.0, 47.0);
  curveVertex(9.0, 56.0);
  curveVertex(0.0, 62.0);
  curveVertex(-16.0, 54.0);
  curveVertex(-24.0, 43.0);
  curveVertex(-30.0, 35.0);
  curveVertex(-38.0, 27.0);
  curveVertex(-25.0, 18.0);
  curveVertex(20.0, 13.0);
  curveVertex(37.0, 28.0);
  curveVertex(60.0, 97.0);
  endShape();

  //****************ZONES INTERACTIVES CIRCULAIRES *****************
 // println(leftEyeX+ " " +leftEyeY+ " " +  screenX(leftEyeX,leftEyeY) + " " + screenY(leftEyeX,leftEyeY));
  float leftDistance = dist( mouseX, mouseY, screenX(leftEyeX,leftEyeY), screenY(leftEyeX,leftEyeY));
  float rightDistance = dist( mouseX, mouseY, screenX(rightEyeX, rightEyeY), screenY(rightEyeX, rightEyeY));


  if ( leftDistance < leftEyeR ) {
    opaEye = 0;
  } 
  else if ( rightDistance < rightEyeR ) {
    opaEye = 0;
  } 
  else {
    opaEye = 255;
  }
  



  /*irisJaune*/
  fill(56, 80, 86, opaEye);
  ellipse(leftEyeX, leftEyeY, leftEyeR*2, leftEyeR*2);
  ellipse(rightEyeX, rightEyeY, rightEyeR*2, rightEyeR*2);
  /*irisNoir*/
  fill(56, 0, 0, opaEye);
  ellipse(-32, -39.6, 3, 6);
  ellipse(23, -41, 2, 5);
  /*irisLumiere*/
  fill(56, 0, 100, opaEye);
  ellipse(-33, -41, 4, 4);
  ellipse(22, -42, 3, 3);
  //****************************************************************

  /*dent1*/
  fill(56, 30, 80);
  beginShape();
  vertex(-47.0, -15.0);
  vertex(-50.0, -5.0);
  vertex(-40.0, 16.0);
  vertex(-42.0, 11.0);
  vertex(-43.0, -6.0);
  vertex(-40.0, -12.0);
  endShape();
  /*dent2*/
  beginShape();
  vertex(-25.0, -4.0);
  vertex(-34.0, -8.0);
  vertex(-32.0, 12.0);
  vertex(-30.0, 3.0);
  vertex(-25.0, -5.0);
  endShape();

  popMatrix();
}



void mousePressed() {
    //****************ZONES INTERACTIVES CIRCULAIRES *****************
  /*float leftDistance = dist( mouseX, mouseY, leftEyeX, leftEyeY);
  float rightDistance = dist( mouseX, mouseY, rightEyeX, rightEyeY);

  if ( leftDistance < leftEyeR ) {
    opaEye = 0;
  } 
  else if ( rightDistance < rightEyeR ) {
    opaEye = 0;
  } 
  else {
    opaEye = 255;
  } */
  
  //****************ZONES INTERACTIVES RECTANGULAIRES *****************
  boolean sourisAGaucheDeDroite1 = mouseX < x - 6 + 75;
  boolean sourisADroiteDeGauche1 = mouseX > x - 6 - 75;
  boolean sourisEnBasDuHaut1 = mouseY > y - 30 - 50;
  boolean sourisEnHautDuBas1 = mouseY < y - 30 + 50;
  boolean sourisAGaucheDeDroite2 = mouseX < x -1 + 40;
  boolean sourisADroiteDeGauche2 = mouseX > x - 1 - 40;
  boolean sourisEnBasDuHaut2 = mouseY > y - 5 - 85;
  boolean sourisEnHautDuBas2 = mouseY < y - 5 + 85;

  if (( sourisAGaucheDeDroite1
    && sourisADroiteDeGauche1
    && sourisEnBasDuHaut1 
    && sourisEnHautDuBas1) ||
    ( sourisAGaucheDeDroite2
    && sourisADroiteDeGauche2
    && sourisEnBasDuHaut2 
    && sourisEnHautDuBas2)) {

    if (etatTete == 0) {
      etatTete = 1; //etat activé 
    }
    else {
      etatTete = 0; //etat non-activé 
    }
  }
}
