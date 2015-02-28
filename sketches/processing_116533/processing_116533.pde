
int thing=0;
float frogX=200;
float frogY=520;
float frog=0;
float S=00000.4;
float c1X=000; 
float c2X=200;
float c3X=300;
float c4X=500; 
float c5X=500;
float c6X=400;
float c7X=300; 
float c8X=200;
float c9X=000;
float logX1=100;
float logY1=160;
float logX2=100;
float logY2=210;
float logV1=5;
float logV2=-5;
int score=0;
int hscore=0;
int heart=3;
int carV=5;
int counter=0;
int counterV=0;
PFont myfont=createFont("verdana", 12);


void setup() {
  size(500, 650);
  frameRate(30);
}
void draw() {
  background(#009801);
counter=counter+counterV;
 // println(frogX);
// println(frogY);
  //border
  if(frogX<20){
    frogX=20;
  }
  if(frogX>440){
    frogX=440;
  }
  if(frogY>520){
    frogY=520;
  }
  //wining sate
  if (frogY<101) {
    score=score+1;
    frogY=520;
    frogX=225;
  }
  //println(frogY);
  //street
  fill(#000000);
  rect(0, 330, 500, 170);
  //println(mouseY);
  stroke(#FFFFFF);
  line(0,390,500,390);
  line(0,445,500,445);
  stroke(0);
  //water
  fill(#0000FF);
  rect(0, 150, 500, 110);

  //tree
  tree(40, 70, 1);
  //cars
  //println(mouseY);
  truck(c1X, 340, #FF00FF, 1);
  car1(c2X, 360, #0000FF, 1);
  car2(c3X, 470, #808000, 1);
  truck(c4X, 450, #FFFF00, 1);
  car1(c5X, 410, #800000, -1);
  car2(c6X, 360, #FF0000, 1);
  truck(c7X, 390, #FF0000, -1);
  car1(c8X, 470, #00FF00, 1);
  car2(c9X, 410, #FFAB03, -1);
  //car motion
  c1X=c1X-5-score;
  c2X=c2X-5-score;
  c3X=c3X-5-score;

  c4X=c4X-5-score;
  c5X=c5X+carV+score;
  c6X=c6X-5-score;

  c7X=c7X+carV+score;
  c8X=c8X-5-score;
  c9X=c9X+carV+score;

  //stop and go motion
  if (((int)random(100))==0) {
    if (carV == 5) {
      carV = 0;
    }
    else if (carV == 0) {
      carV = 5;
    }
  }

  if (c1X < -200) {
    c1X = 700;
  }
  if (c3X<-200) {
    c3X=700;
  }
  if (c2X<-200) {
    c2X=700;
  }
  if (c4X <-200) {
    c4X =700;
  }
  if (c6X <-200) {
    c6X=700;
  }
  if (c8X<-200) {
    c8X=700;
  }
  if (c5X>800) {
    c5X=-200;
  }
  if (c7X>800) {
    c7X=-200;
  }
  if (c9X>800) {
    c9X=-200;
  }
  log1(logX1, logY1);
  log1(logX2, logY2);
  //log movement
  logX1=logX1+logV1;
  logX2=logX2+logV2;
  //log wrap
  if (logX1>700) {
    logX1=-200;
    logV1=3+(int)random(10)+score;
  }
  if (logX2<-200) {
    logX2=700;
    logV2=-1*(3+(int)random(10))-score;
  }
  //log collision
  if (frogX+50 > logX1 && frogX < logX1 + 100 && frogY + 40 > logY1 && frogY < logY1 + 40) {
    frogX=logX1+35;
  }

  if (frogX+50>logX2&&frogX<logX2+100&&frogY+40>logY2&&frogY<logY2+40) {
    frogX=logX2+35;
  }


  //water collision
  if (frogX+50>0&&frogX<0+500&&frogY+60>150&&frogY<150+110) {
    //log collision
    if (frogX+50>logX1&&frogX<logX1+100&&frogY+40>logY1&&frogY<logY1+40||frogX+50>logX2&&frogX<logX2+100&&frogY+40>logY2&&frogY<logY2+40||frogY<140) {
    } 
    else {
      ouch();
    }
}

  frogger();
    if(frog>4){
  fill(random(256));
  ellipse(frogX+25,frogY+25,50,50);
}
if(frog>100){
  frogX=200;
  frogY=520;
  frog=0;
}
  textFont(myfont, 20);
  fill(0);
  text("SCORE:"+score, 20, 600);
  if (score>hscore) {
    hscore=score;
  }
  text("BEST:"+hscore, 20, 630);

  //hearts
  for (int i=0;i<heart;i++) {
    noStroke();
    fill(#FF0000);
    ellipse(400+i*20, 600, 10, 10);
    ellipse(410+i*20, 600, 10, 10);
    triangle(395+i*20, 600, 415+i*20, 600, 405+i*20, 620);
    stroke(0);
  }
  if (heart<1) {
    heart=3;
    score=0;
    counterV=1;

  }

if(counter>1){
  fill(0);
  rect(0,0,1000,1000);
  fill(#FFFFFF);
    textFont(myfont,50);
    text("TRY AGAIN",125,300);
}
if(counter>100){
  counterV=0;
  counter=0;
}
}
void ouch() {
  if(frog<4){
  heart=heart-1;
  }
  frog=frog+5;
}

void log1(float X, float Y) {
  fill(#8B4513);
  rect(X, Y, 100, 40);
}
void car2(float X, float Y, color C, float F) {

  noStroke();
  fill(C);
  rect(X, Y, 90*F, 20);
  fill(#959595);
  triangle(X, Y, X+90*F, Y-20, X+90*F, Y);
  stroke(#FFFFFF);
  fill(#000000);
  ellipse(X+10*F, Y+20, 15, 15);
  ellipse(X+80*F, Y+20, 15, 15);
  stroke(0);
  // collision
  if (F==1) {
    if (frogX+50*S>X&&frogX<X+90&&frogY+60*S>Y&&frogY<Y+20) {
      ouch();
    }
  }
  if (F==-1) {
    if (frogX+50*S>X-90&&frogX<X&&frogY+60*S>Y&&frogY<Y+20) {
      ouch();
    }
  }
}
void car1(float X, float Y, color C, float F) {
  noStroke();

  fill(C);
  ellipse(X+45*F, Y, 40, 40);
  fill(#FFFFFF);
  ellipse(X+45*F, Y-5, 25, 20);
  fill(C);
  rect(X, Y, 65*F, 20);

  stroke(#FFFFFF);
  fill(#000000);
  ellipse(X+10*F, Y+20, 15, 15);
  ellipse(X+55*F, Y+20, 15, 15);
  stroke(0);
  //collision
  if (F==1) {
    if (frogX+50*S>X&&frogX<X+65&&frogY+60*S>Y&&frogY<Y+20) {
      ouch();
    }
  }
  if (F==-1) {
    if (frogX+50*S>X-65&&frogX<X&&frogY+60*S>Y&&frogY<Y+20) {
      ouch();
    }
  }
}

void truck(float X, float Y, color C, float F) {
  noStroke();
  fill(C);
  rect(X-20*F, Y+20, 20*F, 20);
  rect(X, Y, 130*F, 40);
  fill(#FFFFFF);
  for (int i=0;i<6;i++) {
    rect(X+5*F+i*20*F, Y+5, 15*F, 15);
  }
  stroke(#FFFFFF);
  fill(0);
  ellipse(X+20*F, Y+40, 20, 20);
  ellipse(X+100*F, Y+40, 20, 20);
  stroke(0);
  //collsion
  if (F==1) {
    if (frogX+50*S>X&&frogX<X+130&&frogY+60*S>Y&&frogY<Y+40) {
      ouch();
    }
  }
  if (F==-1) {
    if (frogX+50*S>X-130&&frogX<X&&frogY+60*S>Y&&frogY<Y+40) {
      ouch();
    }
  }
}
void tree(float X, float Y, float S) {
  for (int i=0;i<9;i++) {
    fill(#87421F);
    rect(X+i*50, Y, 30*S, 30*S);
    fill(#00FF00);
    triangle(X+15*S+i*50, Y-80*S, X-5*S+i*50, Y, X+35*S+i*50, Y);
  }
}

void keyPressed() {
 if(frog<4){
  if (keyCode==UP) {
    frog=0;
    frogY=frogY-60;
  }
  if (keyCode==DOWN) {
    frog=1;
    frogY=frogY+60;
  }
  if (keyCode==LEFT) {
    frog=2;
    frogX=frogX-60;
  }
  if (keyCode==RIGHT) {
    frog=3;
    frogX=frogX+60;
  }
 }
}


void frogger() {
  if (frog==0) {
    noStroke();
    //arms
    fill(#00FF00);
    ellipse(frogX-2*S, frogY+20*S, 30*S, 7*S);
    ellipse(frogX-14*S, frogY+5*S, 7*S, 30*S);

    ellipse(frogX+52*S, frogY+20*S, 30*S, 7*S);
    ellipse(frogX+64*S, frogY+5*S, 7*S, 30*S);

    ellipse(frogX-2*S, frogY+50*S, 30*S, 7*S);
    ellipse(frogX-14*S, frogY+65*S, 7*S, 30*S);

    ellipse(frogX+52*S, frogY+50*S, 30*S, 7*S);
    ellipse(frogX+64*S, frogY+65*S, 7*S, 30*S);

    fill(#00FF00);
    rect(frogX, frogY, 50*S, 60*S);
    fill(#FFFF00);
    ellipse(frogX+25*S, frogY+30*S, 45*S, 55*S);
    fill(#EB1DF0);
    ellipse(frogX+7*S, frogY+7*S, 12*S, 12*S);
    ellipse(frogX+43*S, frogY+7*S, 12*S, 12*S);
  }
  if (frog==1) {
    noStroke();
    //arms
    fill(#00FF00);
    ellipse(frogX-2*S, frogY+20*S, 30*S, 7*S);
    ellipse(frogX-14*S, frogY+5*S, 7*S, 30*S);

    ellipse(frogX+52*S, frogY+20*S, 30*S, 7*S);
    ellipse(frogX+64*S, frogY+5*S, 7*S, 30*S);

    ellipse(frogX-2*S, frogY+50*S, 30*S, 7*S);
    ellipse(frogX-14*S, frogY+65*S, 7*S, 30*S);

    ellipse(frogX+52*S, frogY+50*S, 30*S, 7*S);
    ellipse(frogX+64*S, frogY+65*S, 7*S, 30*S);

    fill(#00FF00);
    rect(frogX, frogY, 50*S, 60*S);
    fill(#FFFF00);
    ellipse(frogX+25*S, frogY+30*S, 45*S, 55*S);
    fill(#EB1DF0);
    ellipse(frogX+7*S, frogY+51*S, 12*S, 12*S);
    ellipse(frogX+43*S, frogY+51*S, 12*S, 12*S);
  }
  if (frog==2) {
    noStroke();
    //arms
    fill(#00FF00);
    ellipse(frogX+10*S, frogY+5*S, 7*S, 30*S);
    ellipse(frogX-2*S, frogY-10*S, 30*S, 7*S);

    ellipse(frogX+40*S, frogY+5*S, 7*S, 30*S);
    ellipse(frogX+52*S, frogY+-10*S, 30*S, 7*S);

    ellipse(frogX+10*S, frogY+60*S, 7*S, 30*S);
    ellipse(frogX-2*S, frogY+75*S, 30*S, 7*S);

    ellipse(frogX+40*S, frogY+60*S, 7*S, 30*S);
    ellipse(frogX+52*S, frogY+75*S, 30*S, 7*S);

    fill(#00FF00);
    rect(frogX, frogY, 50*S, 60*S);
    fill(#FFFF00);
    ellipse(frogX+25*S, frogY+30*S, 55*S, 45*S);
    fill(#EB1DF0);
    ellipse(frogX+10*S, frogY+10*S, 12*S, 12*S);
    ellipse(frogX+10*S, frogY+48*S, 12*S, 12*S);
  }
  if (frog==3) {
    noStroke();
    //arms
    fill(#00FF00);
    ellipse(frogX+10*S, frogY+5*S, 7*S, 30*S);
    ellipse(frogX-2*S, frogY-10*S, 30*S, 7*S);

    ellipse(frogX+40*S, frogY+5*S, 7*S, 30*S);
    ellipse(frogX+52*S, frogY+-10*S, 30*S, 7*S);

    ellipse(frogX+10*S, frogY+60*S, 7*S, 30*S);
    ellipse(frogX-2*S, frogY+75*S, 30*S, 7*S);

    ellipse(frogX+40*S, frogY+60*S, 7*S, 30*S);
    ellipse(frogX+52*S, frogY+75*S, 30*S, 7*S);

    fill(#00FF00);
    rect(frogX, frogY, 50*S, 60*S);
    fill(#FFFF00);
    ellipse(frogX+25*S, frogY+30*S, 55*S, 45*S);
    fill(#EB1DF0);
    ellipse(frogX+40*S, frogY+10*S, 12*S, 12*S);
    ellipse(frogX+40*S, frogY+48*S, 12*S, 12*S);
  }
}


