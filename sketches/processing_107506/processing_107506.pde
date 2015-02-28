
  //+++++++++ INITIAL ARRAY INITIALISATIONS AND VARIABLES +++++++++\\
Xcreator[] xs;
Jpoint[] jp;
BackgroundX[] bxs;
int Crosscount = 600;
int BackgroundCrossCount = 130;
int Jpoints = 25;
  //++++++++++++++++++\\
  
void setup() {
  size (960, 640);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  smooth();
  noStroke();
  frameRate(60); 
  randomSeed(400);

  //+++++++++ ARRAY & POINTS FOR THE PULLING, FORMS THE J +++++++++\\
  jp = new Jpoint[Jpoints];
  float jpxpos = 280; 
  for (int i = 0; i<=10; i++) {
    jp[i] = new Jpoint(jpxpos, 140);
    jpxpos = jpxpos + 40;
  }
  float jpypos = 180;
  for (int i = 10; i<=16; i++) {
    jp[i] = new Jpoint(520, jpypos);
    jpypos = jpypos + 40;
  }
  jp[17] = new Jpoint(516, 420);
  jp[18] = new Jpoint(505, 455);
  jp[19] = new Jpoint(476, 482);
  jp[20] = new Jpoint(440, 498);
  jp[21] = new Jpoint(400, 498);
  jp[22] = new Jpoint(364, 482);
  jp[23] = new Jpoint(335, 455);
  jp[24] = new Jpoint(324, 420);
  //++++++++++++++++++\\

  //+++++++++ ARRAY FOR THE FOREGROUND & BACKGROUND PULSING XS +++++++++\\
  xs = new Xcreator[Crosscount];
  for (int i = 0; i<xs.length; ++i) {
    xs[i] = new Xcreator(random(0, width), random(0, height), random(25, 85), random(2, 4.5), random(0, 30), random(0.0, 1.0), (int)random(-3, 3), random(-22, 22), random(-22, 22), (int)random(1, 2));
  }
  bxs = new BackgroundX[BackgroundCrossCount];
  for (int i = 0; i<bxs.length; ++i) {
    bxs[i] = new BackgroundX(random(0, width), random(0, height), random(0.2, 0.8), random(0, 5), random(0.0, 1.0), random(180, 280));
  }
  //++++++++++++++++++\\
}

void draw() {
  background(360, 0, 100);
  //+++++++++ METHOD CALLING FOR FREGROUND AND BACKGROUND XS +++++++++\\
  for (int i = 0; i<bxs.length; ++i) {
    pushStyle();
    pushMatrix();
    bxs[i].updatebxs();
    bxs[i].drawbxs();
    popMatrix();
    popStyle();
  }
  for (int i = 0; i<xs.length; ++i) {
    pushStyle();
    pushMatrix();
    xs[i].update();
    xs[i].drawX();
    popMatrix();
    popStyle();
  }
}
  
  //+++++++++ CLASS FOR FOREGROUND XS +++++++++\\
class Xcreator {
  float xpos, ypos, xmaxlength, speed, sinsize, xfill, ranspeed, xposfin, yposfin, currentxpos, currentypos, randomposx, randomposy;
  int interpol, randomdistfunc;
  Xcreator(float xp, float yp, float xmaxl, float s, float f, float r, int interpolation, float rposx, float rposy, int rdf) {
    xpos = xp;
    ypos = yp;
    xmaxlength = xmaxl;
    speed = s;
    sinsize = 0;
    xfill = f;
    ranspeed = r;
    interpol = interpolation;
    randomposx = rposx;
    randomposy = rposy;
    randomdistfunc = rdf;
    pushMatrix();
    FindFinDist();
    popMatrix();
  }
    //+++++++++ METHOD FOR CALCULATING CURRENT POSITION AND SIZES +++++++++\\
  void update() {
    float mousetrack = sin(map(mouseX, -1, width + 1, 0, PI));
    if (interpol == -3) {
      currentxpos = map(pow(mousetrack, 0.02), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 0.08), 0, 1, ypos, yposfin);
    } 
    else if (interpol == -2) {
      currentxpos = map(pow(mousetrack, 0.12), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 0.07), 0, 1, ypos, yposfin);
    } 
    else if (interpol == -1) {
      currentxpos = map(pow(mousetrack, 0.4), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 1.2), 0, 1, ypos, yposfin);
    } 
    else if (interpol == 0) {
      currentxpos = map(mousetrack, 0, 1, xpos, xposfin);
      currentypos = map(mousetrack, 0, 1, ypos, yposfin);
    } 
    else if (interpol == 1) {
      currentxpos = map(pow(mousetrack, 1.5), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 0.5), 0, 1, ypos, yposfin);
    } 
    else if (interpol == 2) {
      currentxpos = map(pow(mousetrack, 10), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 4), 0, 1, ypos, yposfin);
    } 
    else if (interpol == 3) {
      currentxpos = map(pow(mousetrack, 8), 0, 1, xpos, xposfin);
      currentypos = map(pow(mousetrack, 10), 0, 1, ypos, yposfin);
    }

    sinsize = map(sin(radians(frameCount * speed)), -1, 1, 0, 1);
    if (ranspeed <= 0.2) {
      sinsize = pow(map(cos(radians(frameCount * speed)), -1, 1, 0, 1), 4);
    } 
    else if (ranspeed >0.2 && ranspeed <=0.4) {
      sinsize = pow(map(cos(radians(frameCount * speed)), -1, 1, 0, 1), 1.5);
    } 
    else if (ranspeed >0.4 && ranspeed <=0.6) {
      sinsize = map(sin(radians(frameCount * speed)), -1, 1, 0, 1);
    } 
    else if (ranspeed >0.6 && ranspeed <=0.8) {
      sinsize = pow(map(sin(radians(frameCount * speed)), -1, 1, 0, 1), 0.75);
    } 
    else if (ranspeed >0.8 && ranspeed <=1.0) {
      sinsize = pow(map(sin(radians(frameCount * speed)), -1, 1, 0, 1), 0.3);
    }
  }
    //++++++++++++++++++\\
  
    //+++++++++ METHOD FOR FINDING CLOSEST JPOINT AND ENSURING VARIABLE INTERPOLATION +++++++++\\
  void FindFinDist() {
    float xpmin = 10000;
    if (randomdistfunc == 1) {
      for (int j = 0; j<Jpoints; j++) {
        float xpd = dist(xpos, ypos, jp[j].jpxpos, jp[j].jpypos); 
        if (xpd < xpmin) {
          xpmin = xpd;
          xposfin = jp[j].jpxpos + randomposx;
          yposfin = jp[j].jpypos + randomposy;
        }
      }
    } 
    else if (randomdistfunc == 2) {
      for (int j = 0; j<Jpoints; j++) {
        float xpd = abs(xpos - jp[j].jpxpos) + abs(ypos - jp[j].jpxpos);
        if (xpd < xpmin) {
          xpmin = xpd;
          xposfin = jp[j].jpxpos + randomposx;
          yposfin = jp[j].jpypos + randomposy;
        }
      }
    }
  }
    //++++++++++++++++++\\
  
    //+++++++++ METHOD FOR DRAWING XS AS WELL AS CONTROLLING COLOUR +++++++++\\
  void drawX() {
    float currentlength = map(sinsize, 0, 1, 4, xmaxlength);
    translate(currentxpos, currentypos);
    rotate(QUARTER_PI);
    float maxFill = 5;
    float minFill = 0;
    float filler = sin(radians(frameCount/10));
    float currentFill = map(filler, -1, 1, maxFill, minFill);
    fill(currentFill, 65 + xfill/1.2, 75 + xfill, 70 + xfill);
    rect(0, (-currentlength/9) * 2.5, currentlength/9, (currentlength/9) * 4);
    rect(0, (currentlength/9) * 2.5, currentlength/9, (currentlength/9) * 4);
    rect(0, 0, currentlength, currentlength/9);
  }
    //++++++++++++++++++\\
}
  //++++++++++++++++++\\

  //+++++++++ CLASS FOR POINTS OF J +++++++++\\
class Jpoint {
  float jpxpos, jpypos;
  Jpoint(float jpxp, float jpyp) {
    jpxpos = jpxp;
    jpypos = jpyp;
  }
}
  //++++++++++++++++++\\

  //+++++++++ CLASS FOR BACKGROUND XS. DIFFERENT TO FOREGROUND XS +++++++++\\
class BackgroundX {
  float xpos, ypos, xsize, xspeed, xfiller, ranspeed, sinsize, xmaxlength;
  BackgroundX(float bxp, float byp, float bxspeed, float bxfiller, float bxranspeed, float bxsize) {
    xpos = bxp;
    ypos = byp;
    xspeed = bxspeed;
    xfiller = bxfiller;
    ranspeed = bxranspeed;
    sinsize = 0;
    xmaxlength = bxsize;
  }

  void updatebxs() {
    sinsize = map(sin(radians(frameCount * xspeed)), -1, 1, 0, 1);
    if (ranspeed <= 0.2) {
      sinsize = pow(map(cos(radians(frameCount * xspeed)), -1, 1, 0, 1), 4);
    } 
    else if (ranspeed >0.2 && ranspeed <=0.4) {
      sinsize = pow(map(cos(radians(frameCount * xspeed)), -1, 1, 0, 1), 1.5);
    } 
    else if (ranspeed >0.4 && ranspeed <=0.6) {
      sinsize = map(sin(radians(frameCount * xspeed)), -1, 1, 0, 1);
    } 
    else if (ranspeed >0.6 && ranspeed <=0.8) {
      sinsize = pow(map(sin(radians(frameCount * xspeed)), -1, 1, 0, 1), 0.75);
    } 
    else if (ranspeed >0.8 && ranspeed <=1.0) {
      sinsize = pow(map(sin(radians(frameCount * xspeed)), -1, 1, 0, 1), 0.3);
    }
  }

  void drawbxs() {
    float currentlength = map(sinsize, 0, 1, 80, xmaxlength);
    float mousescale = map(mouseX, 0, width, 0, PI);
    float mousefiller = map(pow((sin(mousescale)), 25), 0, 1, 0, 7);
    translate(xpos, ypos);
    rotate(QUARTER_PI);
    fill(0, 0, 60 + xfiller - mousefiller*9, 10 + xfiller + mousefiller*10);
    rect(0, (-currentlength/10) * 3.228, currentlength/5, (currentlength/10) * 4.5);
    rect(0, (currentlength/10) * 3.228, currentlength/5, (currentlength/10) * 4.5);
    rect(0, 0, currentlength, currentlength/5);
  }
}
  //++++++++++++++++++\\


