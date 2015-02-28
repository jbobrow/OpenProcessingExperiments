


import ddf.minim.signals.*;//音声解析
import ddf.minim.*;


AudioPlayer [] song;//3曲の中から1曲目を再生
Minim minim;
int s = 0;

PFont font;

float angle=10;//樹木曲線
float branch=21;


int slidstartX = 0;//スライド
int slidstopX = 0;
int slidstartY = 610;
int slidstopY = 570;
float y2 = slidstartY;
float x2 = slidstartX;
float step2 = 0.08;
float pct2 = 0.0;
int moji0 = 255 , moji1 = 255,
moji2 = 255 , sankaku = 255,
shikaku = 255;//スライド部分のボタンの色



void setup(){


 size(800, 600);
 colorMode(HSB, 255);
 background(255, 100, 255);

 minim = new Minim(this);//楽曲・フォントをインポート
  song = new AudioPlayer[3]; 
  song[0] = minim.loadFile("Amazing_Grace.mp3", 1024);
  song[1] = minim.loadFile("maistar.mp3", 1024);
  song[2] = minim.loadFile("Scarborough Fair.mp3", 1024);
  font = loadFont("ComicSansMS-Bold-48.vlw");

 
  frameRate(10);
  smooth();
}



void draw(){
 fill(random(255), 200, 200, 30);//背景色ランダム
 rect(-10, -10, width+20, height+20);
 snow();//ランダム配置に雪を描画
 maru();//L,R,Mixそれぞれに連動して円を描画
 scale(2);
 if(sankaku == 0)treeLine(width/4*1, height/5*2+10,-90, branch);
 //再生時に中央に木が出現
 scale(0.5);
 fill(0, 80);//地面を描画
 noStroke();
 ellipse(width/2, height, 900, 200); 
 slider();//スライド
 title();

}



void treeLine(float X, float Y, float A, float L)
{
 float l=L*0.98;
 float a=A;
 float a1=a+(angle+random(0, 10));//枝を描く
 float a2=a-(angle+random(0, 10));
 float x=X;
 float y=Y;
 float x1=cos(radians(a1))*l+x;//先端に行くほど細く
 float y1=sin(radians(a1))*l+y;
 float x2=cos(radians(a2))*l+x;
 float y2=sin(radians(a2))*l+y;
 stroke(0);
 strokeWeight(0.15);//細い線で描く
 line(x, y, x1, y1);//x,yからx1,y1へ直線を引く
 line(x, y, x2, y2);
 if (l>17)  
  {
  treeLine(x1, y1, a1, l);
  treeLine(x2, y2, a2, l);
 }
}




void maru() { //L,R,Mixの円
 strokeWeight(0.2);
 stroke(0, 10);
 noFill();
 //中央の円（Mix）
 for(int p1 = 0; p1 < song[s].mix.size()-1; p1++){
  for(int i1 = 1 ; i1 < song[s].mix.get(p1+1)*10 ; i1++) {
   ellipse(width/2+i1, height/4*3+i1, p1*0.4, p1*0.4);
   }
  }
 //右の円（Right）
 stroke(0, 30);
 for(int p2 = 0; p2 < song[s].right.size()-1; p2++){
  for(int i2 = 1 ; i2 < song[s].right.get(p2+1)*10 ; i2++) {
   ellipse(width-100*i2, height/5*4*i2, p2*0.25, p2*0.25); 
   }
  }
 //左の円（Left） 
 stroke(0, 20);
 for(int p3 = 0; p3 < song[s].left.size()-1; p3++){
  for(int i3 = 1 ; i3 <song[s].left.get(p3+1)*10 ; i3++){
  ellipse(100*i3, height/5*4*i3, p3*0.25, p3*0.25);
  }
 }
}



void snow(){//ランダムに雪を描画する
 for (int p = 0; p < song[s].mix.size()-1; p++){
  for (int i = 1 ; i <song[s].mix.get(p+1)*4 ; i ++) {
   fill(255, random(100, 200));//透明度をランダムに
   noStroke();
   ellipse(random(width)*i, random(height)*i, p*0.05, p*0.05);
  }
 }
}







void slider(){//下スライドの作成  
 fill(sankaku,80);
 triangle(x2+10, y2+25, x2+30,
          y2+43, x2+10, y2+55);//再生
 fill(shikaku,80);
 rect(x2+60, y2+28, 24, 24);//停止 
 if (pct2 < 1.0 && mouseX > 0 && mouseX < 800 &&
     mouseY > 500 && mouseY < 800) {//スライドの動き
 y2 = slidstopY + (( slidstopY-slidstartY )* pct2);
 pct2 += step2;
}else {
  if (mouseX > 0 && mouseX < 800 &&
      mouseY > 0 && mouseY < 490) {
    y2 = 900;
    triangle(x2+10, y2+25, x2+30,
             y2+43, x2+10, y2+55);//再生
    rect(x2+60, y2+28, 24, 24);//停止
    pct2 = 0.0;//リセットすることで何度も機能する
  }
 }
  textFont(font,20);//スライド内の音楽データ選択
  fill(moji0,80);
  text("[song1]",x2+width/2-140,y2);
  fill(moji1,80);
  text("[song2]",x2+width/2-40,y2);
  fill(moji2,80);
  text("[song3]",x2+width/2+60,y2);
}



void mousePressed() {//マウス操作
 if (mouseX > x2+10 && mouseX < x2+30 &&
     mouseY > y2+25 && mouseY < y2+55) {
  song[s].play();//再生
  song[s].rewind();
  sankaku = 0;
  shikaku = 255;
 } 
 
 if (mouseX > x2+60 && mouseX < x2+84 &&
     mouseY > y2+28 && mouseY < y2+52) {
  song[s].pause();//停止
  sankaku = 255;
  shikaku =0;
 }
 
 if (mouseX > x2+260 && mouseX < x2+330 &&
     mouseY > y2-20&& mouseY < y2+15) {
  song[s].pause();
  song[s].rewind();
  s = 0;//1曲目再生
  song[s].play();
  moji0 = 0;
  moji1 = 255;
  moji2 = 255;
  sankaku = 0;
  shikaku = 255;
 }
   
  if (mouseX > x2+360 && mouseX < x2+430 &&
      mouseY > y2-20&& mouseY < y2+15) {//rect
  song[s].pause();
  song[s].rewind();
  s = 1;//2曲目再生
  song[s].play();
  moji0 = 255;
  moji1 = 0;
  moji2 = 255;
  sankaku = 0;
  shikaku = 255;
 }
   
  if (mouseX > x2+460 && mouseX < x2+530 &&
      mouseY > y2-20&& mouseY < y2+15) {
  song[s].pause();
  song[s].rewind();
  s = 2;//3曲目再生
  song[s].play();
  moji0 = 255;
  moji1 = 255;
  moji2 = 0;
  sankaku = 0;
  shikaku = 255;
 }  
}



void title(){//左上の曲名表記
 fill(255,60);
 if(moji0==0)text("Amazing_Grace",10,40);
 if(moji1==0)text("Meistersinger_Prelude",10,40);
 if(moji2==0)text("Scarborough_Fair",10,40); 
}



void stop(){
 song[s].close();//終了
 minim.stop(); 
 super.stop();
}

