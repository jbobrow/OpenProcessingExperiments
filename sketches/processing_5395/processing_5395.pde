
/* 
Trenton Szewczyk
Exercise 4
DMA 28
10/21/09

BREAKFATST TIEM: PROLOGUE

CONTROLS: wasd for movement; t for teleport.

background courtesy of Nasa's Astronomy Picture of the Day*/


//trig
float a = 0.0;
float a2 = 0.0;
float angleInc = PI/1.5;
float angleInc2 = PI/30.0;
float scalar = 1.05;
float scalar2 = 25.0;
float lpos, rpos, dogposX, dogposY, x, y ,x1, y1;
PImage marsbg, imbg, lleg, rleg, toast, tguts, imeye, dog;
float alph;
PFont font;


void setup() {
  size(480,320);
//  smooth();  
  x = (width/6);
  y = (height/3);
  x1 = 0;
  y1 = 0;

  //img var
  marsbg = loadImage("marsbackground2.gif");
  lleg = loadImage("lleg.png");
  rleg = loadImage("rleg.png");
  toast = loadImage("toast.png");
  tguts = loadImage("toastguts.png");
  dog = loadImage("dog.png");
  font = loadFont("automat-48.vlw");
  frameRate (35);
}


void draw() {
  background(0);
  image (marsbg, x1, y1);
  float m = millis();

//vibration
  a = a+angleInc;
  a2= a2+angleInc2;
  float s=sin(a)*scalar;
  float s2=sin(a2)*scalar2;
  println(s2);

//Corgie
  image (dog, 280, s2);
  
//Fade in    
  fill(0, alph);
  rect(0, 0, 480, 320);
  if (m<7000){
    alph = 255;
    textFont(font);
    fill(255);
    textSize(18);
    text("PROLOGUE: ADVENTURE AWAITS", 90, height/2);
    }else if (m <3500){
     alph = alph/1.2;
   }else if (m<13000){
     alph=alph/1.4;
   }
  
//leg movement
  lpos = y+80;
  rpos = y+90;
  if (m % 4< 2){
    lpos = y+100;
    }else{
    rpos = y+110;
  }

//Mr. Toastocalypse
pushMatrix();
scale (.5);
  image (toast, x+10+s, y-30, 60, 60);
  image (lleg, x-40, lpos);
  image (rleg, x+50, rpos);
  image (tguts, x-25+s, y, 120, 120);
  popMatrix();
}


void keyPressed(){
//Movement controls
    if (key=='d'){
      x1 = (x1-15);
      dogposX = dogposX-15;
    }
    if (key=='w'){
      y = y-10;
    }
    if (key=='s'){
      y = y+10;
    }
    if (key=='a'){
      x = x-15;
    }

//Teleporter
  if (key=='t'){
    x = random(0, 480);
    y = random(0, 320);
    noStroke();
    fill (255);
    rect(x/2-40, 0, 75, 400);
    }
   
  }

