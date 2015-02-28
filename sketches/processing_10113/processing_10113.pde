
import gifAnimation.*;

int card = 0;
int lastcard = 0;

Gif giftitle;
Gif giftitleloop;
Gif splash;
Gif scan;
Gif scancomp;
Gif virus;
Gif wait;
Gif timer;
Gif attack;
Gif offline;

PFont font;

PImage s02;
PImage s03;
PImage s04;
PImage s05;
PImage s06;
PImage s07;
PImage s08;
PImage s09;
PImage s10;
PImage s11;
PImage s12;
PImage s13;
PImage s14;
PImage s15;
PImage s16;
PImage s17;
PImage s18;
PImage s19;
PImage s20;
PImage s21;
PImage s22;
PImage s23;
PImage s24;
PImage s25;

PImage select;
PImage ico01;
PImage ico02;
PImage ico03;
PImage ico04;
PImage ico05;
PImage ico06;

int browsericon = 1;
int scannericon = 0;
int confickericon = 0;
int salticon = 0;
int wolficon = 0;
int mail1 = 1;
int mail2 = 1;
int mail3 = 1;
int mail4 = 1;

void setup(){
  frameRate(12);
  size(640,480);
  background(255);
  cursor(CROSS);
  rectMode(CORNER);

  
  font = loadFont("FixedsysExcelsiorIIIb-16.vlw");
  textFont(font);

  select = loadImage("selector.gif");  
  ico01 = loadImage("icon-02.jpg");
  ico02 = loadImage("icon-03.jpg");
  ico03 = loadImage("icon-04.jpg");
  ico04 = loadImage("icon-05.jpg");
  ico05 = loadImage("icon-06.jpg");
  ico06 = loadImage("icon-07.jpg");


  s02 = loadImage("s-02.gif");
  s03 = loadImage("s-03.gif");
  s04 = loadImage("s-04.gif");
  s05 = loadImage("s-05.gif");
  s06 = loadImage("s-06.gif");
  s07 = loadImage("s-07.gif");
  s08 = loadImage("s-08.gif");
  s09 = loadImage("s-09.gif");
  s10 = loadImage("s-10.gif");
  s11 = loadImage("s-11.gif");
  s12 = loadImage("s-12.gif");
  s13 = loadImage("s-13.gif");
  s14 = loadImage("s-14.gif");
  s15 = loadImage("s-15.gif");
  s16 = loadImage("s-16.gif");
  s17 = loadImage("s-17.gif");
  s18 = loadImage("s-18.gif");
  s19 = loadImage("s-19.gif");
  s20 = loadImage("s-20.gif");
  s21 = loadImage("s-21.gif");
  s22 = loadImage("s-22.gif");
  s23 = loadImage("s-23.gif");
  s24 = loadImage("s-24.gif");
  s25 = loadImage("s-25.gif");
  
  attack = new Gif(this, "attack.gif");
  giftitle = new Gif(this, "titlescreen.gif");
  giftitleloop = new Gif(this, "titlescreenloop.gif");
  splash =  new Gif(this, "splash.gif");
  virus = new Gif(this, "virus.gif");
  scan = new Gif(this, "scannerwithash.gif");
  scancomp = new Gif(this, "scannercomplete.gif");
  wait = new Gif(this, "attackwaiting.gif");
  timer = new Gif(this, "timer.gif");
  offline = new Gif(this, "offline.gif");
  
  

  attack.play();
  attack.ignoreRepeat();
  giftitle.play();
  giftitle.ignoreRepeat();
  virus.play();
  virus.ignoreRepeat();
  scancomp.play();
  scancomp.ignoreRepeat();
  scan.play();
  scan.ignoreRepeat();
  offline.play();
  offline.ignoreRepeat();
  splash.play();
  splash.ignoreRepeat();
  timer.play();
  timer.ignoreRepeat();
  wait.play();
  wait.ignoreRepeat();
  
  
}

void draw(){
  background(0); 
  switch(card) {
  case 0: card0();
    break;
  case 1: card1();
    break;
  case 2: card2();
    break;
  case 3: card3();
    break;
  case 4: card4();
    break;
  case 5: card5();
    break;
  case 6: card6();
    break;
  case 7: card7();
    break;
  case 8: card8();
    break;
  case 9: card9();
    break;
  case 10: card10();
    break;
  case 11: card11();
    break;
  case 12: card12();
    break;
  case 13: card13();
    break;
  case 14: card14();
    break;
  case 15: card15();
    break;
  case 16: card16();
    break;
  case 17: card17();
    break;
  case 18: card18();
    break;
  case 19: card19();
    break;
  case 20: card20();
    break;
  case 21: card21();
    break;
  case 22: card22();
    break;
  case 23: card23();
    break;
  case 24: card24();
    break;
  case 25: card25();
    break;
  case 99: card99();
    break;
  case 100: virus();
    break;
  case 101: scanimation();
    break;
  case 102: attack();
    break;
  }

if (card == 0 || card == 14 || card == 100 || card == 17){
} else {
  tool();
}


}

void card99(){
  
}

void virus(){
  virus.play();
  virus.ignoreRepeat();
  image(virus, 0, 0);
 if(virus.currentFrame()==25){
    if (keyPressed == true) {
    setup();
    }
  }
}

void scanimation(){
  scancomp.play();
  scancomp.ignoreRepeat();
  image(scancomp, 0, 0);
 if(scancomp.currentFrame()== 39){
    card = 22;
    }
}

void attack(){
  attack.play();
  attack.ignoreRepeat();
  image(attack, 0, 0);
  
  timer.play();
  timer.ignoreRepeat();
  image(timer, 0, 0);
  
 if(timer.currentFrame()== 60){
   card = 17;
   cursor(CROSS);
 }
}
  
void tool(){
  
fill(#FF0000);
noStroke();
rect(0,0,640,48);

  icons();
  clock();
  select();
  
}



void clock(){
int s = second();
int m = minute();
int h = hour();
String t = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
fill(0);
text(t, 10, 20);
}


void icons(){
  if(browsericon == 1){
  image(ico01, 100, 0);
}  if(scannericon == 1){
  image(ico02, 150, 0);
}  if(confickericon == 1){
  image(ico03, 200, 0);
}  if(salticon == 1){
  image(ico04, 250, 0);
}  if(wolficon == 1){
  image(ico05, 300, 0);
}  if(mail1 == 1){
  image(ico06, 350, 0);  
}  if(mail2 == 1){
  image(ico06, 400, 0);  
}  if(mail3 == 1){
  image(ico06, 450, 0);  
}  if(mail4 == 1){
  image(ico06, 500, 0);
}
}

void select(){
    if(mouseX > 100 && mouseX < 132 && mouseY > 0 && mouseY < 32 && browsericon == 1) {
  image(select, 100, 0);
  text("Browser", mouseX, 45);
    if (mousePressed == true) {
      card = 6;
    }
  
  } else
  if(mouseX > 150 && mouseX < 182 && mouseY > 0 && mouseY < 32 && scannericon == 1) {
  image(select, 150, 0);    
  text("Scanner", mouseX, 45);
      if (mousePressed == true && (card == 7 || card == 19)) {
      card = 19;
    } else if(mousePressed == true && card == 24) {
      card = 24;
    }else if(mousePressed == true && (card != 7 || card != 19 || card != 24)) {
      lastcard = card;
      card = 24;
    }
  } else
  if(mouseX > 200 && mouseX < 232 && mouseY > 0 && mouseY < 32 && confickericon == 1) {
  image(select, 200, 0);
  text("Conficker", mouseX, 45);
      if (mousePressed == true && (card == 22 || card == 16)) {
      card = 16;
    } else if(mousePressed == true && card == 25) {
      card = 25;
    }else if(mousePressed == true && (card != 22 || card != 16 || card != 25)) {
      lastcard = card;
      card = 25;
    }
  } else
  if(mouseX > 250 && mouseX < 282 && mouseY > 0 && mouseY < 32 && salticon == 1) {
  image(select, 250, 0);
  text("Salt Hash", mouseX, 45);
      if (mousePressed == true && card == 40) {
      card = 2;
    } else if(mousePressed == true && card != 40) {
      lastcard = card;
      card = 55;
    }
  } else
  if(mouseX > 300 && mouseX < 332 && mouseY > 0 && mouseY < 32 && wolficon == 1) {
  image(select, 300, 0);
  text("BigBad IP HOST", mouseX, 45);
      if (mousePressed == true) {
      card = 22;
    }
  } else
  if(mouseX > 350 && mouseX < 382 && mouseY > 0 && mouseY < 32 && mail1 == 1) {
  image(select, 350, 0);
  text("New Message", mouseX, 45);
        if (mousePressed == true) {
      card = 2;
    }
  } else
  if(mouseX > 400 && mouseX < 432 && mouseY > 0 && mouseY < 32 && mail2 == 1) {
  image(select, 400, 0);
  text("New Message", mouseX, 45);
        if (mousePressed == true) {
      card = 3;
    }
  } else
  if(mouseX > 450 && mouseX < 482 && mouseY > 0 && mouseY < 32 && mail3 == 1) {
  image(select, 450, 0);
  text("New Message", mouseX, 45);
        if (mousePressed == true) {
      card = 4;
    }
  } else
  if(mouseX > 500 && mouseX < 532 && mouseY > 0 && mouseY < 32 && mail4 == 1) {
  image(select, 500, 0);
  text("New Message", mouseX, 45);
      if (mousePressed == true) {
      card = 5;
    }
  
  }
}

void card0(){

  image(giftitle, 0, 0);
    if(giftitle.isPlaying() != true){
      giftitleloop.loop();
      image(giftitleloop, 0, 0);
    if (keyPressed == true) {
    card = 1;
    }
    }
}

void card1(){
  cursor(WAIT);
  splash.play();
  image(splash, 0, 0);
    if(splash.currentFrame()==57){
    cursor(CROSS);
    card=23;
    }
}

void card2(){
  image(s02, 0, 0);
  if (mouseX > 289.667 && mouseX < 503 && mouseY > 361 && mouseY < 383) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(289.667, 361.667, 213.333, 18.667);
        if(mousePressed == true){
      card = 99;
      mail1=0;
      scannericon=1;
    }
  }
if (mouseX > 491 && mouseX < 513.667  && mouseY > 75  && mouseY < 89.667 ) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(491, 75, 25.333 , 17.333);
        if(mousePressed == true){
      card = 99;
    }
  }
}

void card3(){
  image(s03, 0, 0);
  if (mouseX > 583 && mouseX < 604.333 && mouseY > 75  && mouseY < 90.333 ) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(583, 75, 21.333, 13.333);
        if(mousePressed == true){
      card = 99;
      mail2=0;
    }
  }
}

void card4(){
  image(s04, 0, 0);
  if (mouseX > 585 && mouseX < 605  && mouseY > 65 && mouseY < 80) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(585 , 65 , 20 , 20);
        if(mousePressed == true){
      card = 99;
      mail3=0;
    }
  }
if (mouseX > 370 && mouseX < 590  && mouseY > 430   && mouseY < 450 ) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(370, 430, 220, 20);
        if(mousePressed == true){
      card = 100;
    }
  }
}

void card5(){
  image(s05, 0, 0);
  if (mouseX > 375 && mouseX < 395  && mouseY > 65  && mouseY < 80 ) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(375 , 65, 20, 20);
        if(mousePressed == true){
      card = 99;
      mail4=0;
    }
  }
}

void card6(){
  image(s06, 0, 0);
  if(mouseX > 215 && mouseX < 495  && mouseY > 335 && mouseY < 340) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(215, 335, 280, 10);
        if(mousePressed == true){
      card = 8;
    }
  }
  
  if(mouseX > 215 && mouseX < 495  && mouseY > 360 && mouseY < 380) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(215, 360, 280, 20);
        if(mousePressed == true){
      card = 7;
    }
  }
  
  if(mouseX > 215 && mouseX < 460 && mouseY > 390 && mouseY < 405) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(215, 385, 250, 15);
        if(mousePressed == true){
      card = 13;
    }
  }
}

void card7(){
  image(s07, 0, 0);
  if (mouseX > 563 && mouseX < 583 && mouseY > 95 && mouseY < 110 ) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(563, 95, 18, 15);
      if(mousePressed == true){
      card = 99;
    }
  }
}

void card8(){
  image(s08, 0, 0);
  if (mouseX > 184 && mouseX < 500  && mouseY > 316  && mouseY < 326) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 316, 316, 10);
      if(mousePressed == true){
      card = 10;
    }
  }
  if (mouseX > 184 && mouseX < 500  && mouseY > 344  && mouseY < 354) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 344, 316, 10);
      if(mousePressed == true){
      card = 14;
    }
  }
  
  if (mouseX > 184 && mouseX < 500  && mouseY > 364 && mouseY < 374 ) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 364, 316, 10);
      if(mousePressed == true){
      card = 9;
    }
  }
}

void card9(){
  image(s09, 0, 8);
  if (mouseX > 184 && mouseX < 536  && mouseY > 320 && mouseY < 336 ) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 320, 352, 16);
      if(mousePressed == true){
      card = 11;
    }
    
  }
}

void card10(){
  image(s10, 0, 8);
  if (mouseX > 184 && mouseX < 472  && mouseY > 328 && mouseY < 338 ) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 328, 316, 10);
      if(mousePressed == true){
      card = 12;
    }
  }
}

void card11(){
  image(s11, 0, -12);
  if (mouseX > 188 && mouseX < 460  && mouseY > 296 && mouseY < 312 ) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(188, 296, 276, 16);
      if(mousePressed == true){
      card = 15;
    }
    
  }
}

void card12(){
  image(s12, 0, 12);
  if (mouseX > 188 && mouseX < 240 && mouseY > 340 && mouseY < 356) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(188, 340, 52, 16);
      if(mousePressed == true){
      card = 99;
      confickericon = 1;
    }
  }
  if (mouseX > 188  && mouseX < 240 && mouseY > 388   && mouseY < 404) {
    noFill();
    strokeWeight(3);
    stroke(#00E50B);
    rect(184, 388 , 316, 20);
      if(mousePressed == true){
      card = 10;
    }
  }
}

void card13(){
  image(s13, 0, 0);
  if (mouseX > 563 && mouseX < 583 && mouseY > 95 && mouseY < 110 ) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(563, 95, 18, 15);
      if(mousePressed == true){
      card = 99;
    }
  }
    
}

void card14(){
  image(s14, 0, 0);
}

void card15(){
  image(s15, 0, 0);
  if (mouseX > 136  && mouseX < 398  && mouseY > 372 && mouseY < 402 ) {
    noFill();
    strokeWeight(3);
    stroke(#EE383A);
    rect(136, 372, 270.334, 38);
      if(mousePressed == true){
      card = 99;
      salticon=1;
    }
    
  }
}

void card16(){
  wait.play();
  image(wait, 0, 0);
  if(mouseX > 124  && mouseX < 252  && mouseY > 164  && mouseY < 184 ) {
    noFill();
    strokeWeight(3);
    stroke(#000000);
    rect(124, 164, 96.333, 22.333);
      if(mousePressed == true){
    card = 102;
    cursor(WAIT);
      }
  }
}

void card17(){
  offline.play();
  image(offline, 0, 0);
}

void card18(){
  image(s18, 0, 0);
  if (mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400) {
    card = 19;
  }
}

void card19(){
  image(s19, 0, 0);
  if (mouseX > 96 && mouseX < 192 && mouseY > 180 && mouseY < 200) {
    noFill();
    strokeWeight(3);
    stroke(#000000);
    rect(96, 180, 96, 20);
      if(mousePressed == true){
    card = 21;
    scan.stop();
  }
  }
}

void card20(){
  image(s20, 0, 0);
  if (mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400) {
    card = 20;
  }
}

void card21(){
  image(scan, 0, 0);
  scan.play();
  scan.ignoreRepeat();
  if (salticon != 1) {
    fill(0);
    stroke(0);
    rect(300, 412, 240, 32);
  }
    if(mouseX > 300 && mouseX < 540 && mouseY > 412 && mouseY < 444 && salticon == 1) {
    noFill();
    strokeWeight(3);
    stroke(#FFFFFF);
    rect(300, 412, 240, 32);
        if(mousePressed == true){
          card = 101;
        }
  }
}

void card22(){
  image(s22, 0, 0);
    if(mouseX > 300 && mouseX < 540 && mouseY > 412 && mouseY < 444) {
    noFill();
    strokeWeight(3);
    stroke(#FFFFFF);
    rect(300, 412, 176, 32);
        if(mousePressed == true){
          card = 99;
          wolficon = 1;
        }
  }
}

void card23(){
  image(s23, 0, 0);
  if (mouseX > 502.333 && mouseX < 591.667 && mouseY > 300.334 && mouseY < 343) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(493, 300, 98, 42);
        if(mousePressed == true){
      card = 99;
    }
  }
}

void card24(){
  image(s24, 0, 0);
  if (mouseX > 502.333 && mouseX < 591.667 && mouseY > 300.334 && mouseY < 343) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(493, 300, 98, 42);
        if(mousePressed == true){
      card = lastcard;
    }
  }
}

void card25(){
  image(s25, 0, 0);
  if (mouseX > 502.333 && mouseX < 591.667 && mouseY > 300.334 && mouseY < 343) {
    noFill();
    strokeWeight(3);
    stroke(0);
    rect(493, 300, 98, 42);
        if(mousePressed == true){
      card = lastcard;
    }
  }
}

