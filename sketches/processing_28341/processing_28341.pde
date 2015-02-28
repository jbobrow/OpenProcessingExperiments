
 float bT=0.6;
 float sT=0.3;
 float bF=4;
 float sF=8;
 float frame;
 float t;
 float pt;
 float bigBeat;
 float smallBeat;
 float pBigBeat;
 float pSmallBeat;
 int bigCounter;
 int smallCounter;
  
void setup(){
  size(200,200);
  smooth();
  background(255);
  frameRate(24);
  
}

void draw(){
  fill(255,100);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  fill(200,20,10);
  noStroke();
  frame=frameCount;
  t=frame/24;
  pt=(frame-1)/24;
  
  bigBeat=sin(TWO_PI*t/bT);
  pBigBeat=sin(TWO_PI*pt/bT);
  if (bigBeat>=0 && pBigBeat<=0 && bigBeat!=pBigBeat) {bigCounter++;}
  if (bigBeat<=0 && pBigBeat>=0 && bigBeat!=pBigBeat) {bigCounter++;}
  
  smallBeat=sin(TWO_PI*t/sT+PI);
  pSmallBeat=sin(TWO_PI*pt/sT+PI);
  if (smallBeat>=0 && pSmallBeat<=0 && smallBeat!=pSmallBeat){smallCounter++;}
  if (smallBeat<=0 && pSmallBeat>=0 && smallBeat!=pSmallBeat){smallCounter++;}
  
  if (bigCounter%bF==0){ellipse(100,100,100+bigBeat*30,100+bigBeat*25);}
  else 
  if (smallCounter%sF==0){ellipse(100,100,100+smallBeat*10,100+smallBeat*8);}
  else {ellipse(100,100,100,100);}
}
  
    
    
    
  
  
  
  
  

