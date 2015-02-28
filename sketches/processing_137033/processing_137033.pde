
float centDiam[] = {5,20};
float circleDiam1[] = {5,20};
float circleDiam2[] = {5,20};
float circleDiam3[] = {5,20};
float circleDiam4[] = {5,20};
float centColorR[] = {0,255};
float centColorG[] = {0,255};
float centColorB[] = {0,255};
float circleColor1R[] = {0,255};
float circleColor1G[] = {0,255};
float circleColor1B[] = {0,255};
float circleColor2R[] = {0,255};
float circleColor2G[] = {0,255};
float circleColor2B[] = {0,255};
float circleColor3R[] = {0,255};
float circleColor3G[] = {0,255};
float circleColor3B[] = {0,255};
float circleColor4R[] = {0,255};
float circleColor4G[] = {0,255};
float circleColor4B[] = {0,255};
int centX = 50;
int centY = 50;
int rowNum = 0;
int counter = 0;

pattern[] mypattern = new pattern[25];
void setup(){
  background(0);
  size(500,500);
  for (int i = 0; i < mypattern.length; i ++) {
    mypattern[i] = new pattern(
      random(centDiam[0],centDiam[1]),
      random(circleDiam1[0],circleDiam1[1]),
      random(circleDiam2[0],circleDiam2[1]),
      random(circleDiam3[0],circleDiam3[1]),
      random(circleDiam4[0],circleDiam4[1]),
      random(centColorR[0],centColorR[1]),
      random(centColorG[0],centColorG[1]),
      random(centColorB[0],centColorB[1]),
      random(circleColor1R[0],circleColor1R[1]),
      random(circleColor1G[0],circleColor1G[1]),
      random(circleColor1B[0],circleColor1B[1]),
      random(circleColor2R[0],circleColor2R[1]),
      random(circleColor2G[0],circleColor2G[1]),
      random(circleColor2B[0],circleColor2B[1]),
      random(circleColor3R[0],circleColor3R[1]),
      random(circleColor3G[0],circleColor3G[1]),
      random(circleColor3B[0],circleColor3B[1]),
      random(circleColor4R[0],circleColor4R[1]),
      random(circleColor4G[0],circleColor4G[1]),
      random(circleColor4B[0],circleColor4B[1])
      );
  }
  
  background(0);
  for (int i = 0; i < mypattern.length; i ++){
    pushMatrix();
    translate(50,0);
    centX = 100*counter;
    counter ++;
    mypattern[i].run();
    popMatrix();
    if (counter == 5){
      centY=centY + 100;
      counter = 0;
    }
  }
}
      
class pattern{
  float centDiam;
  float centColorR;
  float centColorG;
  float centColorB;
  float circleDiam1;
  float circleDiam2;
  float circleDiam3;
  float circleDiam4;
  float circleColor1R;
  float circleColor1G;
  float circleColor1B;
  float circleColor2R;
  float circleColor2G;
  float circleColor2B;
  float circleColor3R;
  float circleColor3G;
  float circleColor3B;
  float circleColor4R;
  float circleColor4G;
  float circleColor4B;
  
  pattern(float _centDiam, float _centColorR, float _centColorG, float _centColorB, float _circleDiam1, float _circleDiam2, float _circleDiam3, float _circleDiam4, float _circleColor1R, float _circleColor1G, float _circleColor1B, float _circleColor2R, float _circleColor2G, float _circleColor2B, float _circleColor3R, float _circleColor3G, float _circleColor3B, float _circleColor4R, float _circleColor4G, float _circleColor4B){
  centDiam = _centDiam;  
  circleDiam1 = _circleDiam1;
  circleDiam2 = _circleDiam2;
  circleDiam3 = _circleDiam3;
  circleDiam4 = _circleDiam4;
  circleColor1R = _circleColor1R;
  circleColor1G = _circleColor1G;
  circleColor1B = _circleColor1B;
  circleColor2R = _circleColor2R;
  circleColor2G = _circleColor2G;
  circleColor2B = _circleColor2B;
  circleColor3R = _circleColor3R;
  circleColor3G = _circleColor3G;
  circleColor3B = _circleColor3B;
  circleColor4R = _circleColor4R;
  circleColor4G = _circleColor4G;
  circleColor4B = _circleColor4B;
  centColorR = _centColorR;
  centColorG = _centColorG;
  centColorB = _centColorB; 
}
  void run(){
   display();
  } 
void display(){
  fill(0);
  
  fill(centColorR,centColorG,centColorR);
  ellipse(centX,centY,centDiam,centDiam);
  
  fill(circleColor1R,circleColor1G,circleColor1B);
  ellipse((centX + 50),(centY + 50),circleDiam1,circleDiam1);
  
  fill(circleColor2R,circleColor2G,circleColor2B);
  ellipse((centX - 50),(centY - 50),circleDiam2,circleDiam2);
  
  fill(circleColor3R,circleColor3G,circleColor3B);
  ellipse((centX +50),(centY-50),circleDiam3,circleDiam3);
  
  fill(circleColor4R,circleColor4G,circleColor4B);
  ellipse((centX-50),(centY+50),circleDiam4,circleDiam4);
}
}



