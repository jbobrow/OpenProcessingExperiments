
int no = 0;
int i = 110;


PImage start;
PImage osakana;
PImage hero1;
PImage touyohome;
PImage rojiura;
PImage hito1;
PImage hito2;
PImage hito3;
PImage hito4;
PImage hito5;
PImage hito6;
PImage hito7;
PImage koe1;
PImage koe2;
PImage koe3;
PImage koe4;
PImage sakana1;
PImage sakana2;
PImage sakana3;
PImage sakana4;
PImage sakana5;
PImage ensyu;


float x;
float y;
float delay = 30;
float xa;
float ya;
float xb;
float yb;
float xc;
float yc;
float xd;
float yd;
float xe;
float ye;


//BGM設定//
//import ddf.minim.*;

//Minim minim;
//AudioPlayer player;

void setup(){
size(750,350);


//BGM設定2//
  //minim = new Minim(this);
  //player = minim.loadFile("235.mp3", 2048);
  //player.play(); //再生
  
//主人公//
hero1 = loadImage("hero1.png");
start = loadImage("saisyo.png");
osakana = loadImage("osakana.jpg");
sakana1 = loadImage("sakana1.png");
sakana2 = loadImage("sakana2.png");
sakana3 = loadImage("sakana3.png");
sakana4 = loadImage("sakana4.png");
sakana5 = loadImage("sakana5.png");
//駅のホームの背景の時の画面//
touyohome = loadImage("touyohome.jpg");
hito1 = loadImage("hito1.png");//駅員と女の子 
hito2 = loadImage("hito2.png");//サラリーマンA
hito3 = loadImage("hito3.png");//OL A
hito3 = loadImage("hito3.png");//OL A
koe1 = loadImage("koe1.png");//吹き出し1
hito4 = loadImage("hito4.png");//駅員B
hito5 = loadImage("hito5.png");//駅員C
rojiura = loadImage("rojiura.jpg");
hito6 = loadImage("hito6.png");//警官
koe2 = loadImage("koe2.png");//吹き出し2
hito7 = loadImage("hito7.png");//犯人A
koe3 = loadImage("koe3.png");//吹き出し3
koe4 = loadImage("koe4.png");//吹き出し4
ensyu = loadImage("ensyu.jpg");
x = width/2;
  y = height/2;
  frameRate(6);
}

void draw() {


  if (i < width) {
    i = -10;
  }
  
  background(255);
  
  
 xa -= width/-20;
 ya += height/10;   

 xb += 3;
 yb += 3;
 
 xc += 1;
 yc += 1; 
  
 xd += 7;
 yd += 7; 
  
 xe += 5;
 ye += 5;  
  //最初の画面//
  if(no==0){
  image(start,110,60);
  }
  //魚の背景の時の画面//
  
  if(no==1){
    image(osakana,0,-30);
  image(sakana1,xb,250);
  image(sakana2,xc,40);
  image(sakana3,xd,20);
  image(sakana4,xe,275);
  image(sakana5,xe,175);
}
  //駅のホームの背景の時の画面//
  if(no==2){
    image(touyohome,0,-30);
    image(hito1,610,220);
    image(hito2,xc,130);
    image(hito3,xb,200);
    image(hito3,xe,50);
    image(koe1,545,170);
    image(hito4,685,140);
    image(hito5,175,210);
  }
  //路地裏と猫の背景の時の画面//
  if(no==3){
    image(rojiura,0,-25);
    image(hito6,145,245);
    image(koe2,278,120);
    image(hito7,545,275);
    image(koe3,6,160); 
    image(koe4,510,100);  
  if(no==4){
  image(ensyu,0,0);
  } 
  }
//主人公のキー操作//
if(keyPressed && keyCode ==RIGHT){
  x +=3;
}
if(keyPressed && keyCode ==LEFT){
  x -=3;
}


if(keyPressed && keyCode ==UP){
  y -=4;
}
if(keyPressed && keyCode ==DOWN){
  y +=4;
}
image(hero1,x,y);

//背景チェンジのreturn(enter)キー操作//
if(keyPressed && keyCode ==RETURN){
  ;
}
}

void keyPressed(){
  //背景チェンジキー操作//
  if(keyCode == ENTER){
    no=no+1;
  }
}
//BGM設定3//
void stop() {
  //player.close();
  //minim.stop();

  super.stop();
}



