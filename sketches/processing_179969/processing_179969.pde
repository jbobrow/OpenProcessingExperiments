
/*@pjs preload="bodr.png,sl002.png,shade.png,pl_c.png,pl_v.png,pl_b.png,pl_n.png,pl_m.png,uno_1.png,uno_2.png,uno_3.png";*/

PImage img;


int c_sp=30;
int n_sp=60;
int sp=n_sp;  //回転スピード

void setup() {
  size(400, 300);
  frameRate(120); 
  background(255 );
  smooth();
}

// スロット初期位置
int sl1=30;
int sl2=30-170*1;
int sl3=30-170*2;
int sl4=30-170*3;
int sl5=30-170*4;
int sl1_2=30-850;
int sl2_2=30-170*1-850;
int sl3_2=30-170*2-850;
int sl4_2=30-170*3-850;
int sl5_2=30-170*4-850;

//スタート画面アルファ値
int img_alf_str=180;
//制御
// 0=停止　1=スタート画面　2=スロットスタート 3=スロット確定
// sub 1 , 2 , 3 , 4 , 5
int sw=0;
int sub_sw=0;

//加速用変数
int sl1_sp=sp;
int sl2_sp=sp;
int sl3_sp=sp;
int sl4_sp=sp;
int sl5_sp=sp;
int sl1_side=sl1;
int sl2_side=sl2;
int sl3_side=sl3;
int sl4_side=sl4;
int sl5_side=sl5;

//判定用変数
int sc=-80;  //センター座標調整
int ss_1s=-(35+sc);  //レーン1上部座標
int ss_1e=-(205+sc); //レーン1下部座標
int ss_2s=-(205+sc); //レーン2上部座標
int ss_2e=-(415+sc); //レーン2下部座標
int ss_3s=-(415+sc); //レーン2上部座標
int ss_3e=-(585+sc); //レーン3下部座標
int ss_4s=-(585+sc); //レーン3上部座標
int ss_4e=-(755+sc); //レーン4下部座標
int ss_5s=-(755+sc); //レーン5上部座標
int ss_5e=-(850+sc); //レーン5下部座標
int ss_5_2s=105; //レーン5上部座標
int ss_5_2e=70; //レーン5下部座標

//リーチ用ランダム変数
int rand; 

//---- 各レーン状態 ----//
/*  0=静止（初期） 
    1=回転
    2=静止             */
int c_r1=0;
int c_r2=0;
int c_r3=0;
int c_r4=0;
int c_r5=0;

int r1,g1,b1,r2,g2,b2,r3,g3,b3,r4,g4,b4,r5,g5,b5;


void draw() {
  //--スロット背面帯
  //カラー制御
  println(c_r1);
  if(sl1==30 && c_r1==2){
  //--レーン1--//
  r1=167; g1=209; b1=234;
    }else{r1=255; g1=255; b1=255;
    }
    
  if(sl2==30-170 && c_r2==2){
  r2=247; g2=149; b2=175;
    }else{r2=255; g2=255; b2=255;
    }
  //--レーン3--//
  
  if(sl3==30-170*2 && c_r3==2){
    r3=255; g3=222; b3=136;
  }else{r3=255; g3=255; b3=255;
  }
  //--レーン4--//
    if(sl4==30-170*3 && c_r4==2){
      r4=155; g4=209; b4=153;
    }else{r4=255; g4=255; b4=255;
    }
  if(sl5==30-170*4 && c_r5==2){
   r5=117; g5=182; b5=222;
  }else{r5=255; g5=255; b5=255;
  }
  
  tint(r1,g1,b1);
  img = loadImage("bodr.png");
  image(img, 0, 0);
  tint(r2,g2,b2);
  img = loadImage("bodr.png");
  image(img, 80, 0);
  tint(r3,g3,b3);
  img = loadImage("bodr.png");
  image(img, 160, 0);
  tint(r4,g4,b4);
  img = loadImage("bodr.png");
  image(img, 240, 0);
  tint(r5,g5,b5);
  img = loadImage("bodr.png");
  image(img, 320, 0);
 
  
  
  //スロット
  noTint();
  img = loadImage("sl002.png");
  image(img, 0, sl1);
  img = loadImage("sl002.png");
  image(img, 0, sl1_2);
  img = loadImage("sl002.png");
  image(img, 80, sl2);
  img = loadImage("sl002.png");
  image(img, 80, sl2_2);
  img = loadImage("sl002.png");
  image(img, 160, sl3);
  img = loadImage("sl002.png");
  image(img, 160, sl3_2);
  img = loadImage("sl002.png");
  image(img, 240, sl4);
  img = loadImage("sl002.png");
  image(img, 240, sl4_2); 
  img = loadImage("sl002.png");
  image(img, 320, sl5);
  img = loadImage("sl002.png");
  image(img, 320, sl5_2);
  
  if (sw==1){
  sl1=sl1+sl1_sp;
  sl2=sl2+sl2_sp;
  sl3=sl3+sl3_sp;
  sl4=sl4+sl4_sp;
  sl5=sl5+sl5_sp;

  sl1_2=sl1_2+sl1_sp;
  sl2_2=sl2_2+sl2_sp;
  sl3_2=sl3_2+sl3_sp;
  sl4_2=sl4_2+sl4_sp;
  sl5_2=sl5_2+sl5_sp; 
  sub_sw=1;
  }
  /*
  if (sub_sw==1){
  sw=21;
  sub_sw=0;
  }*/
  ///-------スロットループ--------/// 
  
  //--レーン1--//
  if (sl1 >=905) {
    sl1=sl1-1700;
  }else if (sl1_2>=905) {
    sl1_2=sl1_2-1700;
  }
  //--レーン2--//
  if (sl2 >=905) {
    sl2=sl2-1700;
  }else if (sl2_2>=905) {
    sl2_2=sl2_2-1700;
  }
  //--レーン3--//
  if (sl3 >=905) {
    sl3=sl3-1700;
  }else if (sl3_2>=905) {
    sl3_2=sl3_2-1700;
  }
  //--レーン4--//
  if (sl4 >=905) {
    sl4=sl4-1700;
  }else if (sl4_2>=905) {
    sl4_2=sl4_2-1700;
  }
  //--レーン5--//
  if (sl5 >=905) {
    sl5=sl5-1700;
  }else if (sl5_2>=905) {
    sl5_2=sl5_2-1700;
  }

  //------目の決定-----//
  
  if (ss_5_2e  <= sl1 && sl1 < ss_5_2s || ss_5_2e <= sl1_2 && sl1_2 < ss_5_2s) {
    sl1_side=30-170*4;
    //println("e");
  }
  else if (ss_1e  <= sl1 && sl1 < ss_1s|| ss_1e <= sl1_2 && sl1_2 < ss_1s) {
    sl1_side=30;
    //println("G");
  }
  else if (ss_2e <= sl1 && sl1 < ss_2s || ss_2e <= sl1_2 && sl1_2 < ss_2s) {
    sl1_side=30-170;
    //println("oo");
  }
  else if (ss_3e <= sl1 && sl1 < ss_3s || ss_3e <= sl1_2 && sl1_2 < ss_3s) {
    sl1_side=30-170*2;
    //println("g");
  }
  else if (ss_4e <= sl1 && sl1 < ss_4s || ss_4e <= sl1_2 && sl1_2 < ss_4s ) {
    sl1_side=30-170*3;
    //println("l");
  }
  else if (ss_5e <= sl1 && sl1 < ss_5s || ss_5e <= sl1_2 && sl1_2 < ss_5s) {
    sl1_side=30-170*4;
    //println("e");
  }

  //
     
  if (ss_5_2e  <= sl2 && sl2 < ss_5_2s || ss_5_2e <= sl2_2 && sl2_2 < ss_5_2s) {
    sl2_side=30-170*4;
    //println("e");
  }
  else if (ss_1e  <= sl2 && sl2 < ss_1s|| ss_1e <= sl2_2 && sl2_2 < ss_1s) {
    sl2_side=30;
    //println("G");
  }
  else if (ss_2e <= sl2 && sl2 < ss_2s || ss_2e <= sl2_2 && sl2_2 < ss_2s) {
    sl2_side=30-170;
    //println("oo");
  }
  else if (ss_3e <= sl2 && sl2 < ss_3s || ss_3e <= sl2_2 && sl2_2 < ss_3s) {
    sl2_side=30-170*2;
    //println("g");
  }
  else if (ss_4e <= sl2 && sl2 < ss_4s || ss_4e <= sl2_2 && sl2_2 < ss_4s ) {
    sl2_side=30-170*3;
    //println("l");
  }
  else if (ss_5e <= sl2 && sl2 < ss_5s || ss_5e <= sl2_2 && sl2_2 < ss_5s) {
    sl2_side=30-170*4;
    //println("e");
  }
  
    //
     
  if (ss_5_2e  <= sl3 && sl3 < ss_5_2s || ss_5_2e <= sl3_2 && sl3_2 < ss_5_2s) {
    sl3_side=30-170*4;
    //println("e");
  }
  else if (ss_1e  <= sl3 && sl3 < ss_1s|| ss_1e <= sl3_2 && sl3_2 < ss_1s) {
    sl3_side=30;
    //println("G");
  }
  else if (ss_2e <= sl3 && sl3 < ss_2s || ss_2e <= sl3_2 && sl3_2 < ss_2s) {
    sl3_side=30-170;
    //println("oo");
  }
  else if (ss_3e <= sl3 && sl3 < ss_3s || ss_3e <= sl3_2 && sl3_2 < ss_3s) {
    sl3_side=30-170*2;
    //println("g");
  }
  else if (ss_4e <= sl3 && sl3 < ss_4s || ss_4e <= sl3_2 && sl3_2 < ss_4s ) {
    sl3_side=30-170*3;
    //println("l");
  }
  else if (ss_5e <= sl3 && sl3 < ss_5s || ss_5e <= sl3_2 && sl3_2 < ss_5s) {
    sl3_side=30-170*4;
    //println("e");
  }
  
    //
     
  if (ss_5_2e  <= sl4 && sl4 < ss_5_2s || ss_5_2e <= sl4_2 && sl4_2 < ss_5_2s) {
    sl4_side=30-170*4;
    //println("e");
  }
  else if (ss_1e  <= sl4 && sl4 < ss_1s|| ss_1e <= sl4_2 && sl4_2 < ss_1s) {
    sl4_side=30;
    //println("G");
  }
  else if (ss_2e <= sl4 && sl4 < ss_2s || ss_2e <= sl4_2 && sl4_2 < ss_2s) {
    sl4_side=30-170;
    //println("oo");
  }
  else if (ss_3e <= sl4 && sl4 < ss_3s || ss_3e <= sl4_2 && sl4_2 < ss_3s) {
    sl4_side=30-170*2;
    //println("g");
  }
  else if (ss_4e <= sl4 && sl4 < ss_4s || ss_4e <= sl4_2 && sl4_2 < ss_4s ) {
    sl4_side=30-170*3;
    //println("l");
  }
  else if (ss_5e <= sl4 && sl4 < ss_5s || ss_5e <= sl4_2 && sl4_2 < ss_5s) {
    sl4_side=30-170*4;
    //println("e");
  }
  
  //
     
  if (ss_5_2e  <= sl5 && sl5 < ss_5_2s || ss_5_2e <= sl5_2 && sl5_2 < ss_5_2s) {
    sl5_side=30-170*4;
    //println("e");
  }
  else if (ss_1e  <= sl5 && sl5 < ss_1s|| ss_1e <= sl5_2 && sl5_2 < ss_1s) {
    sl5_side=30;
    //println("G");
  }
  else if (ss_2e <= sl5 && sl5 < ss_2s || ss_2e <= sl5_2 && sl5_2 < ss_2s) {
    sl5_side=30-170;
    //println("oo");
  }
  else if (ss_3e <= sl5 && sl5 < ss_3s || ss_3e <= sl5_2 && sl5_2 < ss_3s) {
    sl5_side=30-170*2;
    //println("g");
  }
  else if (ss_4e <= sl5 && sl5 < ss_4s || ss_4e <= sl5_2 && sl5_2 < ss_4s ) {
    sl5_side=30-170*3;
    //println("l");
  }
  else if (ss_5e <= sl5 && sl5 < ss_5s || ss_5e <= sl5_2 && sl5_2 < ss_5s) {
    sl5_side=30-170*4;
    //println("e");
  }
  noStroke();
  fill(245,200);
  rect(0, 0, 400, 50);
  rect(0, 180, 400, 120);
  tint(180,80);
  img = loadImage("shade.png");
  image(img, 0, 50, 400, 130);
  //ボタン
  noTint();
  img = loadImage("pl_c.png");
  image(img, 20,200,30,30);
  img = loadImage("pl_v.png");
  image(img, 100,200,30,30);
  img = loadImage("pl_b.png");
  image(img, 180,200,30,30);
  img = loadImage("pl_n.png");
  image(img, 260,200,30,30);
  img = loadImage("pl_m.png");
  image(img, 340,200,30,30);
  
  if(sp==n_sp){
  for (int i =0; i<=400; i+=50){
    fill(0,121,194);
    ellipse(i,40,5,5);
  }
  for (int i =25; i<=400; i+=50){
    fill(255,196,35);
    ellipse(i,40,5,5);
  }
  for (int i =0; i<=400; i+=50){
    fill(0,121,194);
    ellipse(i,190,5,5);
  }
  for (int i =25; i<=400; i+=50){
    fill(255,196,35);
    ellipse(i,190,5,5);
  }
  }else{
   for (int i =0; i<=400; i+=50){
    fill(237,23,79);
    ellipse(i,40,5,5);
  }
  for (int i =25; i<=400; i+=50){
    fill(255,196,35);
    ellipse(i,40,5,5);
  }
  for (int i =0; i<=400; i+=50){
    fill(237,23,79);
    ellipse(i,190,5,5);
  }
  for (int i =25; i<=400; i+=50){
    fill(255,196,35);
    ellipse(i,190,5,5);
  }
  }
  //下部アナウンス
  if(sw==1){
  img = loadImage("uno_2.png");
  image(img, 0,250);
  }else if (sw==0){
  img = loadImage("uno_1.png");
  image(img, 0,245);
  }else if (sw==3){
  img = loadImage("uno_3.png");
  image(img, 0,245);
  }
    
  
  /*
  if (sl1==30 && sl2==30-170 && sl3==30-170*2 && sl4==30-170*3 && sl5== 30-170*4 && c_r1==2) {
   img = loadImage("a_clear.png");
   image(img, 25, 170);
    //println("e");
  }
  
///-------スタート画面--------///
  /*if (c_st==1 && img_alf_str >= 0){
  img_alf_str=0;
  }
  noStroke();
  tint(255,img_alf_str);
  img = loadImage("start.png");
  image(img, 0, 30, 400, 300);
  println(img_alf_str);*/
  /*if(c_st==1){
  sl1=sl1+sl1_sp;
  sl1_2=sl1_2+sl1_sp;
  } else if (c_st==1 && sl1>=20){
  sl2=sl2+sl2_sp;
  sl2_2=sl2_2+sl2_sp;
  }*/

 
}
//------STOP-------//

//クリック用

void mousePressed(){
  if(320 < mouseX && mouseX <=400 && sw==1  && c_r5==1 ){
   sl5=sl5_side;  
   sl5_2=sl5_side-850;  
   sl5_sp=0;
   c_r5=2;
  }
  if(240 <mouseX && mouseX<= 320 &&sw==1 && c_r4==1){
   sl4=sl4_side;  
   sl4_2=sl4_side-850;  
   sl4_sp=0;
   c_r4=2;
   //sub_sw=5;
  }
  if(160<mouseX&& mouseX<= 240 && sw==1  && c_r3==1){
   sl3=sl3_side;
   sl3_2=sl3_side-850; 
   sl3_sp=0;
   c_r3=2;   
   //sub_sw=4;
  }
  if(80<mouseX&& mouseX<=160 && sw==1 && c_r2==1){
   sl2=sl2_side;
   sl2_2=sl2_side-850;
   sl2_sp=0;
   c_r2=2;  
   //sub_sw=3;
  }
  if(0<=mouseX && mouseX <=80 && sw==1 && c_r1==1){
   sl1=sl1_side;
   sl1_2=sl1_side-850;
   sl1_sp=0;
   c_r1=2;
   //sub_sw=2;
  }
 if(sw==0){
    sw=1;
    c_r1 = c_r2 =c_r3 = c_r4 = c_r5 =1;
  }
 if(sw==3){
    float rand = random(30);
     if (5<rand && rand<10) {
     sp=c_sp;
     println("CHANCE");
     }
     else {
     sp=n_sp;
     }
     c_r1 = c_r2 =c_r3 = c_r4 = c_r5 =1;
     
     println(sp,rand);
     sl1_sp=sp;
     sl2_sp=sp;
     sl3_sp=sp;
     sl4_sp=sp;
     sl5_sp=sp;
    sw=1;  
  }
 if(c_r1 ==2 && c_r2 ==2 &&c_r3 ==2 && c_r4 ==2 && c_r5 ==2){
  /**/
  sw=3;
 }
 
}

//キーボード用

void keyPressed() {
  
  if(sw==0){ 
  sw=1;
  }
  
  switch(key) {
  case 'c':
    sl1=sl1_side;
    sl1_2=sl1_side-850;
    sl1_sp=0;
    c_r1=2;
    break;
  case 'v':
     sl2=sl2_side;
     sl2_2=sl2_side-850;
     sl2_sp=0;
     c_r2=2;    
     break;
  case 'b':
     sl3=sl3_side;
     sl3_2=sl3_side-850; 
     sl3_sp=0;
     c_r3=2;   
     break;
  case 'n':
     sl4=sl4_side;  
     sl4_2=sl4_side-850;  
     sl4_sp=0;
     c_r4=2;
     break;
  case 'm':
     sl5=sl5_side; 
     sl5_2=sl5_side-850;
     sl5_sp=0;
     c_r5=2;   
     break;
  case ',':
     float rand = random(30);
     if (5<rand && rand<10) {
     sp=c_sp;
     println("CHANCE");
     }
     else {
     sp=n_sp;
     }
     c_r1 = c_r2 =c_r3 = c_r4 = c_r5 =1;
     
     println(sp,rand);
     sl1_sp=sp;
     sl2_sp=sp;
     sl3_sp=sp;
     sl4_sp=sp;
     sl5_sp=sp;   
     
     break;
  
   case 'd':
    sl1=30;
    sl1_2=30-850;
    sl1_sp=0;
    c_r1=2;
    break;
  case 'f':
     sl2=30-170*1;
     sl2_2=30-170*1-850;
     sl2_sp=0;  
     c_r2=2;  
     break;
  case 'g':
     sl3=30-170*2;
     sl3_2=30-170*2-850; 
     sl3_sp=0;
     c_r3=2;   
     break;
  case 'h':
     sl4=30-170*3;  
     sl4_2=30-170*3-850;  
     sl4_sp=0;
     c_r4=2;
     break;
  case 'j':
     sl5=30-170*4; 
     sl5_2=30-170*4-850;
     sl5_sp=0;
     c_r5=2;   
     break;
  case 'k':
     sp=c_sp;
     println("CHANCE");
     
     sl1_sp=sp;
     sl2_sp=sp;
     sl3_sp=sp;
     sl4_sp=sp;
     sl5_sp=sp;   
     
     break;
  }
  
  //当たり演出
  
  
  if (key == CODED) {
    if ( key == ' ' ) {
    }
  }
}


