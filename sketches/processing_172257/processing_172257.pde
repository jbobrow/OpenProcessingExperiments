
float[] xs;
float[] ys;
int nTargets;
float gray = 128;
float widt = 1000;
boolean phase = true;
float greenMag = 140;
float redMag = 180;
float maskGreen = 250;
float maskRad = 60;
float maskBlur = 70;
float targRad = 40;
float targBlur = 50;
float[] intensities;

void setup(){
  size(1000,1000);
  nTargets = 3;
  resetTargetNum();
}

void resetTargetNum(){
  xs = new float[nTargets];
  ys = new float[nTargets];
  intensities = new float[nTargets-1];
  setTargets();
  setIntensities();
}

void draw(){
  background(gray);
  if(phase){
    drawMasks();
    noStroke();
    fill(255);
    ellipse(500,500,3,3);
  }else{
    drawTargets();
  }
}

void drawMasks(){
  for(int i=0;i<nTargets-1;i++){
    DrawSpot(xs[nTargets-1]-xs[i]+500,ys[nTargets-1]-ys[i]+500,maskRad,maskBlur,color(128,maskGreen,128));
  }
  DrawSpot(xs[nTargets-1],ys[nTargets-1],maskRad,maskBlur,color(128,maskGreen,128));
}

void drawTargets(){
  for(int i=0;i<nTargets-1;i++){
    DrawSpot(xs[i],ys[i],targRad,targBlur,color(intensities[i],128,128));
  }
  DrawSpot(xs[nTargets-1],ys[nTargets-1],targRad,targBlur,color(128,greenMag,128));
}

void DrawSpot(float x, float y, float rad, float blur, color col){
  float dRed = (red(col)-gray)/blur;
  float dGreen = (green(col)-gray)/blur;
  float dBlue = (blue(col)-gray)/blur;
  for(int i=0;i<blur;i++){
    color curCol = color(gray+i*dRed,gray+i*dGreen,gray+i*dBlue);
    fill(curCol);
    strokeWeight(2);
    stroke(curCol);
    ellipse(x,y,rad+blur-i,rad+blur-i);
  }
}

void Mask(){
  for(int i=0;i<200;i++){
    noStroke();
    fill(random(255));
    float rad = 100;
    ellipse(random(widt),random(widt),random(rad)+rad,random(rad)+rad);
  }
  boolean loopy = true;
  int maskTime = millis();
  while(loopy==true){
    if(millis()-maskTime>100){
      loopy=false;
    }
  }
}

void setTargets(){
  for(int i=0;i<nTargets;i++){
    xs[i] = randLoc();
    ys[i] = randLoc();
  }
  for(int i=0;i<nTargets;i++){
    float closest = closestDist(xs,ys,i);
    while(closest<100){
      xs[i] = randLoc();
      ys[i] = randLoc();
      closest = closestDist(xs,ys,i);
    }
  }
}

void setIntensities(){
  for(int i=0;i<nTargets-1;i++){
    intensities[i] = redMag+random(50)-25;
  }
}

float closestDist(float[] xs,float[] ys, int ind){
  float currClosest = 2000;
  for(int i=0;i<nTargets;i++){
    float dist = sqrt(sq(xs[i]-xs[ind])+sq(ys[i]-ys[ind]));
    if(dist<currClosest && dist!=0){
      currClosest = dist;
    }
  }
  return currClosest;
}

float randLoc(){
  return random(widt-500)+250;
}

void mousePressed(){
  phase = !phase;
  Mask();
  if(phase){
    setTargets();
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){
      nTargets = nTargets+1;
      resetTargetNum();
    }
    if(keyCode==DOWN){
      nTargets = nTargets-1;
      resetTargetNum();
      if(nTargets==1){
        nTargets=2;
      }
    }
  }
}


