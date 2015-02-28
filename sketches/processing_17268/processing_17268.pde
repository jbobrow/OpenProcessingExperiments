
//import processing.video.*;

int w=200;
int h=200;

//MovieMaker mm;

float gridU[][] = new float[w][h];
float gridV[][] = new float[w][h];
float gridNext[][] = new float[w][h];
float reactionRate = .1;
float diffusionRateU = .04;
float diffusionRateUX = .04;
float diffusionRateUY = .02;
float diffRateUYarr[][] = new float[w][h];
float diffusionRateV = .01;
float deltaT = 4;
float deltaXSq = 1.0;

float F = .04;
float k = .06;
float[][] Farr = new float[w][h];
float[][] karr = new float[w][h];

//boolean movieOn = true;
void setup() {
  size(200,200);
  //if(movieOn) mm = new //MovieMaker(this,width,height,"reaction.mov",30, //MovieMaker.H263, MovieMaker.HIGH);
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      gridU[i][j] = .5+random(-.01,.01);
      gridV[i][j] = .25+random(-.01,.01);
    }
  }

  setupF();
  setupK();
  setupDiffRates();
}

void draw() {
  diffusionU();
  diffusionV();
  reaction();
  F += .00002;
  loadPixels();
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      pixels[j*w+i] = color(gridU[i][j]*255,i*4,i*8);
    // pixels[j*w+i] = color(gridU[i][j]*255,0,0);
    }
  }
  updatePixels();
 // if(movieOn) mm.addFrame();
}

void diffusionU() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      
      gridNext[i][j] = gridU[i][j]+deltaT/deltaXSq*
      (diffusionRateUX*(gridU[(i-1+w)%w][j]
      +gridU[(i+1)%w][j]-2*gridU[i][j])+
      diffRateUYarr[i][j]*(gridU[i][(j-1+h)%h]
      +gridU[i][(j+1)%h]
      -2*gridU[i][j]));
    }
  }
  float temp[][] = gridU;
  gridU = gridNext;
  gridNext = temp;
}

void diffusionV() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      
      gridNext[i][j] = gridV[i][j]+diffusionRateV*deltaT/deltaXSq*
      (gridV[(i-1+w)%w][j]
      +gridV[(i+1)%w][j]
      +gridV[i][(j-1+h)%h]
      +gridV[i][(j+1)%h]
      -4*gridV[i][j]
      );
    }
  }
  float temp[][] = gridV;
  gridV = gridNext;
  gridNext = temp;

}
void reaction() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      float  uVal = gridU[i][j];
      gridU[i][j] = gridU[i][j] + deltaT*(reactionU(gridU[i][j],gridV[i][j], Farr[i][j], karr[i][j]));
      gridV[i][j] = gridV[i][j] + deltaT*(reactionV(uVal,gridV[i][j], Farr[i][j], karr[i][j]));
    }
  }
}
//Gray-Scott
float reactionU(float aVal, float bVal, float FVal, float kVal) {
  return reactionRate*(-aVal*bVal*bVal+FVal*(1-aVal));
}

float reactionV(float aVal, float bVal, float FVal, float kVal) {
  return reactionRate*(aVal*bVal*bVal-(FVal+kVal)*bVal);
}

void setupF() {
  //F .04 - .07
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      Farr[i][j] = .03+i*.05/w;
    }
  }  
}

void setupK() {
  for(int i=0;i<w/2;++i) {
    for(int j=0;j<h;++j) {
      karr[i][j] = .051+i*.05f/w;
    }
  
  }
  for(int i=w/2;i<w;++i){
    for(int j=0;j<h;++j){
       karr[i][j] = 0.048+i*.05/w;
      }
  }
    
}

void setupDiffRates() {
  for(int i=0;i<w;++i) {
    for(int j=0;j<h;++j) {
      diffRateUYarr[i][j] = .05+j*.02/h;
    }
  }  
}



