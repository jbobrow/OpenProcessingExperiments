
class Drop{
  float centerX;
  float centerY;
  int radius;
  int life=105;
  int flowNum;     //인풋  (크기 5~16   날개 25~80     radius:flownum=1:5)
  float angle;                                    //계산용각도(/flowNum)
  float[] radiusRan;                              //물결
  float[] x;
  float[] y;                                      //물결 x,y
  color colorRan;
  int Hue;
  int Hvalue=320;                                 //색상값
  float[] radiusWing;                             //날개 시작,끝점+x,y
  float[] radiusWingF;
  float[] wingSX;
  float[] wingFX;
  float[] wingSY;
  float[] wingFY;



  Drop(float posX, float posY){
    radius=(int)random(15,30);                      //인풋, 크기
    flowNum=radius*5;                              //인풋, 크기에다른 날개갯수
    centerX=posX;
    centerY=posY;
    radiusRan=new float[flowNum];
    x=new float[flowNum];
    y=new float[flowNum];
    radiusWing=new float[flowNum];
    radiusWingF=new float[flowNum];
    wingSX=new float[flowNum];
    wingSY=new float[flowNum];
    wingFX=new float[flowNum];
    wingFY=new float[flowNum];
  }

  void spread(){
    for(int i=0; i<flowNum; i++){
      radiusRan[i]=random(radius*0.9,radius*1.1);                           //물결을 만든다(반지름을 구한다)
      if(radiusRan[i]<radius*0.92){
        radiusRan[i]=random(radius*1.2,radius*1.3);                         //사생아 물결을 만든다
      }
      angle=360*i/flowNum;
      x[i] = centerX + (radiusRan[i])*sin(radians(angle));                  //원 구하는공식
      y[i] = centerY + (radiusRan[i])*cos(radians(angle));
    }
  }

  void wing(){
    for(int i=0; i<flowNum; i++){
      if(radiusRan[i]>radius*1.15){
        radiusWing[i] = random(radius*1.3,radius*1.35);
        radiusWingF[i] = random(radius*1.3,radius*1.6);
      } 
      else {
        radiusWing[i] = 0;
        radiusWingF[i] = 0;
      }
      angle=360*i/flowNum;
      wingSX[i] = centerX + (radiusWing[i])*sin(radians(angle));
      wingSY[i] = centerY + (radiusWing[i])*cos(radians(angle));
      wingFX[i] = centerX + (radiusWingF[i])*sin(radians(angle));
      wingFY[i] = centerY + (radiusWingF[i])*cos(radians(angle));
    }
  }

  void paint(){
    Hue=(int)random(Hvalue-100,Hvalue);
    colorRan=color(Hue,100,100);
  }
  
  void display(){
    beginShape();
    for(int i=0; i<flowNum ;i++){
      fill(colorRan,life);
      stroke(colorRan,life);
      curveVertex(x[i],y[i]);
      line(wingSX[i],wingSY[i],wingFX[i],wingFY[i]);
    }
    endShape(CLOSE);
  }
}

