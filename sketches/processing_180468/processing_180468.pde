
int ballsize = 20;
float g = 0.35;
float f_vx = 3.5;
float f_vy = -4;

float x = 0;
float y = 0;
float vx = f_vx;
float vx2 = -f_vx;
float vy = f_vy;

int flag,timer,count,m,n;

PImage[] img;

PFont word,word2;

void setup(){
  size(400,400);
  smooth();
  flag = 4;
  count = 0;
  noStroke();
  frameRate(30);
  img = new PImage[11];
  img[0]=loadImage("001.png");
  img[1]=loadImage("002.png");
  img[2]=loadImage("003.png");
  img[3]=loadImage("004.png");
  img[4]=loadImage("005.png");
  img[5]=loadImage("006.png");
  img[6]=loadImage("007.png");
  img[7]=loadImage("000.png");
  img[8]=loadImage("008.png");
  img[9]=loadImage("009.png");
  img[10]=loadImage("010.png");
  
  word = loadFont("HoboStd-48.vlw");  //google
  word2 = createFont("HGPGothicE",30);  //かゆうま

}

void draw(){     //アニメ設定
 if(flag == 1){  //左側
   anime();
 } 
 if(flag == 2){  //右側
   anime2();
 }
 if(flag == 3){  //ラスト
   timer++;
   anime3();
     if(timer>4.5*30){
       font1();
    }
     if(timer>5*30){
       font2();
     }
 } 
 if(flag == 4){
   image(img[7],0,0);
 }
}

void mouseClicked(){ //マウスクリックでイベント
  x = 0;
  y = 0;
  vy = 0;
  count = count + 1;
  println(count);
    if(count == 1){
      flag = 2;
      fill(255,0,0);
      x = 350;
      y = 50;
    }
    if(count == 2){
      flag = 1;
      fill(0,255,0);
      x = 100;
      y = 100;
    }
    if(count == 3){
      flag = 1;
      fill(255,255,0);
      x = 50;
      y = 150;
    }
    if(count == 4){
      flag = 2;
      fill(0,0,255);
      x = 300;
      y = 150;
    }
    if(count == 5){
      flag = 1;
      fill(0,0,255);
      x = 100;
      y = 150;
    }
    if(count == 6){
      flag = 2;
      fill(0,0,255);
      x = 300;
      y = 150;
    }
    if(count == 7){
      flag = 3;
      fill(255);
      x = 100;
      y = 200;
    }
    if (count >7){
      flag = 4;
      println("count = 0");
      count = 0;
      timer = 0;
    }
}

void anime(){  //左側から 2,3,5
  background(0);
  image(img[7],0,0);
  x += vx;
  y += vy;
  vy += g;
 // ellipse(x,y,ballsize,ballsize);
   if(count == 2){
     image(img[1],x,y);
   }
   if(count == 3){
     image(img[9],0,0);
     image(img[2],x,y);
   }   
   if(count == 5){
     image(img[10],0,0);
     image(img[4],x,y);
   }
}

void anime2(){   //右側から 1,4,6
  background(0);
  image(img[7],0,0);
  x += vx2;
  y += vy;
  vy += g;
//  ellipse(x,y,ballsize,ballsize);
   if(count == 1){
     image(img[0],x,y);
   }
   if(count == 4){
     image(img[9],0,0);
     image(img[3],x,y);
   }
   if(count == 6){
     image(img[10],0,0);
     image(img[5],x,y);
   }
}

void anime3(){   //ラスト
  image(img[10],0,0);
  x += vx;
  y += vy;
  vy += g;
//  ellipse(x,y,ballsize,ballsize);
  image(img[6],x,y);

  m=225;
  n=225;
  int e,f;
  e = 20;
  f = 20;
    if(timer>1*30){
      image(img[8],0,0);
    }
    if(timer>2*30){
      m= 275;
      n= 200;
      e= 30;
      f= 30;
    }
    if(timer>3*30){
      m= 300;
      n= 150;
      e= 40;
      f= 40;
    }
    if(timer>4*30){
      m= 275;
      n= 75;
      e= 250;
      f= 150;
    }

  fill(255);
  ellipse(m,n,e,f);
}

void font1(){  //フォント google
  textFont(word,58);
  fill(0,255,21);
  text("G",185,75);
  fill(255,146,40);
  text("oo",230,75);
  fill(255,104,228);
  text("gl",295,75);
  fill(0,255,21);
  text("e",345,75);
}

void font2(){  //フォント　文字
  textFont(word2,15);
  fill(255,200,0);
  text("1月7日は七草粥の日",210,100);
  fill(50,255,200);
  text("か ゆ う ま …",240,125);
}


