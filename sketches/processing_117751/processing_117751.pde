
//I Want To Eat Donuts!
//Xavier Wong 25/10/2013

float x = 100, y = 100;
float xSpeed = random(2, 4);
float ySpeed = random(2, 4);
int player1=0;

float donutX = 0, donutY = 30;
float donutX1 = 100, donutY1 = 30;
float donutX2 = 200, donutY2 = 30;
float donutX3 = 300, donutY3 = 30;
float donutX4 = 400, donutY4 = 30;
float donutX5 = 500, donutY5 = 30;

float donutX6 = 0, donutY6 = 130;
float donutX7 = 100, donutY7 = 130;
float donutX8 = 200, donutY8 = 130;
float donutX9 = 300, donutY9 = 130;
float donutX10 = 400, donutY10 = 130;
float donutX11 = 500, donutY11 = 130;

float donutX12 = 0, donutY12 = 230;
float donutX13 = 100, donutY13 = 230;
float donutX14 = 200, donutY14 = 230;
float donutX15 = 300, donutY15 = 230;
float donutX16 = 400, donutY16 = 230;
float donutX17 = 500, donutY17 = 230;

PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

import ddf.minim.*;
Minim minim;
AudioSample effect1;
AudioSample effect2;
AudioPlayer bgsound;

void setup() {
  
  size(600,600);
  noStroke();
  noCursor();
  img = loadImage("maggiecover.jpg");
  img1 = loadImage("simpsonmaggie.png");
  img2 = loadImage("donut.png");
  img3 = loadImage("maggiehand.png");
  img4 = loadImage("maggiedonuts.jpg");
  img5 = loadImage("handdonut.png");
  
  minim = new Minim(this);
  effect1 = minim.loadSample("eating.mp3");
  effect2 = minim.loadSample("platebreak.mp3");
  bgsound = minim.loadFile("positivefeeling.mp3");
  bgsound.loop();
}  

//eating.mp3 sources from SoundBible.com
//positivefeeling.mp3 souces from AlumoMusic
  
void draw() {
  background(img);
  display(); // To setup the user defined function

  if (keyCode== ENTER) {
  beginScreen(); 
  image(img1, mouseX-25, height-200, 130, 189);
  
  fill(0);
  text("Player 1:"+player1, 20, 20);
   
  image(img2, donutX, donutY, 100, 100);
  image(img2, donutX1, donutY1, 100, 100);  
  image(img2, donutX2, donutY2, 100, 100);  
  image(img2, donutX3, donutY3, 100, 100);
  image(img2, donutX4, donutY4, 100, 100);  
  image(img2, donutX5, donutY5, 100, 100);
  
  image(img2, donutX6, donutY6, 100, 100);
  image(img2, donutX7, donutY7, 100, 100);  
  image(img2, donutX8, donutY8, 100, 100);  
  image(img2, donutX9, donutY9, 100, 100);
  image(img2, donutX10, donutY10, 100, 100);  
  image(img2, donutX11, donutY11, 100, 100);

  image(img2, donutX12, donutY12, 100, 100);
  image(img2, donutX13, donutY13, 100, 100);  
  image(img2, donutX14, donutY14, 100, 100);  
  image(img2, donutX15, donutY15, 100, 100);
  image(img2, donutX16, donutY16, 100, 100);  
  image(img2, donutX17, donutY17, 100, 100);
  
  fill(random(255), random(1), random(255));
  image(img3, x, y, 34, 53);
  
  
  x = x + xSpeed;
  y = y + ySpeed;
  
  if (x > width-5 || x < 5) {
    xSpeed = -xSpeed;
  }
  if (y > height-5 || y < 5) {
    ySpeed = -ySpeed;
  }

//

  if (y >height-200 &&( mouseX-15<x && mouseX+15> x))
  { 
    ySpeed = -ySpeed;
  }
  
//

  if (ySpeed < 0 && x >= donutX && x <= donutX+50 && y > donutY && y < donutY+10)
  { 
    ySpeed = -ySpeed;
    donutX = -1000;
    println("HIT!!!!");
    effect1.trigger();
  }

  if (ySpeed < 0 && x >= donutX1 && x <= donutX1+50 && y > donutY1 && y < donutY1+10)
  { 
    ySpeed = -ySpeed;
    donutX1 = -1000;
    player1 = player1+5;
    println("HIT1!!!!");
    effect1.trigger();
  }
   if (ySpeed < 0 && x >= donutX2 && x <= donutX2+50 && y > donutY2 && y < donutY2+10)
  { 
    ySpeed = -ySpeed;
    donutX2 = -1000;
    player1 = player1+5;
    println("HIT2!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX3 && x <= donutX3+50 && y > donutY3 && y < donutY3+10)
  { 
    ySpeed = -ySpeed;
    donutX3 = -1000;
    player1 = player1+5;
    println("HIT3!!!!");
    effect1.trigger();
  }
  if (ySpeed < 0 && x >= donutX4 && x <= donutX4+50 && y > donutY4 && y < donutY4+10)
  { 
    ySpeed = -ySpeed;
    donutX4 = -1000;
    player1 = player1+5;
    println("HIT4!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX5 && x <= donutX5+50 && y > donutY5 && y < donutY5+10)
  { 
    ySpeed = -ySpeed;
    donutX5 = -1000;
    player1 = player1+5;
    println("HIT5!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX6 && x <= donutX6+50 && y > donutY6 && y < donutY6+10)
  { 
    ySpeed = -ySpeed;
    donutX6 = -1000;
    player1 = player1+5;
    println("HIT6!!!!");
    effect1.trigger();
  }
     if (ySpeed < 0 && x >= donutX7 && x <= donutX7+50 && y > donutY7 && y < donutY7+10)
  { 
    ySpeed = -ySpeed;
    donutX7 = -1000;
    player1 = player1+5;
    println("HIT7!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX8 && x <= donutX8+50 && y > donutY8 && y < donutY8+10)
  { 
    ySpeed = -ySpeed;
    donutX8 = -1000;
    player1 = player1+5;
    println("HIT8!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX9 && x <= donutX9+50 && y > donutY9 && y < donutY9+10)
  { 
    ySpeed = -ySpeed;
    donutX9 = -1000;
    player1 = player1+5;
    println("HIT9!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX10 && x <= donutX10+50 && y > donutY10 && y < donutY10+10)
  { 
    ySpeed = -ySpeed;
    donutX10 = -1000;
    player1 = player1+5;
    println("HIT10!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX11 && x <= donutX11+50 && y > donutY11 && y < donutY11+10)
  { 
    ySpeed = -ySpeed;
    donutX11 = -1000;
    player1 = player1+5;
    println("HIT11!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX12 && x <= donutX12+50 && y > donutY12 && y < donutY12+10)
  { 
    ySpeed = -ySpeed;
    donutX12 = -1000;
    player1 = player1+5;
    println("HIT12!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX13 && x <= donutX13+50 && y > donutY13 && y < donutY13+10)
  { 
    ySpeed = -ySpeed;
    donutX13 = -1000;
    player1 = player1+5;
    println("HIT13!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX14 && x <= donutX14+50 && y > donutY14 && y < donutY14+10)
  { 
    ySpeed = -ySpeed;
    donutX14 = -1000;
    player1 = player1+5;
    println("HIT4!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX15 && x <= donutX15+50 && y > donutY15 && y < donutY15+10)
  { 
    ySpeed = -ySpeed;
    donutX15 = -1000;
    player1 = player1+5;
    println("HIT15!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX16 && x <= donutX16+50 && y > donutY16 && y < donutY16+10)
  { 
    ySpeed = -ySpeed;
    donutX16 = -1000;
    player1 = player1+5;
    println("HIT16!!!!");
    effect1.trigger();
  }
    if (ySpeed < 0 && x >= donutX17 && x <= donutX17+50 && y > donutY17 && y < donutY17+10)
  { 
    ySpeed = -ySpeed;
    donutX17 = -1000;
    player1 = player1+5;
    println("HIT17!!!!");
    effect1.trigger();
}
    if (y>width-5) {
      player1=player1-100;
      effect2.trigger();
    }
    if (y >height-40 && (mouseX-25 < x && mouseX+25 >x)) {
      player1=player1+20;
    }
    if (donutX == -1000 && donutX1 == -1000 && donutX2 == -1000 && donutX3 == -1000 && donutX4 == -1000 && donutX5 == -1000 && donutX6 == -1000 && donutX7 == -1000 && donutX8 == -1000 && donutX9 == -1000 
    && donutX10 == -1000 && donutX11 == -1000 && donutX12 == -1000 && donutX13 == -1000 && donutX14 == -1000 && donutX15 == -1000 && donutX16 == -1000 && donutX17 == -1000) {
      image(img4, 0, 0, 600, 600);
  }
  }
}


//Self-defined function
//To display an image in the beginning
void display() {
  image(img5, 280, 0, 200,199);
} 

void beginScreen() {
     background(255, 204, 0); 
    }

