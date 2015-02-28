
float outRectDiam[] = {55,90};
float centerDiam[] = {5,25};
float midRectDiam[] = {30,50};
float ellipseDiam[] = {100,100};
float midRectR[] = {0,255};
float midRectG[] = {0,255};
float midRectB[] = {0,255};
float centerRectR[] = {0,255};
float centerRectG[] = {0,255};
float centerRectB[] = {0,255};
float outRectR[] = {0,255};
float outRectG[] = {0,255};
float outRectB[] = {0,255};
float ellipseR[] = {0,255};
float ellipseG[] = {0,255};
float ellipseB[] = {0,255};
int rectX = 50;
int rectY = 50;
int rowNum = 0;
int counter = 0;
 
aRectangle[] myRectangle = new aRectangle[25];                       
 
void setup(){
  background(255);
  size(500,500);
  rectMode(CENTER);
  for (int i = 0; i < myRectangle.length; i ++ ) {
    myRectangle[i] = new aRectangle(
      random(outRectDiam[0],outRectDiam[1]),
      random(centerDiam[0],centerDiam[1]),
      random(midRectDiam[0],midRectDiam[1]),
      random(ellipseDiam[0],ellipseDiam[1]),
      random(midRectR[0],midRectR[1]),
      random(midRectG[0],midRectG[1]),
      random(midRectB[0],midRectB[1]),
      random(centerRectR[0],centerRectR[1]),
      random(centerRectG[0],centerRectG[1]),
      random(centerRectB[0],centerRectB[1]),
      random(outRectR[0],outRectR[1]),
      random(outRectG[0],outRectG[1]),
      random(outRectB[0],outRectB[1]),
      random(ellipseR[0],ellipseR[1]),
      random(ellipseG[0],ellipseG[1]),
      random(ellipseB[0],ellipseB[1])
      
    );
  }
 
  background(255);
  for (int i = 0; i < myRectangle.length; i ++ ){
    pushMatrix();
    translate(50,0);
    rectX = 100 * counter;
    counter++;
    myRectangle[i].run();
    popMatrix();
    if (counter == 5){
      rectY = rectY + 100;
      counter = 0; 
    }
  }
}
 
 


class aRectangle{
  float outRectDiam;
  float centerDiam;
  float midRectDiam;
  float ellipseDiam;
  float midRectR; 
  float midRectG; 
  float midRectB; 
  float centerRectR;
  float centerRectG;
  float centerRectB;
  float outRectR;
  float outRectG;
  float outRectB;
  float ellipseR;
  float ellipseG;
  float ellipseB;
  
 
  aRectangle(float _outRectDiam, float _centerDiam, float _midRectDiam, float _ellipseDiam, float _midRectR, float _midRectG, float _midRectB, float _centerRectR, float _centerRectG, float _centerRectB, float _outRectR, float _outRectG, float _outRectB, float _ellipseR, float _ellipseG, float _ellipseB){
  outRectDiam = _outRectDiam;
  centerDiam = _centerDiam;
  midRectDiam = _midRectDiam;
  ellipseDiam = _ellipseDiam;
  midRectR = _midRectR;
  midRectG = _midRectG;
  midRectB = _midRectB;
  centerRectR = _centerRectR;
  centerRectG = _centerRectG;
  centerRectB = _centerRectB;
  outRectR = _outRectR;
  outRectG = _outRectG;
  outRectB = _outRectB;
  outRectB = _outRectB;
  ellipseR = _ellipseR;
  ellipseG = _ellipseG;
  ellipseB = _ellipseB;
}
   
  void run(){
    display();
  }
 
void display(){
    noStroke();
    fill(255);
     
     //ellipse2
    fill(ellipseR, ellipseG, ellipseB);
    ellipse(rectX, rectY, ellipseDiam, ellipseDiam);
     
    // outerRectangle
    fill(outRectR, outRectG, outRectB);
    rect(rectX, rectY, outRectDiam, outRectDiam);
     
    // ellipse
    fill(midRectR, midRectG, midRectB); 
    ellipse(rectX, rectY, midRectDiam, midRectDiam);   
     
    // centerRect
    fill(centerRectR, centerRectG, centerRectB); 
    rect(rectX, rectY, centerDiam, centerDiam);   
    
  }
}


