
float eyeDiam[] = {50,85};
float pupilDiam[] = {3,11};
float irisDiam[] = {30,60};
float irisColorR[] = {0,255};
float irisColorG[] = {0,255};
float irisColorB[] = {0,255};
int eyeX = 50;
int eyeY = 50;
int rowNum = 0;
int counter = 0;

catEyeBall[] myCatEyeBall = new catEyeBall[25];

void setup(){
  background(0);
  size(500,500);
  for (int i = 0; i < myCatEyeBall.length; i ++ ) {
    myCatEyeBall[i] = new catEyeBall(
      random(eyeDiam[0],eyeDiam[1]),
      random(pupilDiam[0],pupilDiam[1]),
      random(irisDiam[0],irisDiam[1]),
      random(irisColorR[0],irisColorR[1]),
      random(irisColorG[0],irisColorG[1]),
      random(irisColorB[0],irisColorB[1])
    );
  }
 background(0);
  for (int i = 0; i < myCatEyeBall.length; i ++ ){
    pushMatrix();
    translate(50,0);
    eyeX = 100 * counter;
    counter++;
    myCatEyeBall[i].run();
    popMatrix();
    if (counter == 5){
      eyeY = eyeY + 100;
      counter = 0; 
    }
  }
}
class catEyeBall{
  float eyeDiam;
  float pupilDiam;
  float irisDiam; 
  float irisColorR; 
  float irisColorG; 
  float irisColorB; 
 
  catEyeBall(float _eyeDiam, float _pupilDiam, float _irisDiam, float _irisColorR, float _irisColorG, float _irisColorB){
  eyeDiam = _eyeDiam;
  pupilDiam = _pupilDiam;
  irisDiam = _irisDiam;
  irisColorR = _irisColorR;
  irisColorG = _irisColorG;
  irisColorB = _irisColorB;
}
   
  void run(){
    display();
  }
 
void display(){
    noStroke();
    fill(255);
     
    // eyeeyeBall
    fill(255);
    ellipse(eyeX, eyeY, eyeDiam, eyeDiam);
     
    // iris
    fill(irisColorR, irisColorG, irisColorB); 
    ellipse(eyeX, eyeY, irisDiam, irisDiam);   
     
    // pupil
    fill(0); 
    ellipse(eyeX, eyeY, pupilDiam, 3*pupilDiam);   
  }
}





