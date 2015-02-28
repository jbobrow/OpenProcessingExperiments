
import pitaru.sonia_v2_9.*;
int d=0;
float dimImg=15;
float dimImg2=91;
int y=315;
int v=1; //velocità soffio
int s=0; //spostamento
int x=80;
int time=0;
int ygatto=499;


int gameStep = 1;

boolean checkGoal = false;

PImage img,img2,img3,img4,img5,img6,img7,img8,img9,img10,img11,img12, img13, img14, img15;
float level;

void setup() {
  size (859, 499);
  Sonia.start(this);
  LiveInput.start();
  
  img=loadImage("sfondo.jpg");
  img2=loadImage("pescepiccolo.png");
  img3=loadImage("bolla.png");
  img4=loadImage("muro.png");
  img5=loadImage("gattopiccolo.png");
  img6=loadImage("pescemortopiccolo.png");
  img7=loadImage("quadro.png");
  img8=loadImage("quadro2.png");
  img9=loadImage("quadro3.png");
  img10=loadImage("boom.png");
  img11=loadImage("pescepiccolo2.png");
  img12=loadImage("mare.png");
  img13=loadImage("gattopiccolo2.png");
  img14=loadImage("gameover.png");
  img15=loadImage("youwon.png");
}

void draw() {
  
 level = int((LiveInput.getLevel())*1000);
  if (gameStep == 1) {
    image(img, 0, 0);//sfondo
    image(img7, 315, 14);//quadro
    image(img2, 56, y); //pesce
    image(img4, 598, 0);//muro
    image(img3, 164, 336, dimImg*-1, dimImg); //bolla


    //println(dimImg);
    //gonfiare la bolla


    if (dimImg < 91 && int(level) > 20) {
      dimImg = dimImg + v;
    }

    if (dimImg > 22  && int(level) < 20) {
      delay(50);
      dimImg = dimImg-v;
    }

    if (dimImg == 91) {
      gameStep = 2;
    }
  }



  if (gameStep==2) {

    if ((x + img3.width) > 598 && y+s > 175 && (y+s + img3.height) < 402) {
      checkGoal = true;
      println("yes");
    }else if((x + img3.width) > 598 && (x + img3.width) <609){
      println("no");
      checkGoal = false;
      println(x);
      gameStep=4;
      
    }
    //farla salire e fermarla
    if (y>175) {
      y=y-2;
    }
    image(img, 0, 0);
    image(img8, 315, 14);//quadro
    image(img4, 598, 0);//muro
    image(img2, 56, y);//pallina
    image(img3, 164, 24+y, dimImg*-1, dimImg);//bolla

    //spostamento automatico verso il mare
    if (x<= 735 && y==175) {
      x=x+1;
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img2, x, y);//pallina
      image(img3, x+108, 24+y, dimImg*-1, dimImg);//bolla
    }

    //spostamento verso l'alto
    if (int(level) > 20 && y==175) {
      s =s-2;
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img2, x, y+s);//pallina
      image(img3, x+108, 24+y+s, dimImg*-1, dimImg);
    }else {
      //spostamento verso il basso
      s = s+1;
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img2, x, y+s);//pallina
      image(img3, x+108, 24+y+s, dimImg*-1, dimImg);
    }
    //nuovo livello
    if (x >= 735) {
      image(img9, 315, 14);//quadro
      gameStep = 3;
    }
  }

if (gameStep == 3 ){
   image(img, 0, 0);
   image(img9, 315, 14);//quadro
   image(img4, 598, 0);//muro
   image(img2, x, y+s);//pallina
   image(img3, x+108, 24+y+s-14, dimImg*-1, dimImg);
  
   if (dimImg <= 140 && int(level) > 50) {
      dimImg = dimImg + v;
    }

   if (dimImg > 91  && int(level) < 50) {

      dimImg = dimImg-v;
    }
    println (dimImg);
    if (dimImg >= 140) {
      image(img, 0, 0);
      image(img9, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img2, x, y+s);//pesce
      image(img10, x+14, 24+y+s,91,91);//bollarotta
    }
   if (time<100){ 
     time=time+1;
      
    }else{
   
    if (y<height){    
      image(img, 0, 0);
      image(img9, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img11, x+49, y+s+28);//pesce
      image(img12, 0, 0);//mare
      
      y=y+4;  
      
      }else{
        
      image(img, 0, 0);
      image(img9, 315, 14);//quadro
      image(img4, 598, 0);
      image(img15, 0, 0);
      }
    }
      
 }
 
if (gameStep==4){
   if (dimImg2 <= 119 ) {
      dimImg2 = dimImg2 + v*3;
      
    
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img2, x, y+s);//pesce
      image(img10, x+108, 24+y+s-14, dimImg*-1, dimImg2);//bollarotta     
      image(img5, 441, ygatto);//gatto pancia
     image(img13, 441, ygatto);//gatto pancia
   
      
    }else{
      
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img10, x+28, 24+y+s,91,91);//bollarotta
      image(img6, x-63, y+s);//pesce morto
      image(img5, 441, ygatto);//gatto 
      image(img13, 441, ygatto);//gatto pancia
    }
    
      
     if (time<8){ 
      time=time+1;
    }else{ 
    if (y<height+21){    
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);//muro
      image(img5, 441, 280);//gatto
      image(img6, x-63, y+s+70);//pesce morto
      image(img13, 441, 280);//gatto pancia
      
      
      y=y+4;  
      
      }else{
        
      image(img, 0, 0);
      image(img8, 315, 14);//quadro
      image(img4, 598, 0);
      delay(100);
      image(img14, 0, 0);
      }
    }
 }
   
     
     
 
 }


