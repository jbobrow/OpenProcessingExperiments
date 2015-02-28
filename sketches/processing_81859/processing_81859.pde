

PFont aa;
PImage mouth;
PImage nose;
PImage eye01;
PImage eye02;
PImage ear01;
PImage ear02;
PImage hair;

//hair
float locX1 = 140;
float locY1 = 45;

//mouth
float locX2 = 180;
float locY2 = 320;

//eye01
float locX3 = 185;
float locY3 = 210;

//eye02
float locX4 = 310;
float locY4 = 255;

//ear01
float locX5 = 120;
float locY5 = 180;

//ear02
float locX6 = 390;
float locY6 = 260;

//nose
float locX7 = 240;
float locY7 = 260;


int speedX2 = 7;
int speedY2 = 7;
int speedX3 = 7;
int speedY3 = 7;
int speedX4 = 2;
int speedY4 = 2;
int speedX5 = 5;
int speedY5 = 10;
int speedX6 = 5;
int speedY6 = 10;
int speedX7 = 5;
int speedY7 = 10;

int i=1;
int j=1;
int k=1;
int l=1;
int m=1;



void setup() {
  size(600,600);
  aa = createFont("t132.ttf",15,true);

  mouth = loadImage("mouth.png");
  nose = loadImage ("nose.png");
  eye01= loadImage ("eye01.png");
  eye02= loadImage ("eye02.png");
  ear01= loadImage ("ear01.png");
  ear02= loadImage ("ear02.png");
  hair = loadImage ("hair.png");
  background (124,124,124);
  smooth(); noFill();
  frameRate(24);
  }
  
void draw(){
  background(124,124,124);

  textFont (aa);
  textAlign(LEFT);
  fill (255);
  text ("HAPPY BIRTHDAY MY FRIEND!",10,20);
  fill (200);
  text ("Instruction: build up a pic tiping HELLO!",10,40);
  if ( i>1){
   fill(255);
   text ("H",400,500); } 
  if ( j>1){
   fill(255);
   text ("E",410,500); } 
  if ( k>1){
   fill(255);
   text ("L",420,500); }  
  if ( k>2){
    fill(255);
    text ("L",430,500); } 
  if ( l>1){
    fill(255);
    text ("O",440,500); }
  if ( m>1){
    fill(255);
    text ("!",450,500); }  
  
 //hair
  image (hair, locX1, locY1);
  
 //mouth
  locX2 = locX2 + speedX2;
  locY2 = locY2 + speedY2;
  
  if (locX2 > width-200 || locX2 < 0){
    speedX2 = speedX2*-1;
  }
  if (locY2 > height-200 || locY2 < 0){
    speedY2 = speedY2*-1;
  }
  if (keyPressed && key == 'h'){
    speedX2 = 0;
    speedY2 = 0;
  }
  
  //eye01
  locX3 = locX3 + speedX3;
  locY3 = locY3 + speedY3;
  
  if (locX3 > width-200 || locX3 < 0){
    speedX3 = speedX3*-1;
  }
  if (locY3 > height-200 || locY3 < 0){
    speedY3 = speedY3*-1;
  }
  if (keyPressed && key == 'e'){
    speedX3 = 0;
    speedY3 = 0;
  }
  //eye02
  locX4 = locX4 + speedX4;
  locY4 = locY4 + speedY4;
  
  if (locX4 > width-195 || locX4 < 0){
    speedX4 = speedX4*-1;
  }
  if (locY4 > height-70 || locY4 < 0){
    speedY4 = speedY4*-1;
  }
  if (keyPressed && key == 'l'){
    speedX4 = 0;
    speedY4 = 0;
  }
  //ear01
  locX5 = locX5 + speedX5;
  locY5 = locY5 + speedY5;
  
  if (locX5 > width-200 || locX5 < 0){
    speedX5 = speedX5*-1;
  }
  if (locY5 > height-200 || locY5 < 0){
    speedY5 = speedY5*-1;
  }
  if (keyPressed && key == 'l'){
    speedX5 = 0;
    speedY5 = 0;
  }
  //ear02
  locX6 = locX6 + speedX6;
  locY6 = locY6 + speedY6;
  
  if (locX6 > width-200 || locX6 < 0){
    speedX6 = speedX6*-1;
  }
  if (locY6 > height-200 || locY6 < 0){
    speedY6 = speedY6*-1;
  }
  if (keyPressed && key == 'o'){
    speedX6 = 0;
    speedY6 = 0;
  }
  //nose
  locX7 = locX7 + speedX7;
  locY7 = locY7 + speedY7;
  
  if (locX7 > width-200 || locX7 < 0){
    speedX7 = speedX7*-1;
  }
  if (locY7 > height-200 || locY7 < 0){
    speedY7 = speedY7*-1;
  }
  if (keyPressed && key == '!'){
    speedX7 = 0;
    speedY7 = 0;
  }
  
  
  image (mouth, locX2, locY2);
  image (eye01, locX3, locY3);
  image (eye02, locX4, locY4);
  image (ear01, locX5, locY5);
  image (ear02, locX6, locY6);
  image (nose, locX7, locY7);
  
  }
  void keyPressed(){
   if (key =='h'){
    i++;
   }
   if (key =='e'){
    j++;
   }
  if (key =='l'){
    k++;
   }
  if (key =='o'){
    l++;
  }
  if (key =='!'){
    m++;
  }
  }


