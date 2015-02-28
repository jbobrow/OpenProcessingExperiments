
// J Fuller
// Creative Computing S13


// Domino Shape Est

PShape dNull;
PShape dEins;
PShape dZwei;
PShape dDrei;
PShape dVier;
PShape dFunf;
PShape dSechs;
PShape dSieben;
PShape dAcht;
PShape dNeun;
PShape dZehn;
PShape dElf;
PShape dZwolf;

// Time Est

int m1;
int m2;
int h;

// Position Est

int m1X;
int m1Y;
int m2X;
int m2Y;
int hX;
int hY;

void setup () {

  // Setup

    size(710, 400);
  background(255);
  smooth();

  // SVG Calls

  dNull=loadShape("Domino0.svg");
  dEins=loadShape("Domino1.svg");
  dZwei=loadShape("Domino2.svg");
  dDrei=loadShape("Domino3.svg");
  dVier=loadShape("Domino4.svg");
  dFunf=loadShape("Domino5.svg");
  dSechs=loadShape("Domino6.svg");
  dSieben=loadShape("Domino7.svg");
  dAcht=loadShape("Domino8.svg");
  dNeun=loadShape("Domino9.svg");
  dZehn=loadShape("Domino10.svg");
  dElf=loadShape("Domino11.svg");
  dZwolf=loadShape("Domino12.svg");

  // Position Declarations

  m1X = 300;
  m1Y = 100;
  m2X = 500;
  m2Y = 100;
  hX = 100;
  hY = 100;
}

void draw() {

  // Setup

  background(255);
  m1 = minute();
  m2 = minute();
  h = hour();

  // 24 Time Conversion

  if (h>12 && h<23) {
    h=h-12;
  }

  // Hour Display

  if (h==1) {
    shape(dEins, hX, hY);
  }
  if (h==2) {
    shape(dZwei, hX, hY);
  }
  if (h==3) {
    shape(dDrei, hX, hY);
  }
  if (h==4) {
    shape(dVier, hX, hY);
  }
  if (h==5) {
    shape(dFunf, hX, hY);
  }
  if (h==6) {
    shape(dSechs, hX, hY);
  }
  if (h==7) {
    shape(dSieben, hX, hY);
  }
  if (h==8) {
    shape(dAcht, hX, hY);
  }
  if (h==9) {
    shape(dNeun, hX, hY);
  }
  if (h==10) {
    shape(dZehn, hX, hY);
  }
  if (h==11) {
    shape(dElf, hX, hY);
  }
  if (h==12) {
    shape(dZwolf, hX, hY);
  }

  // Minute 1 Display

  if (m1>=0 && m1<=9) {
    shape(dNull, m1X, m1Y);
  }
  if (m1>=10 && m1<=19) {
    shape(dEins, m1X, m1Y);
  }
  if (m1>=20 && m1<=29) {
    shape(dZwei, m1X, m1Y);
  }
  if (m1>=30 && m1<=39) {
    shape(dDrei, m1X, m1Y);
  }
  if (m1>=40 && m1<=49) {
    shape(dVier, m1X, m1Y);
  }
  if (m1>=50 && m1<=59) {
    shape(dFunf, m1X, m1Y);
  }

  // Minute 2 Display

  if (m2==0 || m2==10 || m2==20 || m2==30 || m2==40 || m2==50) {
    shape(dNull, m2X, m2Y);
  }
  if (m2==1 || m2==11 || m2==21 || m2==31 || m2==41 || m2==51) {
    shape(dEins, m2X, m2Y);
  }
  if (m2==2 || m2==12 || m2==22 || m2==32 || m2==42 || m2==52) {
    shape(dZwei, m2X, m2Y);
  }
  if (m2==3 || m2==13 || m2==23 || m2==33 || m2==43 || m2==53) {
    shape(dDrei, m2X, m2Y);
  }
  if (m2==4 || m2==14 || m2==24 || m2==34 || m2==44 || m2==54) {
    shape(dVier, m2X, m2Y);
  }
  if (m2==5 || m2==15 || m2==25 || m2==35 || m2==45 || m2==55) {
    shape(dFunf, m2X, m2Y);
  }
  if (m2==6 || m2==16 || m2==26 || m2==36 || m2==46 || m2==56) {
    shape(dSechs, m2X, m2Y);
  }
  if (m2==7 || m2==17 || m2==27 || m2==37 || m2==47 || m2==57) {
    shape(dSieben, m2X, m2Y);
  }
  if (m2==8 || m2==18 || m2==28 || m2==38 || m2==48 || m2==58) {
    shape(dAcht, m2X, m2Y);
  }
  if (m2==9 || m2==19 || m2==29 || m2==39 || m2==49 || m2==59) {
    shape(dNeun, m2X, m2Y);
  }
}


