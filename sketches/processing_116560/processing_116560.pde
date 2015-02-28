
void setup() {
  size(1080, 720);
}

float aR = 30;
float aXstart = 540;
float aYstart = 360;
float bR = 40;
float bXstart = 530;
float bYstart = 370;
float cR = 35;
float cXstart = 540;
float cYstart = 350;
float dR = 20;
float dXstart = 550;
float dYstart = 350;
float eR = 50;
float eXstart = 520;
float eYstart = 370;
float fR = 25;
float fXstart = 540;
float fYstart = 355;
float gR = 35;
float gXstart = 545;
float gYstart = 365;
float hR = 45;
float hXstart = 570;
float hYstart = 360;
float iR = 35;
float iXstart = 555;
float iYstart = 380;
float jR = 33;
float jXstart = 515;
float jYstart = 365;
float kR = 55;
float kXstart = 540;
float kYstart = 370;
float lR = 15;
float lXstart = 525;
float lYstart = 325;

void draw() {
  background(66,98,88);
  fill(29, 0, 165);
  //blue1
  float aD = dist(aXstart, aYstart, mouseX, mouseY);
  float aDfac = -(250000 / aR)/(aD+1);
  float aSin = (mouseX-aXstart)/aD;
  float aCos = (mouseY-aYstart)/aD;
  float aX = aXstart + (aDfac * aSin);
  float aY = aYstart + (aDfac * aCos);
  ellipse(aX, aY, aR, aR);
  
  //blue2
  float bD = dist(bXstart, bYstart, mouseX, mouseY);
  float bDfac = -(250000 / bR)/(bD+1);
  float bSin = (mouseX-bXstart)/bD;
  float bCos = (mouseY-bYstart)/bD;
  float bX = bXstart + (bDfac * bSin);
  float bY = bYstart + (bDfac * bCos);
  ellipse(bX, bY, bR, bR);

  //blue3
  float cD = dist(cXstart, cYstart, mouseX, mouseY);
  float cDfac = -(250000 / cR)/(cD+1);
  float cSin = (mouseX-cXstart)/cD;
  float cCos = (mouseY-cYstart)/cD;
  float cX = cXstart + (cDfac * cSin);
  float cY = cYstart + (cDfac * cCos);
  ellipse(cX, cY, cR, cR);
  
  //blue4
  float dD = dist(dXstart, dYstart, mouseX, mouseY);
  float dDfac = -(250000 / dR)/(dD+1);
  float dSin = (mouseX-dXstart)/dD;
  float dCos = (mouseY-dYstart)/dD;
  float dX = dXstart + (dDfac * dSin);
  float dY = dYstart + (dDfac * dCos);
  ellipse(dX, dY, dR, dR);
  ellipse(dX, dY, dR, dR);
  
  //blue5
  float eD = dist(eXstart, eYstart, mouseX, mouseY);
  float eDfac = -(250000 / eR)/(eD+1);
  float eSin = (mouseX-eXstart)/eD;
  float eCos = (mouseY-eYstart)/eD;
  float eX = eXstart + (eDfac * eSin);
  float eY = eYstart + (eDfac * eCos);
  ellipse(eX, eY, eR, eR);
  
  //blue6
  float fD = dist(fXstart, fYstart, mouseX, mouseY);
  float fDfac = -(250000 / fR)/(fD+1);
  float fSin = (mouseX-fXstart)/fD;
  float fCos = (mouseY-fYstart)/fD;
  float fX = fXstart + (fDfac * fSin);
  float fY = fYstart + (fDfac * fCos);
  ellipse(fX, fY, fR, fR);
  
  //blue7
  float gD = dist(gXstart, gYstart, mouseX, mouseY);
  float gDfac = -(250000 / gR)/(gD+1);
  float gSin = (mouseX-gXstart)/gD;
  float gCos = (mouseY-gYstart)/gD;
  float gX = gXstart + (gDfac * gSin);
  float gY = gYstart + (gDfac * gCos);
  ellipse(gX, gY, gR, gR);

  //blue8
  float hD = dist(hXstart, hYstart, mouseX, mouseY);
  float hDfac = -(350000 / hR)/(hD+1);
  float hSin = (mouseX-hXstart)/hD;
  float hCos = (mouseY-hYstart)/hD;
  float hX = hXstart + (hDfac * hSin);
  float hY = hYstart + (hDfac * hCos);
  ellipse(hX, hY, hR, hR);
  
  //blue9
  float iD = dist(iXstart, iYstart, mouseX, mouseY);
  float iDfac = -(350000 / iR)/(iD+1);
  float iSin = (mouseX-iXstart)/iD;
  float iCos = (mouseY-iYstart)/iD;
  float iX = iXstart + (iDfac * iSin);
  float iY = iYstart + (iDfac * iCos);
  ellipse(iX, iY, iR, iR);
  
  //blue10
  float jD = dist(jXstart, jYstart, mouseX, mouseY);
  float jDfac = -(350000 / jR)/(jD+1);
  float jSin = (mouseX-jXstart)/jD;
  float jCos = (mouseY-jYstart)/jD;
  float jX = jXstart + (jDfac * jSin);
  float jY = jYstart + (jDfac * jCos);
  ellipse(jX, jY, jR, jR);
  
  //blue11
  float kD = dist(kXstart, kYstart, mouseX, mouseY);
  float kDfac = -(350000 / kR)/(kD+1);
  float kSin = (mouseX-kXstart)/kD;
  float kCos = (mouseY-kYstart)/kD;
  float kX = kXstart + (kDfac * kSin);
  float kY = kYstart + (kDfac * kCos);
  ellipse(kX, kY, kR, kR);
  
  //blue12
  float lD = dist(lXstart, lYstart, mouseX, mouseY);
  float lDfac = -(350000 / lR)/(lD+1);
  float lSin = (mouseX-lXstart)/lD;
  float lCos = (mouseY-lYstart)/lD;
  float lX = lXstart + (lDfac * lSin);
  float lY = lYstart + (lDfac * lCos);
  ellipse(lX, lY, lR, lR);
  
  //black
  fill(0);
  ellipse(540, 360, 250, 250);
  
  //gold
  float goldD = dist(mouseX,mouseY,540,360);
  float goldDfac = 3000/(goldD+1);
  float goldSin = (mouseX-540)/goldD;
  float goldCos = (mouseY-360)/goldD;
  float goldX = mouseX - goldDfac*goldSin;
  float goldY = mouseY - goldDfac*goldCos;
  fill(211,166,0);
  ellipse(goldX ,goldY ,15,15);
  
  //orange
  float orangeD = dist(mouseX,mouseY,540,360);
  float orangeDfac = 1000/(orangeD+1);
  float orangeSin = (mouseX-540)/orangeD;
  float orangeCos = (mouseY-360)/orangeD;
  float orangeX = mouseX - orangeDfac*orangeSin;
  float orangeY = mouseY - orangeDfac*orangeCos;
  fill(211,131,0);
  ellipse(orangeX ,orangeY ,30,30);
  
  //red
  fill(85,9,0);
  ellipse(mouseX,mouseY,50,50);
  
}



