
int X=200;
int Y=200;

int GhostX1=20;
int GhostY1=20;

int GhostX2=20;
int GhostY2=380;

int GhostX3=380;
int GhostY3=380;

int GhostX4=380;
int GhostY4=20;

int GhostSize=20;

int score=0;
int time=0;

int menu=1;
int play=0;
int over=0;

PFont font;

void setup(){
  size(400,400);
  background(255);
  font=loadFont("CourierNew36.vlw");
  textAlign(CENTER);
  textFont(font,32);
}

void draw(){
  if (over==1){
    background(255);
    fill(0);
    text("Game over!",width/2,75);
    rectMode(CENTER);
    fill(255);
    rect(200,190,126,76);
    fill(0);
    text("Redo",width/2,height/2);
    text(score,width/2,height-75);
    X=200;
    Y=200;
    GhostX1=20;
    GhostY1=20;
    GhostX2=20;
    GhostY2=380;
    GhostX3=380;
    GhostY3=380;
    GhostX4=380;
    GhostY4=20;
    GhostSize=20;
    time=0;
    if (mouseX>=137&&mouseX<=263&&mouseY>=162&&mouseY<=238){
      if (mousePressed&&(mouseButton==LEFT)){
        score=0;
        menu=0;
        play=1;
        over=0;
      }
    }
  }
    
  if (menu==1){
    background(255);
    fill(0);
    text("The Blob!!",width/2,75);
    rectMode(CENTER);
    fill(255);
    rect(200,190,126,76);
    fill(0);
    text("Play",width/2,height/2);
    text("Use WASD to move",width/2,height-75);
    if (mouseX>=137&&mouseX<=263&&mouseY>=162&&mouseY<=238){
      if (mousePressed&&(mouseButton==LEFT)){
        menu=0;
        play=1;
      }
    }
  }
  
  if (play==1){
    if (GhostX1-10>=X-GhostSize&&GhostX1+10<=X+GhostSize&&GhostY1>=Y-GhostSize&&GhostY1<=Y+GhostSize){
      play=0;
      over=1;
    }
    else if (score>=10&&GhostX2-10>=X-GhostSize&&GhostX2+10<=X+GhostSize&&GhostY2>=Y-GhostSize&&GhostY2<=Y+GhostSize){
      play=0;
      over=1;
    }
    else if (score>=20&&GhostX3-10>=X-GhostSize&&GhostX3+10<=X+GhostSize&&GhostY3>=Y-GhostSize&&GhostY3<=Y+GhostSize){
      play=0;
      over=1;
    }
    else if (score>=30&&GhostX4-10>=X-GhostSize&&GhostX4+10<=X+GhostSize&&GhostY4>=Y-GhostSize&&GhostY4<=Y+GhostSize){
      play=0;
      over=1;
    }
  if (keyPressed){
    if (key=='w'||key=='W'){
      Y=Y-3;
    }
    if (key=='s'||key=='S'){
      Y=Y+3;
    }
    if (key=='a'||key=='A'){
      X=X-3;
    }
    if (key=='d'||key=='D'){
      X=X+3;
    }
  }
  
  if (X>width){
    X=0;
  }else if(X<0){
    X=width;
  }
  if (Y>height){
    Y=0;
  }else if(Y<0){
    Y=height;
  }
  
  if (GhostX1<X){
    GhostX1++;
  }else if(GhostX1>X){
    GhostX1--;
  }else if(GhostX1==X){}

  if (GhostY1<Y){
    GhostY1++;
  }else if(GhostY1>Y){
    GhostY1--;
  }else if(GhostY1==Y){}
  
  if (score>=10){
  if (GhostX2<X){
    GhostX2++;
  }else if(GhostX2>X){
    GhostX2--;
  }else if(GhostX2==X){}

  if (GhostY2<Y){
    GhostY2++;
  }else if(GhostY2>Y){
    GhostY2--;
  }else if(GhostY2==Y){}
  }
  
  if (score>=20){
  if (GhostX3<X){
    GhostX3++;
  }else if(GhostX3>X){
    GhostX3--;
  }else if(GhostX3==X){}

  if (GhostY3<Y){
    GhostY3++;
  }else if(GhostY3>Y){
    GhostY3--;
  }else if(GhostY3==Y){}
  }
  
  if (score>=30){
  if (GhostX4<X){
    GhostX4++;
  }else if(GhostX4>X){
    GhostX4--;
  }else if(GhostX4==X){}

  if (GhostY4<Y){
    GhostY4++;
  }else if(GhostY4>Y){
    GhostY4--;
  }else if(GhostY4==Y){}
  }
  
  time++;
  if (time>=50){
    time=0;
    score++;
  }
  update();
  delay(1);
  
  }
}

void update(){
  /*PImage b;
  b=loadImage("sand.jpg");
  imageMode(CENTER);
  image(b,0,0,width*2,height*2);*/
  background(255);
  fill(0);
  rectMode(CENTER);
  rect(X,Y,20,20);
  fill(255,0,0);
  rect(GhostX1,GhostY1,GhostSize,GhostSize);
  if (score>=10){
    fill(255,255,0);
    rect(GhostX2,GhostY2,GhostSize,GhostSize);
  }
  if (score>=20){
    fill(0,255,0);
    rect(GhostX3,GhostY3,GhostSize,GhostSize);
  }
  if (score>=30){
    fill(0,0,255);
    rect(GhostX4,GhostY4,GhostSize,GhostSize);
  }
  if (score==40){
      GhostSize=30;
  }
  if (score==50){
      GhostSize=40;
  }
  if (score==60){
      GhostSize=50;
  }
  if (score==70){
      GhostSize=60;
  }
  if (score==80){
      GhostSize=70;
  }
  if (score==90){
      GhostSize=80;
  }
  if (score==100){
      GhostSize=90;
  }
  if (score==110){
      GhostSize=100;
  }
  if (score==120){
      GhostSize=110;
  }
  if (score==130){
      GhostSize=120;
  }
  if (score==140){
      GhostSize=130;
  }
  if (score==140){
      GhostSize=140;
  }
  if (score==150){
      GhostSize=150;
  }
  if (score==160){
      GhostSize=160;
  }
  fill(0);
  text(score,width/2,50);
}

