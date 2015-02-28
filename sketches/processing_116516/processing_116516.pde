
//Raven Kwok (aka Guo Ruiwen)
//EDF0
/*
 A piece from my Algorithmic Creature series based on a recursive morphing hexagon.
 You could check a higher recursive level version here -> https://vimeo.com/43752422
 Or its further study "18F44" here -> https://vimeo.com/63090665
  
 raystain@gmail.com
 ravenkwok.com
 vimeo.com/ravenkwok
 flickr.com/photos/ravenkwok
 twitter.com/ravenkwok
 weibo.com/ravenkwok
 
*/

Hexagon hxg;
float strutF, strutFIncre, rRangeF, rRangeFIncre, rRange, rnRangeF, rnRangeFIncre, rnRange;

PVector [] initVs = new PVector[6];

void setup(){
  size(600,600);
  smooth();
  frameRate(30);
  
  strutF = random(100);
  rRangeF = random(100);
  rnRangeF = random(100);
  strutFIncre = 0.01;
  rRangeFIncre = 0.01;
  rnRangeFIncre = 0.01;
  rRange = 200;
  rnRange = PI/3.0;
  
  hxg = new Hexagon(6, 0, 3);
  
  for(int i=0; i< initVs.length; i++){
    initVs[i] = new PVector(0, 0);
  }
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  updateInitVs();
  hxg.update(initVs, strutF);
  hxg.display();
  
  strutF += strutFIncre;
} 

void updateInitVs(){
  float rnIncre = PI/3.0;
  for(int i=0; i< initVs.length; i++){
    float radius = rRange+(noise(rRangeF+i*0.2)-0.5)*rRange;
    float radian = rnIncre*i+(noise(rnRangeF+i*0.2)-0.5)*rnRange;
    
    float x = cos(radian)*radius;
    float y = sin(radian)*radius;
    
    initVs[i].set(x, y);
  }
  rRangeF += rRangeFIncre;
  rnRangeF += rnRangeFIncre;
}
class Hexagon{
  
  Hexagon [] subHxgs;
  
  int index, lv, maxLv;
  float strutRatio;
  
  PVector [] outers, mids, quars, struts;
  
  Hexagon(int index, int lv, int maxLv){
    this.index = index;
    this.lv = lv;
    this.maxLv = maxLv;
    
    outers = new PVector[6];
    mids = new PVector[6];
    struts = new PVector[6];
    quars = new PVector[12];
    
    for(int i=0; i<outers.length; i++){
      outers[i] = new PVector(0, 0);
      mids[i] = new PVector(0, 0);
      struts[i] = new PVector(0, 0);
    }
    
    for(int i=0; i<quars.length; i++){
      quars[i] = new PVector(0, 0);
    }
    
    if(lv<maxLv){
      lv++;
      subHxgs = new Hexagon[7];
      for (int i=0;i<subHxgs.length;i++) {
        subHxgs[i] = new Hexagon(i, lv, maxLv);
      }
    }
  }
  
  void update(PVector [] outers, float strutF){
    this.outers = outers;
    
    for(int i=0;i<mids.length;i++){
      int j = (i+1)% mids.length;
      getInBetween(mids[i], outers[i], outers[j], 0.5);
    }
    
    for(int i=0;i<quars.length;i+=2){
      int j = (i/2+1)% mids.length;
      getInBetween(quars[i], mids[i/2], outers[j], 0.5);
      getInBetween(quars[i+1], outers[j], mids[j], 0.5);
    }
    
    for(int i=0;i<struts.length;i++){
      int j = (i+3)%6;
      strutRatio = 1-noise(strutF)*0.75;
      getInBetween(struts[i], mids[i], mids[j], strutRatio);
      strutF += 0.1;
    }
    
    if(lv<maxLv){
      strutF ++;
      subHxgs[6].update(struts, strutF);
      strutF += 0.1;
      for (int i=0;i<6;i++) {
        int j = (i+1)%6;
        int k = (i*2)%12;
        PVector [] group = {
          mids[i], quars[k], quars[k+1], mids[j], struts[j], struts[i]
        };
        subHxgs[i].update(group, strutF);
        strutF += 0.1;
      }
    }
  }
  
  void display(){
    drawHxg();
    drawSubHxgs();
  }
  
  private void getInBetween(PVector v, PVector v1, PVector v2, float ratio){
    v.set(v1.x * ratio +v2.x * (1-ratio), v1.y * ratio +v2.y * (1-ratio));
  }
  
  private void drawEdge(PVector v1, PVector v2){
    line(v1.x, v1.y, v2.x, v2.y);
  }
  
  private void drawHxg(){
    noFill();
    strokeWeight(1);
    stroke(0, 120);
    beginShape();
    for (int i=0;i<outers.length;i++) {
      vertex(outers[i].x, outers[i].y);
    }
    endShape(CLOSE);
  }
  
  private void drawSubHxgs(){
    noFill();
    strokeWeight(1);
    stroke(0, 120);
    for (int i=0;i<mids.length;i++) {
      drawEdge(mids[i], struts[i]);
    }
    for (int i=0;i<quars.length;i+=2) {
      drawEdge(quars[i], quars[i+1]);
    }
    for (int i=0;i<struts.length;i++) {
      int j = (i+1)% struts.length;
      drawEdge(struts[i], struts[j]);
    }
    if(lv<maxLv){
      for (int i=0;i<subHxgs.length;i++) {
        subHxgs[i].drawSubHxgs();
      }
    }
  }
}


