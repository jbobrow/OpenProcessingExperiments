
// Art Machine - Bezier auto painter
// 2010 / Jesper Birk / Buddha Graphix / http://www.graphix.dk/
// Dedikeret til min egen Kiddo


setUps setups = new setUps();


///////////////////////////////////////////////

// POINT SPEEDS
float MaxXpointSpeed = 3;
float MaxYpointSpeed = 3;
float MinXpointSpeed = .5;
float MinYpointSpeed = .5;
float MaxXpointHandleSpeed = 10;
float MaxYpointHandleSpeed = 10;
float MinXpointHandleSpeed = .5;
float MinYpointHandleSpeed = .5;

int numberOfCurves = 5;

// CURVE COLORS
float curveR = 0, curveG = 0, curveB = 0, curveAplha = 150;
float curveColorSteps = 0;
float curveRb = 255, curveGb = 255, curveBb = 0;
boolean randomCurveColor = false;

// HANDLE COLORS
float handleR = 0, handleG = 0, handleB = 0, handleAlpha = 25;
float handleRb = 0, handleGb = 0, handleBb = 255;
float handleColorSteps = 0;
boolean randomHandleColor = false;

// STROKE WIDTHs
float curveStroke = 2;
float handleStroke = 1;

float curveSpace = 1.3;
float handleSpace = 1;

// CURVE FILL COLORS
int curveFillR = 255, curveFillG = 255, curveFillB = 255, curveFillAlpha = 25;
int curveFillRb = 0, curveFillGb = 50, curveFillBb = 50;
float curveFillColorSteps = 0;
boolean randomCurveFillColor = false;

boolean randomChange = true;
int randomChangeValue = 1000; // less is more
boolean randomChangeBothXandYtogether = true;

boolean drop = true;

int canvasR = 255, canvasG = 255, canvasB = 255, canvasAlpha = 0;
int setBackground = (255);  // in case canvasAlpha is 0

float handleEllipseWidth = 15;
float handleEllipseStrokeWidth = 2;
float handleEllipseR = 5, handleEllipseG = 255, handleEllipseB = 5, handleEllipseAlpha =   0;
float handleEllipseFillR = 0, handleEllipseFillG = 0, handleEllipseFillB = 0, handleEllipseFillAlpha = 0;

float handleRectWidth = 15; 
float handleRectStrokeWidth = 2; 
float handleRectColR = 5, handleRectColG = 5, handleRectColB = 255, handleRectColAlpha = 0;
float handleRectColFillR = 255, handleRectColFillG = 5, handleRectColFillB = 255, handleRectColFillAlpha = 0;


boolean divineProportions = true;
float divineProportionsAttraction = 7;  // less is more
boolean divine1 = true;
boolean divine2 = true;
boolean divine3 = false;
boolean divine4 = false;

boolean perlin = true;

int noiseDetailOctaves = 2;
int noiseDetailFalloff = 1;
float waveSpanScalePointsX = 0;  // times point speed
float waveSpanScalePointsY = 0;  // times point speed
float waveSpanScaleHandlesX = 10;  // times point speed
float waveSpanScaleHandlesY = 8;  // times point speed
float wobblePointAx = .01;
float wobblePointAy = .02;
float wobblePointBx = .005;
float wobblePointBy = .01;

float wobbleHandleAx = .02;
float wobbleHandleAy = .01;
float wobbleHandleBx = .009;
float wobbleHandleBy = .015;
///////////////////////////////////////////////



    
int myWidth = 1280;  // disabled in online version
int myHeight = 720;  // disabled in online version

float scaleValues = 1;

boolean saveFrames = false;
int saveInterval = 0;


///////////////////////////////////





//////////////////////////////




float[]speedNoiseAx = new float[numberOfCurves];
float[]speedNoiseAy = new float[numberOfCurves];
float[]speedNoiseBx = new float[numberOfCurves];
float[]speedNoiseBy = new float[numberOfCurves];
float[]speedNoiseHandleAx = new float[numberOfCurves];
float[]speedNoiseHandleAy = new float[numberOfCurves];
float[]speedNoiseHandleBx = new float[numberOfCurves];
float[]speedNoiseHandleBy = new float[numberOfCurves];

float[]xNoiseA = new float[numberOfCurves];
float[]yNoiseA = new float[numberOfCurves];
float[]xNoiseB = new float[numberOfCurves];
float[]yNoiseB = new float[numberOfCurves];

float[]xNoiseHandleA = new float[numberOfCurves];
float[]yNoiseHandleA = new float[numberOfCurves];
float[]xNoiseHandleB = new float[numberOfCurves];
float[]yNoiseHandleB = new float[numberOfCurves];





int saveCount;
boolean SAVING;
int imageCount = 0;
int saveCounter = 0;
int curveColorCounter = 0;
int curveFillColorCounter = 0;
int handleColorCounter = 0;

float[]xspeedA = new float[numberOfCurves];
float[]yspeedA= new float[numberOfCurves];
float[]xposA = new float[numberOfCurves];
float[]yposA = new float[numberOfCurves];

float[]xspeedHandleA = new float[numberOfCurves];
float[]yspeedHandleA = new float[numberOfCurves];
float[]xposHandleA = new float[numberOfCurves];
float[]yposHandleA = new float[numberOfCurves];

float[]xspeedB = new float[numberOfCurves];
float[]yspeedB= new float[numberOfCurves];
float[]xposB = new float[numberOfCurves];
float[]yposB = new float[numberOfCurves];

float[]xspeedHandleB = new float[numberOfCurves];
float[]yspeedHandleB = new float[numberOfCurves];
float[]xposHandleB = new float[numberOfCurves];
float[]yposHandleB = new float[numberOfCurves];

float divineX1, divineX2, divineY1, divineY2;


float ignore;

float phi = 1.61803;

float curveMarginW, curveMarginH, handleMarginW, handleMarginH;

float curveRcircle, curveGcircle, curveBcircle;
float curveColorDistanceR, curveColorDistanceG, curveColorDistanceB;
float curveColorStepLengthR, curveColorStepLengthG, curveColorStepLengthB;

float handleRcircle, handleGcircle, handleBcircle;
float handleColorDistanceR, handleColorDistanceG, handleColorDistanceB;
float handleColorStepLengthR, handleColorStepLengthG, handleColorStepLengthB;

float curveFillRcircle, curveFillGcircle, curveFillBcircle;
float curveFillColorDistanceR, curveFillColorDistanceG, curveFillColorDistanceB;
float curveFillColorStepLengthR, curveFillColorStepLengthG, curveFillColorStepLengthB;
////////////////////////////////////////////////////////////////////////


void setup() {

  
//  size(myWidth,myHeight);  // disabled in online version
  size(700,450);
  background(setBackground);
  smooth();
  curveMarginW = ((width*curveSpace)-width)/2;
  curveMarginH = ((height*curveSpace)-height)/2;
  handleMarginW = ((width*handleSpace)-width)/2;
  handleMarginH = ((height*handleSpace)-height)/2;


// scale values
  MaxXpointSpeed *=scaleValues;
MaxYpointSpeed *=scaleValues;
MinXpointSpeed *=scaleValues;
MinYpointSpeed *=scaleValues;
MaxXpointHandleSpeed *=scaleValues;
MaxYpointHandleSpeed *=scaleValues;
MinXpointHandleSpeed *=scaleValues;
MinYpointHandleSpeed *=scaleValues;
curveStroke *=scaleValues;
handleStroke *=scaleValues;
handleEllipseWidth *=scaleValues;
handleEllipseStrokeWidth *=scaleValues;
handleRectWidth *=scaleValues;
handleRectStrokeWidth *=scaleValues;


  divineX1 = width-width/phi;
  divineX2 = width-divineX1;
  divineY1 = height-height/phi;
  divineY2 = height-divineX1;

  // set initial curve colour
  curveRcircle = curveR;
  curveGcircle = curveG;
  curveBcircle = curveB; 
  curveColorStepLengthR = curveR-curveRb;
  curveColorStepLengthR = (curveColorStepLengthR/curveColorSteps);
  curveColorStepLengthG = curveG-curveGb;
  curveColorStepLengthG = (curveColorStepLengthG/curveColorSteps);
  curveColorStepLengthB = curveB-curveBb;
  curveColorStepLengthB = (curveColorStepLengthB/curveColorSteps);
  
    // set initial curve fill colour
  curveFillRcircle = curveFillR;
  curveFillGcircle = curveFillG;
  curveFillBcircle = curveFillB; 
  curveFillColorStepLengthR = curveFillR-curveFillRb;
  curveFillColorStepLengthR = (curveFillColorStepLengthR/curveFillColorSteps);
  curveFillColorStepLengthG = curveFillG-curveFillGb;
  curveFillColorStepLengthG = (curveFillColorStepLengthG/curveFillColorSteps);
  curveFillColorStepLengthB = curveFillB-curveFillBb;
  curveFillColorStepLengthB = (curveFillColorStepLengthB/curveFillColorSteps);


  // set initial handle colour
  handleRcircle = handleR;
  handleGcircle = handleG;
  handleBcircle = handleB; 
  handleColorStepLengthR = handleR-handleRb;
  handleColorStepLengthR = (handleColorStepLengthR/handleColorSteps);
  handleColorStepLengthG = handleG-handleGb;
  handleColorStepLengthG = (handleColorStepLengthG/handleColorSteps);
  handleColorStepLengthB = handleB-handleBb;
  handleColorStepLengthB = (handleColorStepLengthB/handleColorSteps);


  // set start points and speeds
  for (int i= 0; i< numberOfCurves; i++){
    // set varied point speed
    xspeedA[i] = random(MinXpointSpeed,MaxXpointSpeed);
    yspeedA[i] = random(MinYpointSpeed,MaxYpointSpeed);
    xspeedB[i] = random(MinXpointSpeed,MaxXpointSpeed);
    yspeedB[i] = random(MinYpointSpeed,MaxYpointSpeed);

    // random start directions
    if (random(2)<1){ 
      xspeedA[i]*=-1; 
    }
    if (random(10)<5){ 
      yspeedA[i]*=-1; 
    }
    if (random(20)<10){ 
      xspeedB[i]*=-1; 
    }
    if (random(30)<15){ 
      yspeedB[i]*=-1; 
    }
    
    // set initial point placement  

    xposA[i] = random(-curveMarginW,(width+curveMarginW));
    yposA[i] = random(-curveMarginH,(height+curveMarginH));
    xposB[i] = random(-curveMarginW,(width+curveMarginW));
    yposB[i] = random(-curveMarginH,(height+curveMarginH));   
    float testA = (0-curveMarginW);
    float testB = width+curveMarginW;

    if (drop){
      xposB[i] = xposA[i];
      yposB[i] = yposA[i];
    }
    // handles
    // set varied point speed
    xspeedHandleA[i] = random(MinXpointHandleSpeed,MaxXpointHandleSpeed);
    yspeedHandleA[i] = random(MinYpointHandleSpeed,MaxYpointHandleSpeed);
    xspeedHandleB[i] = random(MinXpointHandleSpeed,MaxXpointHandleSpeed);
    yspeedHandleB[i] = random(MinYpointHandleSpeed,MaxYpointHandleSpeed);
    // random start directions
    if (random(2)<1){ 
      xspeedHandleA[i]*=-1; 
    }
    if (random(10)<5){ 
      yspeedHandleA[i]*=-1; 
    }
    if (random(20)<10){ 
      xspeedHandleB[i]*=-1; 
    }
    if (random(30)<15){ 
      yspeedHandleB[i]*=-1; 
    }
    // set initial point placement  
    xposHandleA[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleA[i] = random(-handleMarginH,(height+handleMarginH));
    xposHandleB[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleB[i] = random(-handleMarginH,(height+handleMarginH)); 


  }
  } // end setup



////////////////////////////////////////////////////////////////////////////////////////////////


void draw() {

  noStroke();
  fill(canvasR,canvasG,canvasB,canvasAlpha);
  rect(0, 0, width*2, height*2);
  noFill();


  for (int i= 0; i< numberOfCurves; i++){

    stroke(curveRcircle,curveGcircle,curveBcircle,curveAplha);
    strokeWeight(curveStroke);


    fill(curveFillRcircle,curveFillGcircle,curveFillBcircle,curveFillAlpha);

    // draw curve
    //bezier(xpos[1], ypos[1], xpos[2], ypos[2], xpos[3], ypos[3], xpos[4], ypos[4]);
    bezier(xposA[i], yposA[i], xposHandleA[i], yposHandleA[i], xposHandleB[i], yposHandleB[i], xposB[i], yposB[i]);

    //draw handles

    stroke(handleRcircle,handleGcircle,handleBcircle,handleAlpha);
    strokeWeight(handleStroke);
    //line(xpos[1], ypos[1], xpos[2], ypos[2]);
    //line(xpos[3], ypos[3], xpos[4], ypos[4]);

    line(xposA[i], yposA[i], xposHandleA[i], yposHandleA[i]);
    line(xposHandleB[i], yposHandleB[i], xposB[i], yposB[i]);

    //control points
        stroke(handleEllipseR, handleEllipseG, handleEllipseB, handleEllipseAlpha);
        strokeWeight(handleEllipseStrokeWidth);
        fill(handleEllipseFillR, handleEllipseFillG, handleEllipseFillB, handleEllipseFillAlpha);
          ellipse(xposA[i], yposA[i], handleEllipseWidth, handleEllipseWidth);
       stroke(0, handleEllipseAlpha);
          ellipse(xposB[i], yposB[i], handleEllipseWidth, handleEllipseWidth);

    //anchor points
    rectMode(CENTER);
    stroke(handleRectColR, handleRectColG, handleRectColB, handleRectColAlpha);
    strokeWeight(handleEllipseStrokeWidth);
    fill(handleRectColFillR, handleRectColFillG, handleRectColFillB, handleRectColFillAlpha);
      rect(xposHandleA[i], yposHandleA[i], handleEllipseWidth, handleEllipseWidth);
      rect(xposHandleB[i], yposHandleB[i], handleEllipseWidth, handleEllipseWidth);
    noStroke();
    noFill();
    


    //upgrade position values
    xposA[i]+=xspeedA[i];
    yposA[i]+=yspeedA[i]; 
    xposB[i]+=xspeedB[i];
    yposB[i]+=yspeedB[i]; 

    xposHandleA[i]+=xspeedHandleA[i];
    yposHandleA[i]+=yspeedHandleA[i]; 
    xposHandleB[i]+=xspeedHandleB[i];
    yposHandleB[i]+=yspeedHandleB[i]; 

    
   ////////////////   PERLIN
   if (perlin){
          noiseDetail(noiseDetailOctaves,noiseDetailFalloff);
          speedNoiseAx[i] += wobblePointAx; 
          xNoiseA[i] = (noise(xNoiseA[i])*(xspeedA[i]*waveSpanScalePointsX))-((xspeedA[i]*waveSpanScalePointsX)/2);
          yNoiseA[i] = (noise(yNoiseA[i])*(yspeedA[i]*waveSpanScalePointsY))-((yspeedA[i]*waveSpanScalePointsY)/2);
          xposA[i]+=xNoiseA[i];
          yposA[i]+=yNoiseA[i]; 
          
          speedNoiseBx[i] += wobblePointBx; 
          xNoiseB[i] = (noise(xNoiseB[i])*(xspeedB[i]*waveSpanScalePointsX))-((xspeedA[i]*waveSpanScalePointsX)/2);
          yNoiseB[i] = (noise(yNoiseB[i])*(yspeedB[i]*waveSpanScalePointsY))-((yspeedA[i]*waveSpanScalePointsY)/2);
          xposB[i]+=xNoiseB[i];
          yposB[i]+=yNoiseB[i]; 
          
          speedNoiseHandleAx[i] += wobbleHandleAx; 
          xNoiseHandleA[i] = (noise(xNoiseHandleA[i])*(xspeedHandleA[i]*waveSpanScaleHandlesX))-((xspeedHandleA[i]*waveSpanScaleHandlesX)/2);
          yNoiseHandleA[i] = (noise(yNoiseHandleA[i])*(yspeedHandleA[i]*waveSpanScalePointsY))-((yspeedHandleA[i]*waveSpanScalePointsY)/2);
          xposHandleA[i]+=xNoiseHandleA[i];
          yposHandleA[i]+=yNoiseHandleA[i]; 
          
          speedNoiseHandleBx[i] += wobbleHandleBx; 
          xNoiseHandleB[i] = (noise(xNoiseHandleB[i])*(xspeedHandleB[i]*waveSpanScaleHandlesX))-((xspeedHandleB[i]*waveSpanScaleHandlesX)/2);
          yNoiseHandleB[i] = (noise(yNoiseHandleB[i])*(yspeedHandleB[i]*waveSpanScalePointsY))-((yspeedHandleB[i]*waveSpanScalePointsY)/2);
          xposHandleB[i]+=xNoiseHandleB[i];
          yposHandleB[i]+=yNoiseHandleB[i]; 
          
          
 //         print (yNoiseA[i]);
 //         print ("  ");
   }
     ////////////////   PERLIN
   
   
   



    // divine attraction

    if (divineProportions && random(divineProportionsAttraction)<1){

      if (divine1 && xposA[i]<width/2 && yposA[i]<height/2){   /// kvadrat 1
        if (xposA[i] < divineX1 && xspeedA[i] < 0){  
          xspeedA[i]*=-1; 
          xposA[i]+=1; 
        }
        if (xposA[i] < width/2 && xposA[i]>divineX1 && xspeedA[i] > 0){  
          xspeedA[i]*=-1; 
          xposA[i]-=1; 
        }
        if (yposA[i] < divineY1 && yspeedA[i] < 0){  
          yspeedA[i]*=-1; 
          yposA[i]+=1;
        }
        if (yposA[i] < height/2 && yposA[i]>divineY1 && xspeedA[i] > 0){  
          yspeedA[i]*=-1; 
          yposA[i]-=1;
        }
      }


      if (divine2 && xposA[i]>width/2 && yposA[i]<height/2){   /// kvadrat 2
        if (xposA[i] > divineX2 && xspeedA[i] > 0){  
          xspeedA[i]*=-1; 
          xposA[i]-=1; 
        }
        if (xposA[i] > width/2 && xposA[i]<divineX2 && xspeedA[i] < 0){  
          xspeedA[i]*=-1; 
          xposA[i]+=1; 
        }
        if (yposA[i] < divineY1 && yspeedA[i] < 0){  
          yspeedA[i]*=-1; 
          yposA[i]+=1;
        }
        if (yposA[i] < height/2 && yposA[i]>divineY1 && xspeedA[i] > 0){  
          yspeedA[i]*=-1; 
          yposA[i]-=1;
        }
      }


      if (divine3 && xposA[i]<width/2 && yposA[i]>height/2){   /// kvadrat 3
        if (xposA[i] < divineX1 && xspeedA[i] < 0){  
          xspeedA[i]*=-1; 
          xposA[i]+=1; 
        }
        if (xposA[i] < width/2 && xposA[i]>divineX1 && xspeedA[i] > 0){  
          xspeedA[i]*=-1; 
          xposA[i]-=1; 
        }
        if (yposA[i] > divineY2 && yspeedA[i] > 0){  
          yspeedA[i]*=-1; 
          yposA[i]-=1;
        }
        if (yposA[i] > height/2 && yposA[i]<divineY2 && xspeedA[i] < 0){  
          yspeedA[i]*=-1; 
          yposA[i]+=1;
        }
      }


      if (divine4 && xposA[i]>width/2 && yposA[i]>height/2){   /// kvadrat 4
        if (xposA[i] > divineX2 && xspeedA[i] > 0){  
          xspeedA[i]*=-1; 
          xposA[i]-=1; 
        }
        if (xposA[i] > width/2 && xposA[i]<divineX2 && xspeedA[i] < 0){  
          xspeedA[i]*=-1; 
          xposA[i]+=1; 
        }
        if (yposA[i] > divineY2 && yspeedA[i] > 0){  
          yspeedA[i]*=-1; 
          yposA[i]-=1;
        }
        if (yposA[i] > height/2 && yposA[i]<divineY2 && xspeedA[i] < 0){  
          yspeedA[i]*=-1; 
          yposA[i]+=1;
        }
      }




      if (divine1 && xposB[i]<width/2 && yposB[i]<height/2){   /// kvadrat 1
        if (xposB[i] < divineX1 && xspeedB[i] < 0){  
          xspeedB[i]*=-1; 
          xposB[i]+=1; 
        }
        if (xposB[i] < width/2 && xposB[i]>divineX1 && xspeedB[i] > 0){  
          xspeedB[i]*=-1; 
          xposB[i]-=1; 
        }
        if (yposB[i] < divineY1 && yspeedB[i] < 0){  
          yspeedB[i]*=-1; 
          yposB[i]+=1;
        }
        if (yposB[i] < height/2 && yposB[i]>divineY1 && xspeedB[i] > 0){  
          yspeedB[i]*=-1; 
          yposB[i]-=1;
        }
      }


      if (divine2 && xposB[i]>width/2 && yposB[i]<height/2){   /// kvadrat 2
        if (xposB[i] > divineX2 && xspeedB[i] > 0){  
          xspeedB[i]*=-1; 
          xposB[i]-=1; 
        }
        if (xposB[i] > width/2 && xposB[i]<divineX2 && xspeedB[i] < 0){  
          xspeedB[i]*=-1; 
          xposB[i]+=1; 
        }
        if (yposB[i] < divineY1 && yspeedB[i] < 0){  
          yspeedB[i]*=-1; 
          yposB[i]+=1;
        }
        if (yposB[i] < height/2 && yposB[i]>divineY1 && xspeedB[i] > 0){  
          yspeedB[i]*=-1; 
          yposB[i]-=1;
        }
      }


      if (divine3 && xposB[i]<width/2 && yposB[i]>height/2){   /// kvadrat 3
        if (xposB[i] < divineX1 && xspeedB[i] < 0){  
          xspeedB[i]*=-1; 
          xposB[i]+=1; 
        }
        if (xposB[i] < width/2 && xposB[i]>divineX1 && xspeedB[i] > 0){  
          xspeedB[i]*=-1; 
          xposB[i]-=1; 
        }
        if (yposB[i] > divineY2 && yspeedB[i] > 0){  
          yspeedB[i]*=-1; 
          yposB[i]-=1;
        }
        if (yposB[i] > height/2 && yposB[i]<divineY2 && xspeedB[i] < 0){  
          yspeedB[i]*=-1; 
          yposB[i]+=1;
        }
      }


      if (divine4 && xposB[i]>width/2 && yposB[i]>height/2){   /// kvadrat 4
        if (xposB[i] > divineX2 && xspeedB[i] > 0){  
          xspeedB[i]*=-1; 
          xposB[i]-=1; 
        }
        if (xposB[i] > width/2 && xposB[i]<divineX2 && xspeedB[i] < 0){  
          xspeedB[i]*=-1; 
          xposB[i]+=1; 
        }
        if (yposB[i] > divineY2 && yspeedB[i] > 0){  
          yspeedB[i]*=-1; 
          yposB[i]-=1;
        }
        if (yposB[i] > height/2 && yposB[i]<divineY2 && xspeedB[i] < 0){  
          yspeedB[i]*=-1; 
          yposB[i]+=1;
        }
      }

    }


    /////////////////////////
    
    
    // detects collision with edge of paint space
    ///  THIS CAN BE DONE SO MUCH MORE ELEGANT


    if (xposA[i] < (0-curveMarginW)){
    if (xspeedA[i]<0){  xspeedA[i]*=-1;  }
      xposA[i] = 0-curveMarginW;
        }
    if(xposA[i]>(width+curveMarginW)){
    if (xspeedA[i]>0){  xspeedA[i]*=-1;  }
      xposA[i] = width+curveMarginW;
    }      



    
    if (yposA[i] < (0-curveMarginH)){
    if (yspeedA[i]<0){  yspeedA[i]*=-1; }
      yposA[i] = 0-curveMarginH;
    }
    if (yposA[i]>(height+curveMarginH)){
    if (yspeedA[i]>0){  yspeedA[i]*=-1;}
      yposA[i] = height+curveMarginH;
    }


    if (randomChange){
      if (random(randomChangeValue)<1){
        xspeedA[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          yspeedA[i]*=-1; 
        }
      }
      if (random(randomChangeValue)<1){
        yspeedA[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          xspeedA[i]*=-1; 
        }
      }
    }

    if (xposB[i] < (0-curveMarginW)){
    if (xspeedB[i]<0){  xspeedB[i]*=-1;  }
      xposB[i] = 0-curveMarginW;
        }
    if(xposB[i]>(width+curveMarginW)){
    if (xspeedB[i]>0){  xspeedB[i]*=-1;  }
      xposB[i] = width+curveMarginW;
    }      



    
    if (yposB[i] < (0-curveMarginH)){
    if (yspeedB[i]<0){  yspeedB[i]*=-1; }
      yposB[i] = 0-curveMarginH;
    }
    if (yposB[i]>(height+curveMarginH)){
    if (yspeedB[i]>0){  yspeedB[i]*=-1;}
      yposB[i] = height+curveMarginH;
    }


    if (randomChange){
      if (random(randomChangeValue)<1){
        xspeedB[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          yspeedB[i]*=-1; 
        }
      }
      if (random(randomChangeValue)<1){
        yspeedB[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          xspeedB[i]*=-1; 
        }
      }
    }


    //////////////////////////
    /// handles

    if (xposHandleA[i] < (0-handleMarginW)){
       if(xspeedHandleA[i] < 0) {  xspeedHandleA[i]*=-1;  }
       xposHandleA[i] = 0-handleMarginW;
    }
       
    if (xposHandleA[i] > (width+handleMarginW)){
      if(xspeedHandleA[i] > 0) {  xspeedHandleA[i]*=-1;  }
      xposHandleA[i] = width+handleMarginW;
    }
    
    if (yposHandleA[i] < (0-handleMarginH)){
        if(yspeedHandleA[i] < 0) {  yspeedHandleA[i]*=-1;  }
      yposHandleA[i] = 0-handleMarginH;
    }     
    if (yposHandleA[i] > (height+handleMarginH)){
          if(yspeedHandleA[i] > 0) {  yspeedHandleA[i]*=-1;  }  
          yposHandleA[i] = height+handleMarginH;
    }


    if (randomChange){
      if (random(randomChangeValue)<1){
        xspeedHandleA[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          yspeedHandleA[i]*=-1; 
        }
      }
      if (random(randomChangeValue)<1){
        yspeedHandleA[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          xspeedHandleA[i]*=-1; 
        }
      }
    }

    /////////////////

    if (xposHandleB[i] < (0-handleMarginW)){
       if(xspeedHandleB[i] < 0) {  xspeedHandleB[i]*=-1;  }
       xposHandleB[i] = 0-handleMarginW;
    }
       
    if (xposHandleB[i] > (width+handleMarginW)){
      if(xspeedHandleB[i] > 0) {  xspeedHandleB[i]*=-1;  }
      xposHandleB[i] = width+handleMarginW;
    }
    
    if (yposHandleB[i] < (0-handleMarginH)){
        if(yspeedHandleB[i] < 0) {  yspeedHandleB[i]*=-1;  }
      yposHandleB[i] = 0-handleMarginH;
    }     
    if (yposHandleB[i] > (height+handleMarginH)){
          if(yspeedHandleB[i] > 0) {  yspeedHandleB[i]*=-1;  }  
          yposHandleB[i] = height+handleMarginH;
    }

    if (randomChange){
      if (random(randomChangeValue)<1){
        xspeedHandleB[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          yspeedHandleB[i]*=-1; 
        }
      }
      if (random(randomChangeValue)<1){
        yspeedHandleB[i]*=-1;
        if (randomChangeBothXandYtogether){ 
          xspeedHandleB[i]*=-1; 
        }
      }
    }


    if (drop){
      xposB[i] = xposA[i];
      yposB[i] = yposA[i];
    }
  }  // end possition update

  ////////////////////////

  // Update Colors

  if (curveColorSteps>0 && !randomCurveColor){  
    curveColorCounter++;
    curveRcircle -= curveColorStepLengthR;
    curveGcircle -= curveColorStepLengthG;
    curveBcircle -= curveColorStepLengthB;

    if (curveColorCounter>=curveColorSteps){
      curveColorCounter = 0;
      curveColorStepLengthR*=-1; 
      curveColorStepLengthG*=-1; 
      curveColorStepLengthB*=-1; 
    }
  } 

  if (randomCurveColor){
    if(curveR<curveRb){ curveRcircle = random(curveR,curveRb); }
    else {  curveRcircle = random(curveRb,curveR); }
    if(curveG<curveGb){ curveGcircle = random(curveG,curveGb); } 
    else { curveGcircle = random(curveGb,curveG); }
    if(curveB<curveBb){ curveBcircle = random(curveB,curveBb); }
   else { curveBcircle = random(curveBb,curveB);  }
  }
  
  ///////
  
    if (curveFillColorSteps>0 && !randomCurveFillColor){  
    curveFillColorCounter++;
    curveFillRcircle -= curveFillColorStepLengthR;
    curveFillGcircle -= curveFillColorStepLengthG;
    curveFillBcircle -= curveFillColorStepLengthB;

    if (curveFillColorCounter>=curveFillColorSteps){
      curveFillColorCounter = 0;
      curveFillColorStepLengthR*=-1; 
      curveFillColorStepLengthG*=-1; 
      curveFillColorStepLengthB*=-1; 
    }
  } 

  if (randomCurveFillColor){
    curveFillRcircle = random(curveFillR,curveFillRb);
    curveFillGcircle = random(curveFillG,curveFillGb);
    curveFillBcircle = random(curveFillB,curveFillBb); 
  }
 
  
  ///////
  
    if (handleColorSteps>0 && !randomHandleColor){  
    handleColorCounter++;
    handleRcircle -= handleColorStepLengthR;
    handleGcircle -= handleColorStepLengthG;
    handleBcircle -= handleColorStepLengthB;

    if (handleColorCounter>=handleColorSteps){
      handleColorCounter = 0;
      handleColorStepLengthR*=-1; 
      handleColorStepLengthG*=-1; 
      handleColorStepLengthB*=-1; 
    }
  } 

  if (randomHandleColor){
    handleRcircle = random(handleR,handleRb);
    handleGcircle = random(handleG,handleGb);
    handleBcircle = random(handleB,handleBb); 
  }

  /// Frame save function
  saveCounter+=1;
  if (saveCounter >= saveInterval){
    saveCounter = 0;
    if (saveFrames || SAVING){
      saveFrame( "images/image_" + imageCount + ".png" );
      imageCount ++; 
    }
  }


} //end draw


////////////////////////////////////////////////////////////////////////////////////////////////


// reset to white canvas
void reset(){ 
  fill(setBackground);
  noStroke();
  rect(0, 0, width*2, height*2);
  noFill();
  for (int i= 0; i< numberOfCurves; i++){
    //    xposA[i] = width/2;
    xposA[i] = random(-curveMarginW,(width+curveMarginW));
    yposA[i] = random(-curveMarginH,(height+curveMarginH));
    xposB[i] = random(-curveMarginW,(width+curveMarginW));
    yposB[i] = random(-curveMarginH,(height+curveMarginH));   
    xposHandleA[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleA[i] = random(-handleMarginH,(height+handleMarginH));
    xposHandleB[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleB[i] = random(-handleMarginH,(height+handleMarginH)); 

    if (drop){
      xposB[i] = xposA[i];
      yposB[i] = yposA[i];
    }
  }
}



    
void keyPressed(){    
  if(key == 'S' )
    SAVING       = !SAVING;
    
   if(key == ' ' ){   
      fill(setBackground);
  noStroke();
  rect(0, 0, width*2, height*2);
  noFill();
  for (int i= 0; i< numberOfCurves; i++){
    //    xposA[i] = width/2;
    xposA[i] = random(-curveMarginW,(width+curveMarginW));
    yposA[i] = random(-curveMarginH,(height+curveMarginH));
    xposB[i] = random(-curveMarginW,(width+curveMarginW));
    yposB[i] = random(-curveMarginH,(height+curveMarginH));   
    xposHandleA[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleA[i] = random(-handleMarginH,(height+handleMarginH));
    xposHandleB[i] = random(-handleMarginW,(width+handleMarginW));
    yposHandleB[i] = random(-handleMarginH,(height+handleMarginH)); 

    if (drop){
      xposB[i] = xposA[i];
      yposB[i] = yposA[i];
    }
  }
}

    if( key == 'b')
    setups.SETb();
    
    if( key == 'v')
    setups.SETv();
    
    
    if( key == 'q')
    setups.SETq();
    
    if( key == 'w')
    setups.SETw();
    

    if( key == 'e')
    setups.SETe();
    
    if( key == 'r')
    setups.SETr();
    

    if( key == 't')
    setups.SETt();

    if( key == 'y')
    setups.SETy();

    if( key == 'u')
    setups.SETu();

    if( key == 'i')
    setups.SETi();

    if( key == 'o')
    setups.SETo();

    if( key == 'p')
    setups.SETp();

    if( key == 'a')
    setups.SETa();

    if( key == 's')
    setups.SETs();

    if( key == 'd')
    setups.SETd();

    if( key == 'f')
    setups.SETf();

    if( key == 'g')
    setups.SETg();

    if( key == 'h')
    setups.SETh();

    if( key == 'j')
    setups.SETj();

    if( key == 'k')
    setups.SETk();

    if( key == 'l')
    setups.SETl();

    if( key == 'z')
    setups.SETz();
    
    if( key == 'x')
    setups.SETx();
    
    
    if( key == 'c')
    setups.SETc();

}


