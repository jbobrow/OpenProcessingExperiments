
PImage img;

import ddf.minim.signals.*;//音声解析
import ddf.minim.*;


AudioPlayer [] song;//3曲の中から1曲目を再生
Minim minim;
int s = 0;

PFont font;

float angle = 10.0;//回転する花
float offset = 1000;
float scalar = 200;
float speed = 0.8;
int c = 0;
float a = random(30,40);//花びらの大きさ
float b = random(5,10);

int slidstartX = 0;//スライド
int slidstopX = 0;
int slidstartY = 610;
int slidstopY = 570;
float y2 = slidstartY;
float x2 = slidstartX;
float step2 = 0.08;
float pct2 = 0.0;
int moji0 = 100 , moji1 = 100,
moji2 = 100 ,sankaku = 100,
shikaku = 100;//スライド部分のボタンの色



void setup(){
 
  
 colorMode(HSB,100);
 background(20,60,100);
 size(800,600);

 minim = new Minim(this);//楽曲・フォントをインポート
  song = new AudioPlayer[3]; 
  song[0] = minim.loadFile("canon.mp3", 1024);
  song[1] = minim.loadFile("kirakiraboshi.mp3", 1024);
  song[2] = minim.loadFile("london.mp3", 1024);
  font = loadFont("Didot-Bold-48.vlw");
img = loadImage("ha.gif"); 

 frameRate(10);
 smooth();

}

void draw(){
 fill(c+=5,30,100,20);//色相は5ずつ増え100で0に戻る
 if(c>=100) c=0;
 rect(0,0,width,height);
 float x = offset+cos(angle)*scalar;
 float y = offset+sin(angle)*scalar;

 angle -= speed;
 int range = 200;

 for(int i = 0; i < song[s].mix.size()-1; i++)//L,Rの音声を取得
  {
  a = a + i/800;//花びらはa=80,b=60になると5に戻る
  b = b + i/800;
  if(a >=80) a = 5;
  if(b >=60) b = 5;

  stroke(100);//白い線で上下に波形を描画する
  strokeWeight(1);
  line(i,100+song[s].left.get(i+1)*range, 
       i+1,  100+song[s].left.get(i)*range);// Lチャンネル
  line(i, 500 + song[s].right.get(i)*range,
       i+1, 500 + song[s].right.get(i+1)*range);// Rチャンネル
 }
 particle();//中心のパーティクルもどき

 translate(-width/2+x,-height/2+y-100);//花を回転させる
 flower();

 resetMatrix();//座標リセット
 slider();
 title();
}



void flower(){
 noStroke();
 translate(width/2,height/2);//中心から描画
 fill(random(100),60,100);//花びらの色はランダム
 for(int i = 0 ; i <=6 ; i++){//花びら6枚
  ellipse(0,-40,a-b,a);
  rotate(radians(60));
 }
 fill(random(100),60,100);
 ellipse(0,0,b,b);//花の中心の円を小さめ描画
}



void particle(){//パーティクルもどき
 for (int o = 0 ; o < song[s].mix.size()-1000; o++)//波形とは違う値で取得
 {
   for (int u = 0 ; u<song[s].mix.get(o+1)*30;u+=2){
   fill(100,50);
   ellipse(width/2+random(-u,u)*30, 
   height/2+random(-u,u)*30, u*5, u*5);//白ベタの円
   stroke(100,50);
   noFill();
   ellipse(width/2+random(-u,u)*60,
   height/2+random(-u,u)*60, u*10, u*10);//白線の円
  }
 }
}


void slider(){//下スライドの作成
 noStroke();
 fill(sankaku);
 triangle(x2+10, y2+25, x2+30,
          y2+43, x2+10, y2+55);//再生
 fill(shikaku);
 rect(x2+60, y2+28, 24, 24);//停止  
 if (pct2 < 1.0 && mouseX > 0 && mouseX < 800 
 && mouseY > 500 && mouseY < 800) {//スライドの動き
 y2 = slidstopY + (( slidstopY-slidstartY )* pct2);
 pct2 += step2;
 }else{
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
  sankaku = 50;
  shikaku = 100;   
  offset = 400;//花の輪が中央に出現
 }else{
   offset = 1000;
  }//再生時以外は画面外へ
 
 if (mouseX > x2+60 && mouseX < x2+84 &&
     mouseY > y2+28 && mouseY < y2+52) {
  song[s].pause();//停止
  sankaku = 100;
  shikaku = 50;
 } 
 
 if (mouseX > x2+260 && mouseX < x2+330 &&
     mouseY > y2-20&& mouseY < y2+15) {
  song[s].pause();
  song[s].rewind();
  s = 0;//1曲目再生
  song[s].play();
  moji0 = 50;
  moji1 = 100;
  moji2 = 100;
  sankaku = 50;
  shikaku = 100;
  offset = 400;
 }
   
 if (mouseX > x2+360 && mouseX < x2+430 &&
     mouseY > y2-20&& mouseY < y2+15) {
  song[s].pause();
  song[s].rewind();
  s = 1;//2曲目再生
  song[s].play();
  moji0 = 100;
  moji1 = 50;
  moji2 = 100;
  sankaku = 50;
  shikaku = 100;
  offset = 400;
 }
   
 if (mouseX > x2+460 && mouseX < x2+530 &&
     mouseY > y2-20&& mouseY < y2+15) {
  song[s].pause();
  song[s].rewind();
  s = 2;//3曲目再生
  song[s].play();
  moji0 = 100;
  moji1 = 100;
  moji2 = 50;
  sankaku = 50;
  shikaku = 100;
  offset = 400;
 }
}



void title(){//左上の曲名表記
 fill(100,60);
 if(moji0==50)text("Pachelbel's Canon",10,40);
 if(moji1==50)text("Twelve Variations on -Ah vous dirai-je, Maman-",10,40);
 if(moji2==50)text("Londonderry_Air",10,40);  
}



void stop(){
 song[s].close();//終了
 minim.stop(); 
 super.stop();
}

