
float eyeDiam[] = {52,80};
float pupilDiam[] = {5,25};
float irisDiam[] = {25,50};
float irisColorR[] = {0,240};
float irisColorG[] = {0,225};
float irisColorB[] = {0,225};
float rectDiam[] = {-52,80};
float middleDiam[] = {-5,25};
float lastDiam[] = {-25,50};
float colorR[] = {0,240};
float colorG[] = {0,225};
float colorB[] = {0,225};
eyeBall myEyeBall;
eyeBall myEyeBall2;
 
void setup(){
  background(0);
  frameRate(3);
  size(100,100);
}
 
void draw(){
  background(0);
myEyeBall = new eyeBall(
    random(eyeDiam[0],eyeDiam[1]),
    random(pupilDiam[0],pupilDiam[1]),
    random(irisDiam[0],irisDiam[1]),
    random(irisColorR[0],irisColorR[1]),
    random(irisColorG[0],irisColorG[1]),
    random(irisColorB[0],irisColorB[1]),
    random(rectDiam[0], rectDiam[1]),
    random(middleDiam[0], middleDiam[1]),
    random(lastDiam[0], lastDiam[1]),
    random(colorR[0], colorR[1]),
    random(colorG[0], colorG[1]),
    random(colorB[0], colorB[1])
 );
  myEyeBall.run(); 

 myEyeBall2 = new eyeBall(
    random(eyeDiam[0],eyeDiam[1]),
    random(pupilDiam[0],pupilDiam[1]),
    random(irisDiam[0],irisDiam[1]),
    random(irisColorR[0],irisColorR[1]),
    random(irisColorG[0],irisColorG[1]),
    random(irisColorB[0],irisColorB[1]),
    random(rectDiam[0], rectDiam[1]),
    random(middleDiam[0], middleDiam[1]),
    random(lastDiam[0], lastDiam[1]),
    random(colorR[0], colorR[1]),
    random(colorG[0], colorG[1]),
    random(colorB[0], colorB[1])
 );
  myEyeBall2.run(); 
 
}
 
class eyeBall{
  float eyeDiam;
  float pupilDiam;
  float irisDiam; 
  float irisColorR; 
  float irisColorG; 
  float irisColorB; 
  float rectDiam;
  float middleDiam;
  float lastDiam;
  float colorR;
  float colorG;
  float colorB;

 
  eyeBall(float _eyeDiam, float _pupilDiam, float _irisDiam, float _irisColorR, float _irisColorG, float _irisColorB, float _rectDiam, float _middleDiam, float _lastDiam, float _colorR, float _colorG, float _colorB){
  eyeDiam = _eyeDiam;
  pupilDiam = _pupilDiam;
  irisDiam = _irisDiam;
  irisColorR = _irisColorR;
  irisColorG = _irisColorG;
  irisColorB = _irisColorB;
  rectDiam = _rectDiam;
  middleDiam = _middleDiam;
 lastDiam = _lastDiam;
  colorR = _colorR;
  colorG = _colorG;
  colorB = _colorB;
}
   
  void run(){
    display();
  }
 
void display(){
    noStroke();
    fill(255);
    pushMatrix();
    translate(width/2, height/2);
     
     fill(255);
rect(-30, -30, middleDiam, middleDiam);
     
    // iris
    fill(irisColorR, irisColorG, irisColorB); 
    rect(-12, -12, middleDiam, middleDiam);   
     
    // pupil
    fill(60,70); 
    rect(-25, -15, lastDiam, lastDiam);   
    
     ////////////////////////////////////////
    // eyeeyeBall
    fill(255);
rect(0, 0, eyeDiam, eyeDiam);
     
    // iris
    fill(irisColorR, irisColorG, irisColorB); 
    rect(0, 0, irisDiam, irisDiam);   
     
    // pupil
    fill(0); 
    rect(0, 0, pupilDiam, pupilDiam);   
    popMatrix();
  }
}



