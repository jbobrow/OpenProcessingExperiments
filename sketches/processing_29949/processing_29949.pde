
float theWidth = 500;
float theHeight = 500;
float LOOKER_RADIUS = 100.0;
float numX = 30;
float numY = 30;
float noiseCount = 0;
int picCount = 0;
int colsToUse = 5;
float[][] colSets = {{-2.2, -2.8, -3.3}, {2.2, 2.3, 2.5}, {4.4, 4.0, 3.0}, {-3.1, -4.0, -5.5}, {8.0, 4.0, -8.2}, {2, 1.5, 1.0}};
AngleThing[][] myAngleThing = new AngleThing[(int)numX][(int)numY];
void setup() {
  //  noiseDetail(10);
  size((int)theWidth, (int)theHeight);
  background(255);
  noStroke();
  colorMode(RGB, 1.0, 1.0, 1.0, 1.0);
  for (int i=0; i<myAngleThing.length; i++) {
    int theLength = myAngleThing[0].length;
    for (int j=0; j<theLength; j++) {
      int tempX = (int)(theWidth/(numX-10.0)*(i-4));
      int tempY = (int)(theHeight/(numY-10.0)*(j-4));
      float theHue = PI+atan2((float)tempY-(float)theHeight/2.0, (float)tempX-(float)theWidth/2.0);
      myAngleThing[i][j] = new AngleThing(tempX, tempY);
      myAngleThing[i][j].render();
    }
  }
}

void draw() {
  for (int i=0; i<myAngleThing.length; i++) {
    int theLength = myAngleThing[0].length;
    for (int j=0; j<theLength; j++) {
      myAngleThing[i][j].update();
      myAngleThing[i][j].render();
    }
  }
//  myAngleThing[15][15].update();
//  myAngleThing[15][15].render();
  noiseCount += .01;
}

void mousePressed() {
  picCount++;
  String theName = "save" + Integer.toString(picCount) + ".png";
  save(theName);
}

class AngleThing {
  float wigCo = 150;
  PVector pos;
  PVector wiggle;
  float lookingTheta;
  float openedTheta;
  float totalTheta;
  float arc1Col;
  float arc2Col;
  float sen = 6;
  float radius;
  float arc1Alph;
  float arc2Alph;
  float multip = 1;
  AngleThing(int x_, int y_) {
    pos = new PVector(x_, y_);
    wiggle = new PVector(0, 0);
  }
  void update() {
    noiseDetail(10);
    float d1t = noise(pos.x/theWidth*1.5, pos.y/theHeight*1.5, noiseCount*.25)*.05-.025;
    lookingTheta = (lookingTheta + d1t)%TWO_PI;
    openedTheta = norma(noise(pos.x/theWidth*1.5, pos.y/theHeight*1.5, noiseCount*.25+5.0))*PI;
    arc1Col = norma(norma(noise(pos.x/theWidth/1.0, pos.y/theHeight/1.0, noiseCount*.3)));
    arc2Col = norma(norma(noise(pos.x/theWidth/1.0, pos.y/theHeight/1.0, noiseCount*.3 + 1005.0)));
    radius = LOOKER_RADIUS*(2.0-(1.0/(1.0+sen))-(2.0-(1.0/(sen+1.0))*2.0)*noise(pos.x/theWidth*5.0, pos.y/theHeight*5.0, noiseCount*1.5));
    wiggle.x = noise(pos.x/theWidth, pos.y/theHeight, noiseCount*.25+2.0);
    d1t = noise(pos.x/theWidth*1.5, pos.y/theHeight*1.5, noiseCount*.25)*.05-.025;
    wiggle.y = (wiggle.y + d1t)%TWO_PI;
    arc1Alph = .082+.918*pow(noise(pos.x/theWidth*2.0, pos.y/theHeight*2.0, noiseCount*2), 4.5);
    arc2Alph = .082+.918*pow(noise(pos.x/theWidth*2.0, pos.y/theHeight*2.0, noiseCount*2+1.0), 4.5);

  }
  void render() {
    fun1(arc1Col, arc1Alph);
    arc(pos.x+wigCo*wiggle.x*cos(PI/2+wiggle.y), pos.y+wiggle.x*sin(PI+wiggle.y), radius, radius, lookingTheta+openedTheta, lookingTheta-openedTheta+TWO_PI);
    fun1(arc2Col, arc2Alph);
    arc(pos.x+wigCo*wiggle.x*cos(PI+wiggle.y), pos.y+wiggle.x*sin(PI+wiggle.y), radius, radius, lookingTheta-openedTheta, lookingTheta+openedTheta);
  }
}

float norma(float num){
  return((1-cos(num*PI))/2.0);
}

void fun1(float col, float alph){
  fill(.5+.5*cos(colSets[colsToUse][0]*PI*(.6+.4*cos(2*PI*col))), .5+.5*cos(colSets[colsToUse][1]*PI*(.6+.4*cos(2*PI*col))), .5+cos(colSets[colsToUse][2]*PI*(.6+.4*cos(2*PI*col)))/2.0, alph);
}


