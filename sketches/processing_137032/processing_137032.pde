
float circleDiam1[] = {20,120};
float circleDiam2[] = {20,120};
float circleDiam3[] = {20,120};
float circleDiam4[] = {20,120};
float rectDiam[] = {20,90};
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
float rectColorR[] = {0,255};
float rectColorG[] = {0,255};
float rectColorB[] = {0,255};
pattern mypattern;

void setup(){
  background(0);
  frameRate(3);
  size(100,100);
}

void draw(){
  background(0);
  mypattern = new pattern(
    random(circleDiam1[0],circleDiam1[1]),
    random(circleDiam2[0],circleDiam2[1]),
    random(circleDiam3[0],circleDiam3[1]),
    random(circleDiam4[0],circleDiam4[1]),
    random(rectDiam[0],rectDiam[1]),
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
    random(circleColor4B[0],circleColor4B[1]),
    random(rectColorR[0],rectColorR[1]),
    random(rectColorG[0],rectColorG[1]),
    random(rectColorB[0],rectColorB[1])
    );
  mypattern.run();
}


class pattern{
  float circleDiam1;
  float circleDiam2;
  float circleDiam3;
  float circleDiam4;
  float rectDiam;
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
  float rectColorR;
  float rectColorG;
  float rectColorB;
  
  pattern(float _circleDiam1, float _circleDiam2, float _circleDiam3, float _circleDiam4, float _rectDiam, float _circleColor1R, float _circleColor1G, float _circleColor1B, float _circleColor2R, float _circleColor2G, float _circleColor2B, float _circleColor3R, float _circleColor3G, float _circleColor3B, float _circleColor4R, float _circleColor4G, float _circleColor4B, float _rectColorR, float _rectColorG, float _rectColorB){
  circleDiam1 = _circleDiam1;
  circleDiam2 = _circleDiam2;
  circleDiam3 = _circleDiam3;
  circleDiam4 = _circleDiam4;
  rectDiam = _rectDiam;
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
  rectColorR = _rectColorR;
  rectColorG = _rectColorG;
  rectColorB = _rectColorB;
}
  void run(){
    display();
  }
  void display(){
     fill(255);
     
     fill(circleColor1R,circleColor1G,circleColor1B);
     ellipse(0,0,circleDiam1,circleDiam1);
   
     fill(circleColor2R,circleColor2G,circleColor2B);
     ellipse(0,100,circleDiam2,circleDiam2);
   
     fill(circleColor3R,circleColor3G,circleColor3B);
     ellipse(100,0,circleDiam3,circleDiam3);
   
     fill(circleColor4R,circleColor4G,circleColor4B);
     ellipse(100,100,circleDiam4,circleDiam4);
   
     fill(rectColorR,rectColorG,rectColorB);
     ellipse(50,50,rectDiam,rectDiam);
  }
}




