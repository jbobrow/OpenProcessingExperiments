

float cA[] = {20,80}; 
float cB[] = {10,90}; 
float cC[] = {10,100}; 
float cD[] = {10,60}; 
float aColR[] = {150,175}; 
float aColG[] = {150,175}; 
float aColB[] = {150,175}; 
float bColR[] = {0,0}; 
float bColG[] = {0,0}; 
float bColB[] = {0,0}; 
float cColR[] = {180,220}; 
float cColG[] = {180,220}; 
float cColB[] = {1800,220}; 
float dColR[] = {255,255}; 
float dColG[] = {255,255}; 
float dColB[] = {255,255}; 
randomCircles myRandomCircles; 

void setup() { 
  background(28,155,235); 
  frameRate (10); 
  size (100,100); 
} 
  
  void draw() {
  background (0); 
myRandomCircles = new randomCircles ( 

    random(cA[0],cA[1]), 
    random(cB[0],cA[1]), 
    random(cC[0],cC[1]), 
    random(cD[0],cD[1]), 
    random(aColR[0],aColR[1]), 
    random(aColG[0],aColG[1]), 
    random(aColB[0],aColB[1]), 
    random(bColR[0],bColR[1]), 
    random(bColG[0],bColG[1]), 
    random(bColB[0],bColB[1]), 
    random(cColR[0],cColR[1]), 
    random(cColG[0],cColG[1]), 
    random(cColB[0],cColB[1]), 
    random(dColR[0],dColR[1]), 
    random(dColG[0],dColG[1]), 
    random(dColB[0],dColB[1]) 
   ); 
  myRandomCircles.run(); 
} 

class randomCircles{ 
  float cA; 
  float cB; 
  float cC; 
  float cD; 
  float aColR; 
  float aColG; 
  float aColB; 
  float bColR; 
  float bColG; 
  float bColB; 
  float cColR; 
  float cColG; 
  float cColB; 
  float dColR;
  float dColG; 
  float dColB; 

  randomCircles (float _cA, float _cB, float _cC, float _cD, float _aColR, float _aColG, float _aColB, float _bColR, float _bColG, float _bColB, float _cColR, float _cColG, float _cColB, float _dColR, float _dColG, float _dColB){ 
  cA = _cA; 
  cB = _cB; 
  cC = _cC; 
  cD = _cD; 
  aColR = _aColR; 
  aColG = _aColG; 
  aColB = _aColB; 
  bColR = _bColR; 
  bColG = _bColG; 
  bColB = _bColB; 
  cColR = _cColR; 
  cColG = _cColG; 
  cColB = _cColB; 
  dColR = _dColR; 
  dColG = _dColG; 
  dColB = _dColB; 
 } 
  void run() { 
   display(); 
  } 


 void display() { 
    noStroke(); 
    fill(0); 
    pushMatrix(); 
    translate(width/2, height/2); 
   
   fill(cColR, cColG, cColB); 
   ellipse(0,0, cC, 100); 
   //cD 
   fill(dColR, dColG, dColB); 
   ellipse(0,0, 80, cD); 
   fill(aColR, aColG, aColB); 
   ellipse(0,0, cA, 20); 
   //cB 
   fill(bColR, bColG, bColB); 
   ellipse(0,0, 50, cB); 
   //cC 
   popMatrix();
 } 
}  

