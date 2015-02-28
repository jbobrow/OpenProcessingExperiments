
float cA[] = {10,40};
float cB[] = {10,20};
float cC[] = {10,45};
float cD[] = {10,15};
float aColR[] = {0,255};
float aColG[] = {0,255};
float aColB[] = {0,255};
float bColR[] = {0,255};
float bColG[] = {0,255};
float bColB[] = {0,255};
float cColR[] = {0,255};
float cColG[] = {0,255};
float cColB[] = {0,255};
float dColR[] = {0,255};
float dColG[] = {0,255};
float dColB[] = {0,255};
int circleX = 50;
int circleY = 50;
int rowNum = 0;
int counter = 0;

randomCircles[] myRandomCircles = new randomCircles[25];

void setup() {
  background(0);
  size (500,500);
  for (int i = 0; i < myRandomCircles.length; i ++ ) {
    myRandomCircles[i] = new randomCircles(
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
}
 background(0);
 for (int i = 0; i < myRandomCircles.length; i ++ ){
   pushMatrix();
   translate(50,0);
   circleX = 100 * counter;
   counter++;
   myRandomCircles[i]. run();
   popMatrix();
   if (counter == 5) {
     circleY = circleY + 100;
     counter = 0;
   }
 }
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
    fill(255);
    
   //cA
   fill(aColR, aColG, aColB);
   ellipse(circleX,circleY, cA, 95);
   //cB
   fill(bColR, bColG, bColB);
   ellipse(circleX,circleY, 95, cB);
   //cC
   fill(cColR, cColG, cColB);
   ellipse(circleX,circleY, cC, 45);
   //cD
   fill(dColR, dColG, dColB);
   ellipse(circleX,circleY, 45, cD);
   
 }
} 
  


