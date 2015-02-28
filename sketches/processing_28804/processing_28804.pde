
void setup(){
  size(500,500);
  smooth();
  strokeWeight(3);
  colorMode(HSB);
  noStroke();
  frameRate(2);
}                                           //70~150까진 괜찮은듯

  float centerX;                            //중심점
  float centerY;
  float radius;                             //기본 크기(중심에서 원끝까지의 반지름)
  int flowNum=150; //70~150이 자연스러움    //물결갯수                 중요!!! array 선언 전에 꼭 해줍시다
  float[] radiusRan=new float[flowNum];     //물결갯수대로 중앙에서부터 끝까지의 거리(울퉁불의 반지름)
  float angle=0;                            //원그릴때, flowNum을 통해 나올 각도들
  
void draw(){
    background(255);
  centerX=width/2;
  centerY=height/2;
  radius=200;
  
  beginShape();
  for(int i=0; i<flowNum ;i++){
  radiusRan[i]=random(radius*0.9,radius*1.1);                           //물결을 만든다(반지름을 구한다)
  if(radiusRan[i]<radius*0.92){
    radiusRan[i]=random(radius*1.2,radius*1.3);                         //사생아 물결을 만든다
  }
  angle=360*i/flowNum;
  float x = centerX + (radiusRan[i])*cos(radians(angle));                  //원 구하는공식
  float y = centerY + (radiusRan[i])*sin(radians(angle));
  curveVertex(x,y);                                                          //물결을 그리자
  stroke(0);
  ellipse(x,y,5,5);
  }
  endShape(CLOSE);                                             //begin endshpae를 for밖에 쓰는걸 잊지말것
//  noLoop();
}

