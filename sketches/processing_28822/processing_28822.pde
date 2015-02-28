
void keyPressed(){if(keyCode==ENTER)flag=99;}
void mousePressed(){
  if(flag==0)flag+=1;rotYcount=0;
  if(flag==99 || flag==98)flag=0;rotYcount=0;
}

void stage(int R1X1,int R1Y1,int R1X2,int R1Y2){      //코너값으로 stage 그려주기
  rectMode(CORNERS);
  noFill();
  if(rotY==0)depth=-200;
  pushMatrix();
  translate(width/2,height/2,depth);
  rotateY(rotY);
  rect (-width/2,-height/2,width/2,height/2);
  rect (R1X1-250,R1Y1-250,R1X2-250,R1Y2-250);
  popMatrix();
}  

void wait(int sX,int sY,float vector,int Z){                                          //대기화면용 그냥 도는화면
  pushMatrix();
  translate(width/2,height/2,Z);
  rotateY(rotY*vector);
  rect(0,0,sX,sY);
  popMatrix();
}

void stageHint(int R1X1,int R1Y1,int R1X2,int R1Y2){
  Acolor-=3;
  if(flag>3)Acolor-=6;if(flag>8)Acolor-=8;            //3,8단계 분기 사라지는 속도 조절
  if(Acolor<0)Acolor=0;                               //알파값, 힌트사라지기
  rectMode(CORNERS);
  noStroke();
  fill(255,100,100,Acolor);
  rect (R1X1,R1Y1,R1X2,R1Y2);
  if(rotY==0)Acolor=255;
}

int[] judge(int x1,int y1,int x3,int y3){            //판단영역 쉽게뽑기
  int x2=x3;int y2=y1;int x4=x1;int y4=y3;
  int[] judgeArea={x1,y1, x2,y2, x3,y3, x4,y4};
  return judgeArea;
}

void setup(){
  size(500,500,P3D);
  smooth();
}

  float rotY=0;       //패널 회전속도
  float Acolor=255;   //알파값, 초기값255, 감소량 0.75
  float DposX,DposY=250;//마우스좌표값
  int flag=0;
  float depth=-200;      //판넬심도
  int rotYcount=0;      //몇번 돌았게?

void draw(){
  PFont title;                      //폰트에여
  title = loadFont("AgencyFB-Bold-48.vlw");
  textFont(title);
  textAlign(CENTER);
  depth+=0.505;                     //판낼잠수 속도
  if(depth>0)depth=0;               //-20이면 정지
  rotY=rotY+PI/200;                 //판넬도는속도(고치지 맙시다딴거 다바꺼야되 ㅡㅡ;)
  if(rotY>PI*2)rotY=0;              //한바퀴돌면 초기값

  rectMode(CENTER);
  noFill();
  background(255);
  strokeWeight(1);
  stroke(0);

  wait(width,height,1,0);                                        //늘상 도는 사소한 판넬
  if(flag==0){                                                             //메인화면 (flag==0)
    fill(128,128,255,30);
    rectMode(CORNER);
    rect(0,0,width,height);
    fill(100);text("- Jump in to the Rect -",width/2,height/2);
    textFont (title,40);
    fill(200);text("Click to start",width/2,height/2+50);
  }
  if(flag==1){                                                             //stage1 (flag == 1)
    stage(20,30,240,480);
    stageHint(20,30,240,480);
    int[] stage=judge(20,30,240,480);
    if(rotY>PI)rotYcount=1;
    if(rotY==0 && rotYcount==1){
      if(DposX>20 && DposY>30 && DposX<240 && DposY<480){flag=2;}else{flag=98;}
    }
  }
  if(flag==2){                                                             //stage2 (flag == 2)
    stage(30,70,140,280);
    stageHint(30,70,140,280);
    int[] stage=judge(30,70,140,280);
    if(rotY>PI)rotYcount=2;
    if(rotY==0 && rotYcount==2){
      if(DposX>30 && DposY>70 && DposX<140 && DposY<280){flag=3;}else{flag=98;}
    }
  }
    if(flag==3){                                                             //stage3 (flag == 3)
    stage(120,300,230,400);
    stageHint(120,300,230,400);
    int[] stage=judge(120,300,230,400);
    if(rotY>PI)rotYcount=3;
    if(rotY==0 && rotYcount==3){
      if(DposX>120 && DposY>300 && DposX<230 && DposY<400){flag=4;}else{flag=98;}
    }
  }
    if(flag==4){                                                             //stage4 (flag == 4)
    stage(190,50,235,200);
    stageHint(190,50,235,200);
    int[] stage=judge(190,50,235,200);
    if(rotY>PI)rotYcount=4;
    if(rotY==0 && rotYcount==4){
      if(DposX>190 && DposY>50 && DposX<235 && DposY<200){flag=5;}else{flag=98;}
    }
  }
    if(flag==5){                                                             //stage4 (flag == 5)
    stage(50,440,180,470);
    stageHint(50,440,180,470);
    int[] stage=judge(50,440,180,470);
    if(rotY>PI)rotYcount=5;
    if(rotY==0 && rotYcount==5){
      if(DposX>50 && DposY>440 && DposX<180 && DposY<470){flag=6;}else{flag=98;}
    }
  }
    if(flag==6){                                                             //stage4 (flag == 6)
    stage(120,70,160,460);
    stageHint(120,70,160,460);
    int[] stage=judge(120,70,160,460);
    if(rotY>PI)rotYcount=6;
    if(rotY==0 && rotYcount==6){
      if(DposX>120 && DposY>70 && DposX<160 && DposY<460){flag=7;}else{flag=98;}
    }
  }
    if(flag==7){                                                             //stage4 (flag == 7)
    stage(25,250,220,270);
    stageHint(25,250,220,270);
    int[] stage=judge(25,250,220,270);
    if(rotY>PI)rotYcount=7;
    if(rotY==0 && rotYcount==7){
      if(DposX>25 && DposY>250 && DposX<220 && DposY<270){flag=8;}else{flag=98;}
    }
  }
    if(flag==8){                                                             //stage4 (flag == 8)
    stage(70,380,100,400);
    stageHint(70,380,100,400);
    int[] stage=judge(70,380,100,400);
    if(rotY>PI)rotYcount=8;
    if(rotY==0 && rotYcount==8){
      if(DposX>70 && DposY>380 && DposX<100 && DposY<400){flag=9;}else{flag=98;}
    }
  }
    if(flag==9){                                                             //stage4 (flag == 9)
    stage(220,220,235,400);
    stageHint(220,220,235,400);
    int[] stage=judge(220,220,235,400);
    if(rotY>PI)rotYcount=9;
    if(rotY==0 && rotYcount==9){
      if(DposX>220 && DposY>220 && DposX<235 && DposY<400){flag=10;}else{flag=98;}
    }
  }
    if(flag==10){                                                             //stage4 (flag == 10)
    stage(120,125,125,150);
    stageHint(120,125,125,150);
    int[] stage=judge(120,125,125,150);
    if(rotY>PI)rotYcount=10;
    if(rotY==0 && rotYcount==10){
      if(DposX>120 && DposY>125 && DposX<125 && DposY<150){flag=99;}else{flag=98;}
    }
  }
    if(flag==98)text("try again",width/2,height/2);                          // game over(flag == 98)
    if(flag==99){                                                            // 관람용
      wait(width,height,-0.89,-50);wait(width-20,height-20,2,-50);
    }
  if(flag!=0 && flag!=99){                        //공의 움직임
  fill(0);
  DposX = DposX - (DposX-mouseX)*0.055;
  DposY = DposY - (DposY-mouseY)*0.055;
  ellipse(DposX,DposY,5,5);}
  
  println(rotY);
  println(rotYcount);
  println(flag);
}





//2    stage(30,70,140,280);     default
//3    stage(120,300,230,400);
//4    stage(190,50,235,200);
//5    stage(50,440,180,470);
//6    stage(120,70,160,460);
//7    stage(25,250,220,270);
//8    stage(70,380,100,400);
//9    stage(220,220,235,400);
//10    stage(120,125,125,150);

