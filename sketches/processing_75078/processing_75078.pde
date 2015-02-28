
color black  = color(43, 27, 32);
color yellow = color(248, 240, 6);
color sky    = color(132, 119, 201);

final int BAT       = 0;
final int BAT_BODY  = 1; 
final int BAT_MOUTH = 2; 
final int BAT_TOOTH = 3;
final int BAT_WING  = 4; 
final int BAT_EYE   = 5; 
final int BAT_TAIL  = 6;
final int BAT_PATCH = 7;

final int SIDE_NONE = 0; 
final int SIDE_LEFT = -1;
final int SIDE_RIGHT = 1;

int whichChange = 0;
long lastChangeTime; 
BatPart moreBats[];


//=============================================
void setup() {
  size (640, 480); 
  background(sky);

  moreBats = new BatPart[3];
  moreBats[0] = new BatPart(0, BAT, width*0.25, height*0.23, SIDE_NONE, width*0.06);
  moreBats[1] = new BatPart(1, BAT, width*0.70, height*0.28, SIDE_NONE, width*0.10);
  moreBats[2] = new BatPart(2, BAT, width*0.45, height*0.65, SIDE_NONE, width/6.0);
}

//=============================================
void draw() {
  background(sky);


  // draw the bats
  for (int i=0;i<3; i++) {
    moreBats[i].draw();
  }

  // every once in a while, change them up
  if ((millis() - lastChangeTime) > 10000) {
    reviseNext();
    lastChangeTime = millis();
  }
}

void mousePressed() {
  reviseNext();
}
void keyPressed() {
  reviseNext();
}
void reviseNext() {
  randomSeed(millis());
  moreBats[whichChange].revise();
  whichChange = (whichChange+1)%3;
}


//=========================================================
class BatPart {

  boolean bDrawMe;
  boolean bDrawShadow;
  boolean bDrawRegPoint = false;
  int whatAmI;
  int whichSide;

  float xpts[];
  float ypts[];
  int npts; 
  float offsetT;

  float regX;
  float regY; 
  color partColor;

  int nSubParts; 
  BatPart subParts[];


  float batBodyMinW;
  float batBodyMaxW; 

  float bbw1; 
  float bbw5; 
  float bbh0; 
  int ID;

  BatPart (int id, int whatKind, float cx, float cy, int side, float bodyScale) {
    whatAmI = whatKind;
    whichSide = side;
    npts = 0; 
    bDrawMe = false;
    bDrawShadow = false;
    regX = cx;
    regY = cy;
    ID = id;

    batBodyMinW = bodyScale;
    batBodyMaxW = batBodyMinW*1.25; 

    revise();
  }

  void revise() {
    randomSeed (millis() + ID); 
    offsetT = random(1000); 


    bbw1 = 0.5*random(batBodyMinW, batBodyMaxW);
    bbw5 = 0.5*random(batBodyMinW, batBodyMaxW);
    bbh0 = bbw1 * random(0.70, 1.125); 

    switch(whatAmI) {

      //---------------------------------------
    case BAT: 
      nSubParts = 1;
      subParts = new BatPart[nSubParts];
      subParts[0] = new BatPart (3, BAT_BODY, 0, 0, SIDE_NONE, batBodyMinW); 
      break;

      //---------------------------------------
    case BAT_BODY: 
      // design own blob
      bDrawMe = true;
      bDrawShadow = true;

      partColor = black;
      npts = 6;
      xpts = new float[npts];
      ypts = new float[npts];

      xpts[0] = 0;
      xpts[1] = 0 + bbw1;
      xpts[2] = 0 + bbw1*random(0.75, 1.25);
      xpts[3] = 0 + 0.10*random(0-batBodyMinW, batBodyMinW);
      xpts[4] = 0 - bbw5*random(0.75, 1.25);
      xpts[5] = 0 - bbw5;

      ypts[0] = 0 - bbh0;
      ypts[1] = 0 - bbh0*random(0.85, 1.0);
      ypts[2] = 0 + bbh0*random(0.70, 1.0);
      ypts[3] = 0 + bbh0;
      ypts[4] = 0 + bbh0*random(0.70, 1.0);
      ypts[5] = 0 - bbh0*random(0.85, 1.0);

      float wxl = (xpts[4] + xpts[5])/2.0;
      float wyl = (ypts[4] + ypts[5])/2.0;
      float wxr = (xpts[1] + xpts[2])/2.0;
      float wyr = (ypts[1] + ypts[2])/2.0;

      boolean bHasTail = (random(1.0) < 0.7);
      nSubParts = 5;
      if (bHasTail) {
        nSubParts++;
      }
      subParts = new BatPart[nSubParts];
      int p = 0; 
      if (bHasTail) {
        subParts[p++] = new BatPart (4, BAT_TAIL, xpts[3], ypts[3], SIDE_NONE, batBodyMinW);
      }

      // make sure the wings are in phase...
      offsetT = random(1000); 
      subParts[p] = new BatPart (5, BAT_WING, wxl, wyl, SIDE_LEFT, batBodyMinW); 
      subParts[p].offsetT = offsetT;
      p++;
      subParts[p] = new BatPart (6, BAT_WING, wxr, wyr, SIDE_RIGHT, batBodyMinW); 
      subParts[p].offsetT = offsetT;
      p++;

      subParts[p++] = new BatPart (7, BAT_MOUTH, 0, 0, SIDE_NONE, batBodyMinW); 
      subParts[p++] = new BatPart (8, BAT_EYE, xpts[1], ypts[1], SIDE_RIGHT, batBodyMinW);
      subParts[p++] = new BatPart (9, BAT_EYE, xpts[5], ypts[5], SIDE_LEFT, batBodyMinW); 


      break;

      //---------------------------------------
    case BAT_MOUTH:
      bDrawMe = true;
      bDrawShadow = true; 
      partColor = yellow;

      npts = 8;
      xpts = new float[npts];
      ypts = new float[npts];

      xpts[0] = 0 + bbw1*random(0.65, 1.15);
      xpts[1] = 0 - bbw1*random(0.65, 1.15);

      ypts[0] = 0 + bbh0*random(0.45, 0.8);
      ypts[1] = 0 + bbh0*random(0.45, 0.8);

      float mx = (xpts[0] + xpts[1])/2.0;
      float my = (ypts[0] + ypts[1])/2.0;
      float mr = (xpts[0] - xpts[1])/2.0 * 0.9;
      for (int i=0; i<6; i++) {
        float a = PI + (i+1)/7.0 * PI + random(-0.15, 0.15);
        float mrr = mr * random(0.9, 1.1); 
        float px = mx + mrr * cos(a); 
        float py = my + mrr * sin(a); 
        xpts[i+2] = px;
        ypts[i+2] = py;
      }

      nSubParts = (int) random(2.75, 4.75); 
      subParts = new BatPart[nSubParts];
      for (int i=0; i<nSubParts; i++) {
        float dfrac = 1.0/nSubParts;
        float frac = (float)(i+1)/(nSubParts+1) + 0.25*random(-dfrac, dfrac);
        float tx = map(frac, 0, 1, xpts[0], xpts[1]);
        float ty = map(frac, 0, 1, ypts[0], ypts[1]);
        subParts[i] = new BatPart (10+i, BAT_TOOTH, tx, ty, SIDE_NONE, batBodyMinW);
      }
      break;

      //---------------------------------------
    case BAT_TOOTH:
      bDrawMe = true;
      bDrawShadow = true; 

      partColor = black;
      nSubParts = 0; 

      boolean bIrregular = (random(1.0) < 0.25);
      float bToothAboveSign = (random(1.0) < 0.125) ? -1:1; 
      npts = (bIrregular) ? 4:3;
      xpts = new float[npts];
      ypts = new float[npts];

      float ts = batBodyMinW * random(0.15, 0.27); 
      xpts[0] = 0; 
      xpts[1] = 0 + ts*random(0.33, 0.66); 
      xpts[2] = 0 - ts*random(0.33, 0.66);

      ypts[0] = 0 - ts;
      ypts[1] = 0 + ts*random(0.1, 0.2)*bToothAboveSign;
      ypts[2] = 0 + ts*random(0.1, 0.2)*bToothAboveSign;

      if (bIrregular) {
        xpts[3] = 0 - ts*random(0.2, 0.3); 
        ypts[3] = 0 - ts*random(0.5, 0.7);
      }
      break;

      //---------------------------------------
    case BAT_WING:
      partColor = black;
      bDrawMe = true;
      bDrawShadow = true;

      npts = 13;
      xpts = new float[npts];
      ypts = new float[npts];

      float wingw = batBodyMinW * 0.95;
      float wingh = batBodyMinW * 0.35;
      float dx = (whichSide == SIDE_RIGHT) ? wingw : 0-wingw;
      dx *= random(0.5, 0.85);

      for (int i=0; i<npts; i++) {
        float frac = ((i+0.5)/npts);
        frac = pow(frac, 3.0);
        float a = frac * TWO_PI;
        if (whichSide == SIDE_RIGHT) {
          a = 0-a + PI;
        }
        a += TWO_PI*random(-1, 1) * 0.03; 
        float wrx = wingw * random(0.9, 1.5); 
        float wry = wingh * random(0.6, 1.3); 
        xpts[i] = wrx * cos(a) + dx; 
        ypts[i] = wry * sin(a);
      }

      boolean bHasPatches = (random(1.0) < 0.3);
      nSubParts = (bHasPatches) ? 2:0;
      if (nSubParts > 0) {
        subParts = new BatPart[nSubParts];
        for (int i=0; i<nSubParts; i++) {
          subParts[i] = new BatPart (20+i, BAT_PATCH, regX, regY, whichSide, batBodyMinW);
        }
      }

      break;

      //---------------------------------------
    case BAT_EYE:
      bDrawMe = true;
      bDrawShadow = true; 

      nSubParts = 0; 
      partColor = yellow;
      npts = 3;
      xpts = new float[npts];
      ypts = new float[npts];

      if (whichSide == SIDE_RIGHT) {
        xpts[0] = 0 - batBodyMinW*random(0.20, 0.30);
        xpts[1] = 0 + batBodyMinW*random(0.02, 0.04);
        xpts[2] = 0 + batBodyMinW*random(0.03, 0.06);

        ypts[0] = 0 + batBodyMinW*random(0.1, 0.2);
        ypts[1] = 0 - batBodyMinW*random(0.1, 0.2);
        ypts[2] = 0 + batBodyMinW*random(0.1, 0.15);
      } 
      else if (whichSide == SIDE_LEFT) {
        xpts[0] = 0 + batBodyMinW*random(0.20, 0.30);
        xpts[1] = 0 - batBodyMinW*random(0.02, 0.04);
        xpts[2] = 0 - batBodyMinW*random(0.03, 0.06);

        ypts[0] = 0 + batBodyMinW*random(0.1, 0.2);
        ypts[1] = 0 - batBodyMinW*random(0.1, 0.2);
        ypts[2] = 0 + batBodyMinW*random(0.1, 0.15);
      }

      break;

      //---------------------------------------
    case BAT_TAIL:
      bDrawMe = true;
      bDrawShadow = true;

      nSubParts = 0; 
      partColor = black;
      npts = 3;
      xpts = new float[npts];
      ypts = new float[npts];

      xpts[0] = 0;
      xpts[1] = 0 - batBodyMinW * random(0.05, 0.18);
      xpts[2] = 0 + batBodyMinW * random(0.05, 0.18);

      ypts[0] = 0 + batBodyMinW * random(0.10, 0.50); 
      ypts[1] = 0 - batBodyMinW * 0.12; 
      ypts[2] = 0 - batBodyMinW * 0.12; 

      break;

      //---------------------------------------
    case BAT_PATCH:
      nSubParts = 0; 
      partColor = yellow;
      npts = 4;
      xpts = new float[npts];
      ypts = new float[npts];
      break;
    }
  }



  //=============================================
  void draw() {

    pushMatrix();
    translate(regX, regY); 

    if (whatAmI == BAT_WING) { 
      rotate ( 0.5* sin(offsetT + millis()/1000.0) * whichSide);
    } 
    else if (whatAmI == BAT_BODY) {
      translate (0, 0 - (batBodyMinW * 0.10) * sin(offsetT + millis()/1000.0));
    }

    if (bDrawMe && (npts > 0)) {
      smooth();
      noStroke();

      if (bDrawShadow) {
        fill (black, 64); 
        pushMatrix();
        translate(-5, 5); 
        randomSeed(1);
        beginShape();
        for (int i=0; i<npts; i++) {
          float px = xpts[i] +  10*(noise((millis() + random(0, 1000))/1500.0) - 0.5);
          float py = ypts[i] +  10*(noise((millis() + random(0, 1000))/1500.0) - 0.5);
          vertex(px, py);
        }
        endShape();
        popMatrix();
      }

      fill (partColor); 
      randomSeed(1);
      beginShape();
      for (int i=0; i<npts; i++) {
        float px = xpts[i] +  10*(noise((millis() + random(0, 1000))/1500.0) - 0.5);
        float py = ypts[i] +  10*(noise((millis() + random(0, 1000))/1500.0) - 0.5);
        vertex(px, py);
      }
      endShape();
    }


    if (nSubParts > 0) {
      for (int i=0; i<nSubParts; i++) {
        subParts[i].draw();
      }
    }

    if (whatAmI == BAT_EYE) {
      stroke(black);
      strokeWeight(batBodyMinW/22.0);
      strokeCap(SQUARE); 
      float ex = (xpts[0] + xpts[1] + xpts[2])/3.0;
      float ey = (ypts[0] + ypts[1] + ypts[2])/3.0;
      line(ex*1.75, ey*1.75, -ex*0.2, -ey*0.2);
      noStroke();
    }


    popMatrix();
  }
}
