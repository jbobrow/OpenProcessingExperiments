
//  ========================================================
//
//  Noodle
//  arthurG, June 2011
//
//  questions, comments : arthurgraff -at- gmail
//  ========================================================


float scaleNoise = 0.01f;


class CNoodle {

  int nSegs;
  float vx,vy;
  float []segsLength;
  float []noisePos;
  float []angles;
  float posX,posY,lastPosX,lastPosY;

  CNoodle () {
    nSegs = 8;

    vx=0;
    vy=0;

    float totalLength = height/4;
    segsLength = new float[nSegs];
    noisePos = new float[nSegs];
    angles = new float[nSegs];

    for (int i=0; i<nSegs; i++) {
      angles[i] = random(TWO_PI);
      noisePos[i] = random(100);
      segsLength[i] = totalLength/float(nSegs);
    }

    segsLength[0] = totalLength/2.0f;
    for (int i=1; i<nSegs; i++) {
      segsLength[i] = segsLength[i-1]/2.0f;
    }

    lastPosX = width/2;
    lastPosY = height/2;
  }

  void update () {

    lastPosX = posX;
    lastPosY = posY;

    float a=0;
    posX = mouseX;
    posY = mouseY;

    for (int i=0; i<nSegs; i++) {
      a+=angles[i];
      posX += cos(a)*segsLength[i];
      posY += sin(a)*segsLength[i];
    }

    for (int i=0; i<nSegs; i++) {
      noisePos[i] += scaleNoise;
      angles[i] += (0.4f-noise(noisePos[i]))/5.0;
    }

    vx=(vx+(posX-lastPosX))/2.0;
    vy=(vy+(posY-lastPosY))/2.0;
  }

  void draw() {
    float mv = max(10,sqrt(vx*vx+vy*vy)*5.0f);
    float sz = min(mv,100.0f);

    ellipse (posX, posY,sz,sz);
  }
}

CNoodle noodle01;
CNoodle noodle02;
CNoodle noodle03;
CNoodle noodle04;

void setup () {
  size (600,400);
  background(255);

  noodle01 = new CNoodle();
  noodle02 = new CNoodle();
  noodle03 = new CNoodle();
  noodle04 = new CNoodle();

  smooth();
}



void draw () {

  noodle01.update();
  noodle02.update();
  noodle03.update();
  noodle04.update();

  stroke(0);

  fill (255);
  noodle04.draw();

  stroke(255);

  fill (128,0,0);
  noodle01.draw();

  fill (0,128,0);
  noodle02.draw();

  fill (0,0,128);
  noodle03.draw();
}




