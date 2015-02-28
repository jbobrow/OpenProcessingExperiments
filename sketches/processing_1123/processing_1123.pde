
int partCnt = 200;
PFont fontA;
offPart[]offP = new offPart[partCnt];
float[]x = new float[partCnt];
float[]y = new float[partCnt];
float[]ang = new float[partCnt];

void setup(){
 size(640,480,P2D);
 frameRate(24);
 noStroke();
 background(102);
 colorMode(HSB);
 for(int i=0; i < partCnt; i++){  
  x[i] = random(20,width-20);
  y[i] = random(20,height-20);
  ang[i] = random(0,360);
  offP[i] = new offPart(width/2, height/2, 0, ang[i]); 
 }
 
 fontA = loadFont("InaiMathi-48.vlw");
 textAlign(CENTER);
  textFont(fontA, 16);
}

void draw(){
  for(int i=0; i < partCnt; i++){
   x[i] = x[i] + random(-4,4);
   y[i] = y[i] + random(-4,4);
   ang[i] = sin(ang[i]);
   offP[i].move(x[i], y[i], ang[i],i);
  }
}

