
int counter;

import arb.soundcipher.*;
SoundCipher sc;

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioInput in;
AudioRecorder recorder;
AudioPlayer player;
AudioPlayer applause;
FFT fft;

ArrayList balls = new ArrayList();
float t=0.25;
Red[] re = new Red[500];
Orange[] or = new Orange[500];
Blue[] bl = new Blue[500];
Green[] gr = new Green[500];
Yellow[] ye = new Yellow[500];
Purple[] pu = new Purple[500];
PaleBlue[] pa = new PaleBlue[500];
Low[] lo = new Low[500];


PFont font;
PImage back;
PImage clef;
PImage red;
PImage orange;
PImage yellow;
PImage green;
PImage blue;
PImage paleblue;
PImage purple;
PImage high;
PImage low;
int current_re;
int current_or;
int current_bl;
int current_gr;
int current_ye;
int current_pu;
int current_pa;
int current_hi;
int current_lo;
int g;
int x;
int y;
int z0;
int z1;

int dx;
int dy;

Boolean started = false;



void setup() {
  int i;
  size(1280, 720);
  background(0);
  //錄音
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1280);
  recorder = minim.createRecorder(in, "myrecording.wav", true);
  //音樂檔案
  player = minim.loadFile("KALA.mp3");
  applause = minim.loadFile("applaus.mp3");
  // 啟動音樂播放
  player.pause();  
  player.shiftGain(.0, 0.0, 10000);
  player.setGain(-10.0);
  player.mute();
  player.unmute();
  applause.shiftGain(.0, 0.0, 10000);
  applause.setGain(-10.0);
  applause.mute();
  applause.unmute();
  // 給定參數建立 FFT 分析物件
  fft = new FFT(player.bufferSize(), player.sampleRate());
  println(player.getControls());
  //midi
  sc = new SoundCipher(this);
  // 顯示本機上所有 MIDI 裝置資訊
  sc.getMidiDeviceInfo();
  // 設定所使用的 MIDI 輸出裝置
  sc.setMidiDeviceOutput(1);
  // 選擇樂器, 編號 46 樂器是豎琴
  sc.instrument(1);
  back = loadImage("cat.gif");
  clef = loadImage("table clef.gif");
  font = loadFont("AgencyFB-Bold-28.vlw");
  red = loadImage("red.gif");
  orange= loadImage("orange.gif");
  yellow= loadImage("yellow.gif");
  green= loadImage("green.gif");
  blue= loadImage("blue.gif");
  paleblue= loadImage("paleblue.gif");
  purple= loadImage("purple.gif");
  low=loadImage("low.gif");
  high=loadImage("high2.gif");
  smooth();
  colorMode(HSB,360,100,100,100);
 }
 
 
void draw() {
  float v;
  float w;
  float x1, y1, x2, y2;
  float x3, y3;
  int n;
  int i;
  //波形
  background(g,100,100);
  g++;
  if (g>360) g=0;
  // 白色線條繪製波形
  image(back,0,0);
  stroke(255);
  // in 的緩衝站存區 buffer 容量為 4096
  // 波型 waveform 的 振幅 amplitude 值介於 (-1, +1) 之間
  // 繪製左右混合聲道波形圖
  for (i = 0; i < in.bufferSize() - 1; i++) {
    x1 = i;
    // 左聲道波形第 i 點振幅值放大 50 倍
    y1 = 50 + in.mix.get(i) * 50;
    x2 = i+1;
    // 左聲道波形第 i+1 點振幅值放大 50 倍
    y2 = 50 + in.mix.get(i+1) * 50;
    // 連線第 i 點與第 i+1 點
    line(x1, y1, x2, y2);
  }
  // 累積波形強度
  v = 0.0;
  for (i = 0; i < in.bufferSize() - 1; i++) {
    v += abs(in.mix.get(i));
  }
  println(v);
//音樂圈圈
  noStroke();
  fft.forward(player.mix);
  // 預計處理的頻譜資料數目是 fft.specSize() / 4 (總資料量的前1/4數據)
  n = fft.specSize() / 4;
  for(i = 0; i < n; i++) {
    // 顏色是由頻率高低來決定, 低頻是紅色, 高頻是藍色
    fill(360.0*i/n, 100, 100, 90);
    // 取得第i筆頻譜數據, 放大四倍, 做為所繪製圓形的直徑
    w = fft.getBand(i) * 4;
    // 圓心隨機產生
    x3 = random(0, width);
    y3 = random(0, height);
    ellipse(x3, y3, w, w);
  }
  //音符
  for (i = 0; i <= current_re - 1; i++) {
    re[i].update(); 
  }
  //橘色
  for (i = 0; i <= current_or - 1; i++) {
    or[i].update(); 
  }
  //藍色
  for (i=0 ; i<=current_bl - 1; i++) {
    bl[i].update();
  }
  //綠色
  for (i=0 ; i<=current_gr-1; i++) {
    gr[i].update();
  }
  //黃色
  for (i=0 ; i<=current_ye-1; i++) {
    ye[i].update();
  }
  //紫色
  for (i=0 ; i<=current_pu-1; i++) {
    pu[i].update();
  }
  //深藍
  for (i=0 ; i<=current_pa-1; i++) {
    pa[i].update();
  }
  //降
  for (i=0 ; i<=current_lo-1; i++) {
    lo[i].update();
  }
  //升
  Ball b;
  for (i = 0; i <= balls.size() - 1; i++) {
    b=(Ball)balls.get(i);
    b.display();
    b.gravity();
    b.jump();
  }
//鍵盤 C 
  stroke(0);
  fill(0,99,99);
  rect(0,570,45,150);
  rect(315,570,45,250);
  rect(630,570,45,150);
  rect(945,570,45,150);
  rect(1260,570,45,150);
//D
  fill(37,99,99);
  rect(45,570,45,150);
  rect(360,570,45,150);
  rect(675,570,45,150);
  rect(990,570,45,150);
//E 
  fill(64,99,99);
  rect(90,570,45,150);
  rect(405,570,45,150);
  rect(720,570,45,150);
  rect(1035,570,45,150);
//F 
  fill(113,99,99);
  rect(135,570,45,150);
  rect(450,570,45,150);
  rect(765,570,45,150);
  rect(1080,570,45,150);
//G  
  fill(198,99,99);
  rect(180,570,45,150);
  rect(495,570,45,150);
  rect(810,570,45,150);
  rect(1125,570,45,150);
//A  
  fill(238,99,74);
  rect(225,570,45,150);
  rect(540,570,45,150);
  rect(855,570,45,150);
  rect(1170,570,45,150);  
//B
  fill(275,97,69);
  rect(270,570,45,150);
  rect(585,570,45,150);
  rect(900,570,45,150);
  rect(1215,570,45,150);  
//黑鍵 八度一
  fill(275,1,0);
  rect(29,570,32,93);
  rect(74,570,32,93);
  rect(164,570,32,93);
  rect(209,570,32,93);
  rect(254,570,32,93);
//八度二  
  rect(344,570,32,93);
  rect(389,570,32,93);
  rect(479,570,32,93);
  rect(524,570,32,93);
  rect(569,570,32,93);
//八度三  
  rect(659,570,32,93);
  rect(704,570,32,93);
  rect(794,570,32,93);
  rect(839,570,32,93);
  rect(884,570,32,93);
//八度四  
  rect(974,570,32,93);
  rect(1019,570,32,93);
  rect(1109,570,32,93);
  rect(1154,570,32,93);
  rect(1199,570,32,93);
  //播放鍵
  fill(57,54,99);
  triangle(1238,510,1238,550,1270,530);
  //錄音說明
  noStroke();
  fill(305,41,99,50);
  rect(805,510,410,40);
  fill(305,1,99);
  textFont(font,22);
  text("Press R to start and end recording, Press S to save", 810,540);
  fill(357,99,99);
  ellipse(1198,530,25,25);
  //高音譜記號球
  if (started == true) {
    x+=dx;
    y+=dy;
    image(clef,x,y);
    if ((x>1280) || (x<0)) { dx=-dx;}
    if ((y>520) || (y<0)) { dy= -dy;}
  }
}


void mousePressed() {
  if (mouseX<45 && mouseY>570) {
    sc.playNote(48,80,1); }
  if(mouseX>45 && mouseX<90 && mouseY>570 ) {
    sc.playNote(50,80,1); }
  if(mouseX>90 && mouseX<135 && mouseY>570 ) {
    sc.playNote(52,80,1); }
  if(mouseX>135 && mouseX<180 && mouseY>570 ) {
    sc.playNote(53,80,1); }
  if(mouseX>180 && mouseX<225 && mouseY>570 ) {
    sc.playNote(55,80,1); }
  if(mouseX>225 && mouseX<270 && mouseY>570 ) {
    sc.playNote(57,80,1); }
  if(mouseX>270 && mouseX<315 && mouseY>570 ) {
    sc.playNote(59,80,1); }
  if(mouseX>315 && mouseX<360 && mouseY>570 ) {
    sc.playNote(60,80,1); }
  if(mouseX>360 && mouseX<405 && mouseY>570 ) {
    sc.playNote(62,80,1); }
  if(mouseX>405 && mouseX<450 && mouseY>570 ) {
    sc.playNote(64,80,1); }
  if(mouseX>450 && mouseX<495 && mouseY>570 ) {
    sc.playNote(65,80,1); }
  if(mouseX>495 && mouseX<540 && mouseY>570 ) {
    sc.playNote(67,80,1); }
  if(mouseX>540 && mouseX<585 && mouseY>570 ) {
    sc.playNote(69,80,1); }
  if(mouseX>585 && mouseX<630 && mouseY>570 ) {
    sc.playNote(71,80,1); }
  if(mouseX>630 && mouseX<675 && mouseY>570 ) {
    sc.playNote(72,80,1); }
  if(mouseX>675 && mouseX<720 && mouseY>570 ) {
    sc.playNote(74,80,1); }
  if(mouseX>720 && mouseX<765 && mouseY>570 ) {
    sc.playNote(76,80,1); }
  if(mouseX>765 && mouseX<810 && mouseY>570 ) {
    sc.playNote(77,80,1); }
  if(mouseX>810 && mouseX<855 && mouseY>570 ) {
    sc.playNote(79,80,1); }
  if(mouseX>855 && mouseX<900 && mouseY>570 ) {
    sc.playNote(81,80,1); }
  if(mouseX>900 && mouseX<945 && mouseY>570 ) {
    sc.playNote(83,80,1); }
  if(mouseX>945 && mouseX<990 && mouseY>570 ) {
    sc.playNote(84,80,1); }
  if(mouseX>990 && mouseX<1035 && mouseY>570 ) {
    sc.playNote(86,80,1); }
  if(mouseX>1035 && mouseX<1080 && mouseY>570 ) {
    sc.playNote(88,80,1); }
  if(mouseX>1080 && mouseX<1125 && mouseY>570 ) {
    sc.playNote(89,80,1); }
  if(mouseX>1125 && mouseX<1170 && mouseY>570 ) {
    sc.playNote(91,80,1); }
  if(mouseX>1170 && mouseX<1215 && mouseY>570 ) {
    sc.playNote(93,80,1); }
  if(mouseX>1215 && mouseX<1260 && mouseY>570 ) {
    sc.playNote(95,80,1); }
  if(mouseX>1260 && mouseY>570 ) {
    sc.playNote(96,80,1); }
//黑鍵
  if (mouseX<61 && mouseX>29 && mouseY>570 && mouseY<663) {
    sc.playNote(49,80,1); }
  if (mouseX<106 && mouseX>74 && mouseY>570 && mouseY<663) {
    sc.playNote(51,80,1); }
  if (mouseX<196 && mouseX>164 && mouseY>570 && mouseY<663) {
    sc.playNote(54,80,1); }
  if (mouseX<241 && mouseX>209 && mouseY>570 && mouseY<663) {
    sc.playNote(56,80,1); }
  if (mouseX<286 && mouseX>254 && mouseY>570 && mouseY<663) {
    sc.playNote(58,80,1); }

  if (mouseX<376 && mouseX>344 && mouseY>570 && mouseY<663) {
    sc.playNote(61,80,1); }
  if (mouseX<421 && mouseX>389 && mouseY>570 && mouseY<663) {
    sc.playNote(63,80,1); }
  if (mouseX<511 && mouseX>479 && mouseY>570 && mouseY<663) {
    sc.playNote(66,80,1); }
  if (mouseX<556 && mouseX>524 && mouseY>570 && mouseY<663) {
    sc.playNote(68,80,1); }
  if (mouseX<601 && mouseX>569 && mouseY>570 && mouseY<663) {
    sc.playNote(70,80,1); }
    
  if (mouseX<691 && mouseX>659 && mouseY>570 && mouseY<663) {
    sc.playNote(73,80,1); }
  if (mouseX<736 && mouseX>704 && mouseY>570 && mouseY<663) {
    sc.playNote(75,80,1); }
  if (mouseX<826 && mouseX>794 && mouseY>570 && mouseY<663) {
    sc.playNote(78,80,1); }
  if (mouseX<871 && mouseX>839 && mouseY>570 && mouseY<663) {
    sc.playNote(80,80,1); }
  if (mouseX<916 && mouseX>884 && mouseY>570 && mouseY<663) {
    sc.playNote(82,80,1); }

  if (mouseX<1006 && mouseX>974 && mouseY>570 && mouseY<663) {
    sc.playNote(85,80,1); }
  if (mouseX<1051 && mouseX>1019 && mouseY>570 && mouseY<663) {
    sc.playNote(87,80,1); }
  if (mouseX<1141 && mouseX>1109 && mouseY>570 && mouseY<663) {
    sc.playNote(90,80,1); }
  if (mouseX<1186 && mouseX>1154 && mouseY>570 && mouseY<663) {
    sc.playNote(92,80,1); }
  if (mouseX<1231 && mouseX>1199 && mouseY>570 && mouseY<663) {
    sc.playNote(94,80,1); }
  if (applause.isPlaying() == true) {
        applause.pause();
      }
  if (mouseY<570) {
    started = true;
    x= mouseX;
    y= mouseY;
    dx=(int)random(-15,15);
    dy=(int)random(-15,15);
  }
  color c;
  if (mousePressed == true){  
    c = get(mouseX, mouseY);
    if (c == color(57,54,99)) {
      if (player.isPlaying() == true) {
        player.pause();
      } else{
        player.play();
      }
    }
    if (mouseY>570) {
    //紅色音符
      if (c == color(0,99,99)) {
        re[current_re] = new Red((int)random(0,1280),(int)random(0,565));
        current_re++;
      }
    //橘色
      if (c == color(37,99,99)) {
        or[current_or] = new Orange((int)random(0,1280),(int)random(0,565));
        current_or++;
      }
    //藍色
      if (c == color(198,99,99)) {
        bl[current_bl] = new Blue((int)random(0,1280),(int)random(0,565));
        current_bl++;
      }
    //綠色
      if (c == color(113,99,99)) {
        gr[current_gr] = new Green((int)random(0,1280),(int)random(0,565));
        current_gr++;
      }
    //黃色
      if (c == color(64,99,99)) {
        ye[current_ye] = new Yellow((int)random(0,1280),(int)random(0,565));
        current_ye++;
      }
      //深藍
      if (c == color(238,99,74)) {
        pa[current_pa]= new PaleBlue((int)random(0,1280),(int)random(0,565));
        current_pa++;
      }
    //紫色
      if (c == color(275,97,69)) {
        pu[current_pu] = new Purple((int)random(0,1280),(int)random(0,565));
        current_pu++;
      }  
      //降
      if (c == color(275,1,0)) {
        lo[current_lo] = new Low((int)random(0,1280),(int)random(0,565));
        current_lo++;
      }
    }
  }  
}


void keyReleased()
{
  // 按下 r 表示啟動錄音或關閉錄音
  if (key == 'r') {
    if (recorder.isRecording() == true) {
      recorder.endRecord();
    } else {
      recorder.beginRecord();
    }
  }
  // 按下 s 代表儲存音訊於檔案中
  if (key == 's') {
    recorder.save();
  }
}

void mouseDragged() {
  if (mouseY<570){
    Ball b;
    b = new Ball(mouseX,mouseY);
    balls.add(b);
    applause.loop();
  }  
}



class Red{
  int a;
  int b;
  Red (int a0, int b0) {
    a = a0;
    b = b0;  }
  void update (){
    image(red,a,b);
  }
}



class Orange{
  int a;
  int b;
  Orange (int a0, int b0) {
    a = a0;
    b = b0;  }
  void update (){
    image(orange,a,b);
    a += (int)random(-5,5);  }
}

class Yellow{
  int a;
  int b;
  float rot;
  Yellow (int a0, int b0) {
    a = a0;
    b = b0;
    rot=random(0,TWO_PI);
  }
  void update (){
    rot += 0.09;
    draw_yellow_note(a,b,rot);
  }
}

void draw_yellow_note(int a, int b, float rot) {

  pushMatrix(); 
  translate(a,b);
  rotate(rot);
  image(yellow,0,0);
  popMatrix();
}


class Green{
  int a;
  int b;
  int da;
  Green (int a0, int b0) {
    a = a0;
    b = b0;
    da = (int)random (0,10) ;}
  void update (){
    image(green,a,b);
    a += da;
    if ((a>1280) || (a<0)) { da=-da;}
  }
}

class Blue{
  int a;
  int b;
  int db;
  Blue (int a0, int b0) {
    a = a0;
    b = b0;
    db = 2;  }
  void update (){
    image(blue,a,b);
    b += db; 
    if ((b>565) || (b<0)) { db=-db;  }
  }
}

class PaleBlue {
  int a;
  int b;
  PaleBlue (int a0, int b0) {
    a = a0;
    b = b0;  }
  void update (){
    image(paleblue,a,b);
  }
}


class Purple{
  int a;
  int b;
  Purple (int a0, int b0) {
    a = a0;
    b = b0;  }
  void update (){
    image(purple,a,b);
    a += (int)random(-5,5);
    b += (int)random(-6,6);
  }
}

class Low{
  int a;
  int b;
  int da;
  int db;
  Low (int a0, int b0) {
    a = a0;
    b = b0;
    da =(int)random(-10,10);
    db =(int)random(-10,10);
  }
  void update (){
    image(low,a,b);
    a += da;
    b += db;
  }
}


class Ball { // Class 類別
  // 屬性 (特徵)
  float x, y,v;
  int r;
  Ball(float x0,float y0){
    x=x0;
    y=y0;
    v=0;
  }
 void gravity(){//重力
    v+=t;
  }
 void jump(){//彈跳
    y+=v;
    if(y>height-95){ //落地反彈
      if(r>20){v*=-0.65;} //反彈高度1
      else{ v*=-0.95;} //反彈高度2
      y = height-95;}
   }
 void display(){//畫水珠
    image(high,x,y);
    }
}

void stop()
{
  player.close();
  in.close();
  // 停止 minim 音樂處理物件運作
  minim.stop();
  // 使用 minim 的上層物件也停止
  super.stop();
}
