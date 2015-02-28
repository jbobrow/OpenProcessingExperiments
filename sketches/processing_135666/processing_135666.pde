
float lightOneColA[] = {0,255};
float lightOneColB[] = {0,255};
float lightOneColC[] = {0,255};
float lightTwoColA[] = {0,255};
float lightTwoColB[] = {0,255};
float lightTwoColC[] = {0,255};
float lightThreeColA[] = {0,255};
float lightThreeColB[] = {0,255};
float lightThreeColC[] = {0,255};
float lightOneSi[] = {5,30};
float lightTwoSi[] = {10,50};
float lightThreeSi[] = {10,40};
float triSi[] = {30,75};
float triCol[] = {0,255};
float baseSize[] = {5,30};
float baseColorA[] = {0,255};
float baseColorB[] = {0,255};
float baseColorC[] = {0,255};
int lightX = 20;
int lightY = 70;
int rowNum = 0;
int counter = 0;

trafficLight[] myLight = new trafficLight[25];

void setup(){
  background(0);
  size(500,500);
  for (int i = 0; i < myLight.length; i ++ ) {
    myLight[i] = new trafficLight(
     random(lightOneColA[0],lightOneColA[1]),
    random(lightOneColB[0],lightOneColB[1]),
    random(lightOneColC[0],lightOneColC[1]),
    random(lightTwoColA[0],lightTwoColA[1]),
    random(lightTwoColB[0],lightTwoColB[1]),
    random(lightTwoColC[0],lightTwoColC[1]),
    random(lightThreeColA[0],lightThreeColA[1]),
    random(lightThreeColB[0],lightThreeColB[1]),
    random(lightThreeColC[0],lightThreeColC[1]),
    random(lightOneSi[0],lightOneSi[1]),
    random(lightTwoSi[0],lightTwoSi[1]),
    random(lightThreeSi[0],lightThreeSi[1]),
    random(triSi[0],triSi[1]),
    random(triCol[0],triCol[1]),
    random(baseSize[0],baseSize[1]),
    random(baseColorA[0],baseColorA[1]),
    random(baseColorB[0],baseColorB[1]),
    random(baseColorC[0],baseColorC[1])
  );
  }
  
  background(150,30,0);
  for (int i = 0; i < myLight.length; i ++ ){
    pushMatrix();
    translate(-150,-220);
    lightX = 100 * counter;
    counter++;
    myLight[i].run();
    popMatrix();
    if (counter == 5){
      lightY = lightY + 100;
      counter = 0; 
    }
  }
}

class trafficLight{
  float lightOneColA;
  float lightOneColB;
  float lightOneColC;
  float lightTwoColA;
  float lightTwoColB;
  float lightTwoColC;
  float lightThreeColA;
  float lightThreeColB;
  float lightThreeColC;
  float lightOneSi;
  float lightTwoSi;
  float lightThreeSi;
  float triSi;
  float triCol;
  float baseSize;
  float baseColorA;
  float baseColorB;
  float baseColorC;
  
  trafficLight(float _lightOneColA, float _lightOneColB, float _lightOneColC, float _lightTwoColA, float _lightTwoColB, float _lightTwoColC, float _lightThreeColA, float _lightThreeColB, float _lightThreeColC, float _lightOneSi, float _lightTwoSi, float _lightThreeSi, float _triSi, float _triCol, float _baseSize, float _baseColorA, float _baseColorB, float _baseColorC){
   lightOneColA = _lightOneColA;
   lightOneColB = _lightOneColB; 
   lightOneColC = _lightOneColC;
   lightTwoColA = _lightTwoColA;
   lightTwoColB = _lightTwoColB;
   lightTwoColC = _lightTwoColC;
   lightThreeColA = _lightThreeColA;
   lightThreeColB = _lightThreeColB;
   lightThreeColC = _lightThreeColC;
   lightOneSi = _lightOneSi;
   lightTwoSi = _lightTwoSi;
   lightThreeSi = _lightThreeSi;
   triSi = _triSi;
   triCol = _triCol;
   baseSize = _baseSize;
   baseColorA = _baseColorA;
   baseColorB= _baseColorB;
   baseColorC = _baseColorC;
}

void run(){
    display();
  }
  
 void display(){
  translate (-50,-50);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  translate(width/2, height/2);
  
  // base
fill(lightOneColA);
rect(lightX,lightY,-50,baseSize);
 
//green light
fill(lightOneColA,lightOneColB,lightOneColC);
ellipse(lightX,lightY,lightOneSi,lightOneSi);
rect(lightX,lightY,baseSize, 70);

 
//yellow light
fill(lightTwoColA,lightTwoColB,lightTwoColC);
ellipse(lightX,lightY,lightTwoSi,lightTwoSi);
rect(lightX,lightY,-55,baseSize);
 
// red light
fill(lightThreeColA,lightTwoColA,lightThreeColC);
ellipse(lightX,lightY,lightThreeSi,lightThreeSi);
ellipse(lightX, lightY, 60, 30);
rect(lightX,lightY,30,baseSize);
fill(255);
rect(lightX, lightY, -50, 5);
}

}




