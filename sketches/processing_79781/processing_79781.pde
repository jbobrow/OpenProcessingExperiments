
int mx=80;//文字最大数

//キーボード
PFont font;
String a1="Q,W,E,R,T,Y,U,I,O,P";String[] m1=splitTokens(a1,",");//１段目
String a2="A,S,D,F,G,H,J,K,L";String[] m2=splitTokens(a2,",");//2段目
String a3="Z,X,C,V,B,N,M";String[] m3=splitTokens(a3,",");//3段目
String a4="Q,W,E,R,T,Y,U,I,O,P,A,S,D,F,G,H,J,K,L,Z,X,C,V,B,N,M";
String[] LT=splitTokens(a4,",");
int sz=25;int kY=480;
int x1=285;int x2=x1+15;int x3=x1+40;
int lt;
color board=color(230,180);

//動きの設定
int[] amp=new int[mx];//倍増
int[] T=new int[mx];//番号
float[] thetaS=new float[mx];float[] thetaC=new float[mx];
float[] Sz=new float[mx];
float[] tX=new float[mx];float[] tY=new float[mx];
float[] TX=new float[mx];float[] TY=new float[mx];
float[] SIN=new float[mx];float[] COS=new float[mx];

int IDX;

void setup(){
  size(800,600);
  font=createFont("Baskerville",48,true);
  textFont(font);
  textAlign(CENTER);
  smooth();
  
  for(int a=1;a<10;a++){
  T[a]=floor(random(26));  tX[a]=random(width);tY[a]=random(height);
    SIN[a]=random(-0.06,0.06);COS[a]=random(-0.06,0.06);
    amp[a]=floor(random(50,150));
  }
  IDX=20;
}


void draw(){
  background(#ffffff);

  
  if(IDX>0){
    for(int a=0;a<IDX;a++){
      thetaS[a]=thetaS[a]+SIN[a];thetaC[a]=thetaC[a]+COS[a];
      TX[a]=sin(thetaS[a])*amp[a];TY[a]=cos(thetaC[a])*amp[a];
      if(IDX==a+1){fill(#ee0000);}else{fill(0);}
        textSize(round(abs(TY[a])));
        letter(tX[a],tY[a],TX[a],TY[a],T[a]);
    }
  }
  
  fill(0);
  if(IDX==0){
    textSize(18);
    text("Press any key.",width/2,height/2);
  }
  
  //キーボード
  textSize(sz-4); fill(90);
  noStroke(); rectMode(CENTER);
  
  for(int a=0;a<10;a++){
    fill(board);
    rect(x1+sz*a,kY-8,sz-4,sz-4);
   if(lt==a){blink();}else{fill(20,120);}
    text(LT[a],sz*a+x1,kY);
  }
  for(int a=10;a<19;a++){
    fill(board);
    rect(x2+sz*(a-10),kY+sz-8,sz-4,sz-4);
    if(lt==a){blink();}else{fill(20,120);}
    text(LT[a],sz*(a-10)+x2,kY+sz);
  }
  for(int a=19;a<26;a++){
    fill(board);
    rect(x3+sz*(a-19),kY+sz*2-8,sz-4,sz-4);
    if(lt==a){blink();}else{fill(20,120);}
    text(LT[a],sz*(a-19)+x3,kY+sz*2);
  }
  fill(board);
  rect(width/2,kY+sz*3,130,sz-2);
  textSize(sz-8);
  fill(20,130);
  text("RESET",width/2,kY+sz*3.2);
}

void letter(float X,float Y,float TX,float TY,int t){
  text(LT[t],X+TX,Y+TY);
}



boolean num=true;

void mousePressed(){
  for(int a=0;a<10;a++){
    if(x1+sz*a-10<mouseX && mouseX<x1+sz*a+sz-14 && kY-18<mouseY && mouseY<kY+sz-22){
      lt=a;num=true;f=100;R=true;
    }
  }
  for(int a=10;a<19;a++){
    if(x2+sz*(a-10)-10<mouseX && mouseX<x2+sz*(a-10)-14+sz && kY+sz-18<mouseY && mouseY<kY+sz-22+sz){
      lt=a;num=true;f=100;R=true;
    }
  }
  for(int a=19;a<26;a++){
    if(x3+sz*(a-19)-10<mouseX && mouseX<x3+sz*(a-19)-14+sz && kY+sz*2-18<mouseY && mouseY<kY+sz*2-22+sz){
      lt=a;num=true;f=100;R=true;   
    }
  }
  if(IDX>mx-2){num=false;}
  if(num==true){
    T[IDX]=lt;  tX[IDX]=random(width);tY[IDX]=random(height);
    SIN[IDX]=random(-0.06,0.06);COS[IDX]=random(-0.06,0.06);
    amp[IDX]=floor(random(50,150));
  }
  if(num==true){IDX++;}else{IDX+=0;}
  if(width/2-65<mouseX && mouseX<width/2+65 && kY+sz*3-11<mouseY && mouseY<kY+sz*3+11){
    for(int a=0;a<mx;a++){
      T[a]=0;tX[a]=0;tY[a]=0;SIN[a]=0;IDX=0;
    }
  }
}


void keyPressed(){
  f=100;R=true;
  if(key=='q'){lt=0;}
  if(key=='w'){lt=1;}
  if(key=='e'){lt=2;}
  if(key=='r'){lt=3;}
  if(key=='t'){lt=4;}
  if(key=='y'){lt=5;}
  if(key=='u'){lt=6;}
  if(key=='i'){lt=7;}
  if(key=='o'){lt=8;}
  if(key=='p'){lt=9;}
  if(key=='a'){lt=10;}
  if(key=='s'){lt=11;}
  if(key=='d'){lt=12;}
  if(key=='f'){lt=13;}
  if(key=='g'){lt=14;}
  if(key=='h'){lt=15;}
  if(key=='j'){lt=16;}
  if(key=='k'){lt=17;}
  if(key=='l'){lt=18;}
  if(key=='z'){lt=19;}
  if(key=='x'){lt=20;}
  if(key=='c'){lt=21;}
  if(key=='v'){lt=22;}
  if(key=='b'){lt=23;}
  if(key=='n'){lt=24;}
  if(key=='m'){lt=25;}
  if(IDX>mx-2){num=false;}else{num=true;}
  if(num==true){
    T[IDX]=lt;  tX[IDX]=random(width);tY[IDX]=random(height);
    SIN[IDX]=random(-0.06,0.06);COS[IDX]=random(-0.06,0.06);
    amp[IDX]=floor(random(50,150));
  }
  if(num==true){IDX++;}else{IDX+=0;}
  if(key==' '){
  for(int a=0;a<mx;a++){
      T[a]=0;tX[a]=0;tY[a]=0;SIN[a]=0;IDX=0;
    }
  }
}


float f;int F;boolean R;
void blink(){
  if(R==true){f-=1;}else{f-=0;}
  if(f==90){R=true;}else if(f==10){R=false;}
  fill(f);
}


