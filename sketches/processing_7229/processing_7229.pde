
///////////////////  STEP_RABY  //////////////////////////

/// Push space key to reset. 
/// And drug mouse to change your sight.

import processing.opengl.*;
float ROT = 0;
int Counter = 0; //キー長押しのタイミングカウンター
int Color = 50;

int I = int(random(3,100));//階段の本数
int[] UorD  = new int[I];//昇降
int[] FLOOR = new int[I];//フロア形態
int[] LorR  = new int[I];//左右
int[] step  = new int[I];//中間ステップ数
int X;
int Y;

void setup()
{
  background(10);
  size(800,600,OPENGL);
  colorMode(HSB,100);
  frameRate(30);
  
  initData();
}

void draw()
{
  background(10);
  lights();
  translate(height/2,width/2,-300);
  ROT();
  fill(100,70,50);
  LABY();
}

void LABY(){
  
  //stroke(100);
  rectMode(CENTER);
  pushMatrix(); 
  translate(X,Y);
    //ラビリンス生成
  for(int i=0 ; i<I ; i++){
    STEP( UorD[i] //上下指定
         ,FLOOR[i]//フロア形態
         ,LorR[i] //方向指定
         ,step[i] //中間ステップ数
        );
   }
  translate(I*I/2,0);
  rect(0,0,I*I,90);
  popMatrix();
}
  
void STEP(int UorD //上下指定
         ,int FLOOR//フロア形態
         ,int LorR   //方向指定
         ,int step //中間ステップ数
         ){
  stroke(100,Color,100);
  strokeWeight(3); //ビロビロの正体
  rectMode(CENTER);
  
  UorD = 1-2*UorD;  //昇降の値を1、-1に変換
  LorR = 1-2*LorR;  //左右の値を1、-1に変換
 
  switch(FLOOR){  //フロアを描写
    case 0 ://前方半板
     translate(25,0);
     rect(0,0,50,90);
     translate(25,0);
     break;
     
     default ://前方全版
     beginShape();
     vertex(0,45*LorR);
     vertex(95,45*LorR);
     vertex(95,-50*LorR);
     vertex(5,-50*LorR);
     vertex(5,-45*LorR);
     vertex(0,-45*LorR);
     endShape();
     translate(50,0);
     rotateZ(radians(-90*LorR));
     translate(50,0);    
    break;
    
    case 2 ://側方(左)
    translate(50,-50);
    rect(0,0,100,190);
    rotateZ(radians(-90));
    translate(50,0);
    rotateZ(radians(-90));
    translate(50,0);    
    break;
    
    case 3 ://側方(右)
    translate(50,50);
    rect(0,0,100,190);
    rotateZ(radians(90));
    translate(50,0);
    rotateZ(radians(90));
    translate(50,0);    
    break;
  }    
  for(int i=0 ; i<step ; i++){  //中間の階段を描写
    rotateY(radians(90*UorD));
    translate(7,0);
    rect(0,0,14,90);
    translate(7,0);
    rotateY(radians(-90*UorD));
    translate(10,0);
    
    rect(0,0,20,90);
    translate(10,0);
  }
  //最後のステップと座標移動
  rotateY(radians(90*UorD));
  translate(7,0);
  rect(0,0,14,90);
  translate(7,0);
  rotateY(radians(-90*UorD));
}
    
void initData() 
{
  for(int i=0 ; i<I ; i++)
  {
    UorD[i]   = int(random(0,2));  //昇降
    FLOOR[i]  = int(random(0,5));  //フロア形態
    LorR[i]   = int(random(0,2));  //左右
    step[i]   = int(random(2,15)); //中間ステップ数
  }
  X = int(random(300));
  Y = int(random(300));
}    
void ROT(){
  ROT = ROT + 0.4;
  if(mousePressed) {
    //マウスで回転操作
    rotateX(radians(mouseY*0.8-100));
    rotateZ(radians(mouseX));   
  } else {
    rotateX(radians(103)); 
    rotateZ(radians(ROT));    
  }
}
void keyPressed(){
  switch(key){
    case ' ' :
      //キーの長押しで連続再構築
      Counter += 5;
      if(Counter >40){
        initData();
      }
    break;
    case 'z' :
    save("STEP"+year()+month()+day()+"_"+hour()+minute()+second()+".png");
    break;
  }
}

void keyReleased(){
  switch(key){
    case ' ' :   //スペースキーを押すたび階段を再構築する
     background(10);
     initData();
     Counter = 0;
     Color += 10;
     if(Color > 150){
       Color = 0;}
     break;
    case CODED :
     switch(keyCode){
       case UP :       
       break;
       case DOWN :
       break;
     }
  }
}

