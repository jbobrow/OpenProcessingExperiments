
//PROJECT 4: NARRATE
//KIRA SULER
//NOV. 4TH, 2010

int card = 0;
boolean move = true;

PImage zero;
PImage one;
PImage two;
PImage three;
PImage four;
PImage five;
PImage six;
PImage eight;
PImage nine;
PImage ten;
PImage eleven;
PImage twelve;
PImage fourteen;
PImage fifteen;



void setup(){
  size(640,480);
  smooth();
  
  zero = loadImage("zero.png");
  one = loadImage("one.png");
  two = loadImage("2.png");
  three = loadImage("3.png");
  four = loadImage("4.png");
  five = loadImage("5.png");
  six = loadImage("6.png");
  eight = loadImage("8.png");
  nine = loadImage("9.png");
  ten = loadImage("10.png");
  eleven = loadImage("11.png");
  twelve = loadImage("12.png");
  fourteen = loadImage("14.png");
  fifteen = loadImage("15.png");
  
}

void draw(){
  println(card);
if (card == 0){
background(0);

////////////////////////////////////CARD 0
    image (zero,0,0);
    if (mousePressed && move) {
      card = 1;
      move = false;
    } 
  }
////////////////////////////////////CARD 1
  else if (card == 1) {
    image (one,0,0);
    int left = 90;
    int right = 270;
    int top = 246;
    int bottom = 426;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 3;
        move = false;  
 
      }
    }
    left = 366;
    right = 546;
    top = 246;
    bottom = 426;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 2;
        move = false;
      } 
    }
 
  }
  
  //////////////////////////////////////CARD 2
    else if (card == 2) {
    image (two,0,0);
      int left = 12; 
      int right = 192;
      int top = 336;
      int bottom = 408;

    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 6;
        move = false;
 
    }
  }
  left = 210;
  right = 366;
  top = 318;
  bottom = 402;
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 8;
        move = false;
      }
   }
  }
  
  //////////////////////////////////////CARD 3
  else if (card == 3) {
    image (three,0,0);
    int left = 6;
    int right = 186;
    int top = 390;
    int bottom = 486;
    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 5;
        move = false;
 
    }
  }
  left = 201;
  right = 360;
  top = 390;
  bottom = 471;
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 4;
        move = false;
      }
   }
  }
 
  
   //////////////////////////////////////CARD 6
    else if (card == 6) {
    image (six,0,0);
int left = 411;
int right = 540;
int top = 432;
int bottom = 465;


    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 10;
        move = false;
 
    }
  }
  left = 477;
  right = 636;
  top = 120;
  bottom = 201;
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 9;
        move = false;
      }
   }
  }
  
     //////////////////////////////////////CARD 10
    else if (card == 10) {
    image (ten,0,0);
int left = 6;
int right = 186;
int top = 246;
int bottom = 324;


    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 14;
        move = false;
 
    }
  }
  left = 486;
  right = 640;
  top = 399;
  bottom = 480;
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 15;
        move = false;
      }
   }
  }
  
     //////////////////////////////////////CARD 5
    else if (card == 5) {
    image (five,0,0);
int left = 66;
int right = 288;
int top = 306;
int bottom = 384;


    if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 12;
        move = false;
 
    }
  }
  left = 393;
  right = 573;
  top = 108;
  bottom = 183;
   if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom) {
      if (mousePressed && move) {
        card = 11;
        move = false;
      }
   }
  }
  
  else if(card == 8){
    image(eight,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 9){
    image(nine,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 14){
    image(fourteen,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 15){
    image(fifteen,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 4){
    image(four,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 12){
    image(twelve,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
    else if(card == 11){
    image(eleven,0,0);
    if(mousePressed && move){
      card = 1;
      move = false;
    }
  }
  
  
  
  
  
  
  
  
  
  
  
}//draw

void mouseReleased() {
  move = true;
}

