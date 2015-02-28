
/* Random Shape Noise for After (Moby) music video
by Roman Random, 2011*/

float shapeShiftSpeed=0.01;    // max speed of variation
int Nshapes=200;
float sizeVar=0.01;          // max variation of size of shapes
//int changeFrame=240;//3121;        // multiple of 24+1 for proper heartbeat
boolean change = true;
float t;                        // time in frames
int bigCounter=0;
int smallCounter=0;

float[] shapeShift= new float[Nshapes];  //create array for personalized shifting
float[] xposShift= new float[Nshapes];  //create arrays for position shifting
float[] yposShift= new float[Nshapes];  //create arrays for position shifting

float[] fillYou= new float[Nshapes];
float[] scaleDown= new float[Nshapes];   // create array for initial scale downs
float[] angleStart= new float[Nshapes];   // create array for initial rotations

float[] point1x = new float[Nshapes];    // create arrays for curve points
float[] point1y = new float[Nshapes];
float[] point2x = new float[Nshapes];    
float[] point2y = new float[Nshapes];
float[] point3x = new float[Nshapes];    
float[] point3y = new float[Nshapes];
float[] point4x = new float[Nshapes];    
float[] point4y = new float[Nshapes];
float[] point5x = new float[Nshapes];    
float[] point5y = new float[Nshapes];
float[] point6x = new float[Nshapes];    
float[] point6y = new float[Nshapes];

float[] positionX= new float[Nshapes];  // create arrays for shape positions
float[] positionY= new float[Nshapes];  

int count = 0;

void setup(){
size(480,270);
smooth();
frameRate(24);

for (int i=0; i < Nshapes; i++) {        // Fill with random positions
  positionX[i]= random(width*1.5);
  positionY[i]= random(height*1.5);
}

for (int i=0; i < Nshapes; i++) {        // Fill with random points
point1x[i]= random(0,width*2/4);
point1y[i]= random(-height*3/4,-height*1/4);
point2x[i]= random(0,width*3/4);
point2y[i]= random(-height*1/4,height*1/4);
point3x[i]= random(0,width*2/4);
point3y[i]= random(height*1/4,height*3/4);
point4x[i]= random(-width*2/4,0);
point4y[i]= random(height*1/4,height*3/4);
point5x[i]= random(-width*3/4,0);
point5y[i]= random(-height*1/4,height*1/4);
point6x[i]= random(-width*2/4,0);
point6y[i]= random(-height*3/4,-height*1/4);
  }
}

void draw(){

background(0);
noStroke();
t=frameCount;      // time in frames

// draw shapes
for (int i=0; i < Nshapes; i++) { 
  
  shapeShift[i]+=random(shapeShiftSpeed);
  xposShift[i]+=random(shapeShiftSpeed*10);
  yposShift[i]+=random(shapeShiftSpeed*10);
  
  positionX[i]+=noise(xposShift[i])-0.5;          // Update position of shapes  
  positionY[i]+=noise(yposShift[i])-0.5;
  
  pushMatrix();
  translate(positionX[i],positionY[i]);    // Translate to random position
  
  if (t==1){
    fillYou[i]=random(0,255);              // set initial fill
    scaleDown[i]=random(0.001,0.005);
    angleStart[i]=random(TWO_PI);
    fill(fillYou[i]);
    scale(scaleDown[i]);                      // Scale and rotate randomly the first time
    rotate(angleStart[i]);                        
  }else if (!change){                          // behaviour before specified frame
    fillYou[i]+=(noise(shapeShift[i])-0.5);
    scaleDown[i]+=(noise(shapeShift[i])-0.5)/(100/sizeVar);     
    angleStart[i]+=(noise(shapeShift[i])-0.5)*0.2;
    fill(fillYou[i]);
    scale(scaleDown[i]);
    rotate(angleStart[i]);
  }else{
    count++;
    fillYou[i]+=0.00005*pow(count * .01,2);      // Exponential growth and brightening 
    scaleDown[i]+=0.0000001*pow(count * .01,2);
    angleStart[i]+=noise(shapeShift[i]/10)*0.02;
    if (fillYou[i] > 255){
      fill(255);
    }else{
        fill(fillYou[i]);
      }
    //println(frameCount-changeFrame);
    scale(scaleDown[i]*map(heart(0),-1,0,0.7,1));
    rotate(angleStart[i]);
  }
    //println(heart(0));
    point1x[i]+=random(-16/3,16/3);    // update shape of shapes
    point1y[i]+=random(-9/3,9/3);
    point2x[i]+=random(-16/3,16/3);
    point2y[i]+=random(-9/3,9/3);
    point3x[i]+=random(-16/3,16/3);
    point3y[i]+=random(-9/3,9/3);
    point4x[i]+=random(-16/3,16/3);
    point4y[i]+=random(-9/3,9/3);
    point5x[i]+=random(-16/3,16/3);
    point5y[i]+=random(-9/3,9/3);
    point6x[i]+=random(-16/3,16/3);
    point6y[i]+=random(-9/3,9/3);
    
    beginShape();
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point2x[i],point2y[i]);
    curveVertex(point3x[i],point3y[i]);
    curveVertex(point4x[i],point4y[i]);
    curveVertex(point5x[i],point5y[i]);
    curveVertex(point6x[i],point6y[i]);
    curveVertex(point1x[i],point1y[i]);
    curveVertex(point1x[i],point1y[i]);
    endShape();
  popMatrix();
}
}

// love function

float heart(float beat){        
   float bT=1;
   float sT=bT/2;
   float bF=4;
   float sF=bF*2;
   float tSec;
   float pt;
   float bigBeat;
   float smallBeat;
   float pBigBeat;
   float pSmallBeat;
      
   tSec=t/24;
   pt=(t-1)/24;
   
   bigBeat=sin(TWO_PI*tSec/bT);
   pBigBeat=sin(TWO_PI*pt/bT);
   
   if (bigBeat>=0 && pBigBeat<=0 && bigBeat!=pBigBeat) {bigCounter++;}
   if (bigBeat<=0 && pBigBeat>=0 && bigBeat!=pBigBeat) {bigCounter++;}
  
   smallBeat=sin(TWO_PI*tSec/sT+PI);
   pSmallBeat=sin(TWO_PI*pt/sT+PI);
   if (smallBeat>=0 && pSmallBeat<=0 && smallBeat!=pSmallBeat){smallCounter++;}
   if (smallBeat<=0 && pSmallBeat>=0 && smallBeat!=pSmallBeat){smallCounter++;}
  
   if ((bigCounter/Nshapes)
