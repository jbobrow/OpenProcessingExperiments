
//Define variables
float x, y, xSpeed, ySpeed, C;

//hit and miss
int hit = 0;
int miss = 0;

//BGM
import ddf.minim.*;
Minim minim;
AudioSample bounce;
AudioPlayer bgsound;

//image
PImage img1;

void setup(){

//image
img1 = loadImage("BG.jpg"); 
size(600, 600);
 
//sound
minim = new Minim(this);
bounce = minim.loadSample("FUNNY BB.mp3");
bgsound = minim.loadFile("HOTPEPPER.mp3");
bgsound.loop();

size(600, 600);
noCursor();
noStroke();
smooth();
C = 0.5;
x = 200;
y = 20;
xSpeed = C;
ySpeed = C; 
frameRate(800);
}

void draw(){
  
  x = x + xSpeed;
  y = y + ySpeed;
  
  if(x > width){
  xSpeed = -C;  
  }
  
   if(y < 0){
  ySpeed = C;  
  }

  if(x < 0){
  xSpeed = C;  
  }

  if(y > 400){
  x = 200;
  y = 20;  
  }

if(y < 350 && y > 349 && x > mouseX && x < mouseX+10){
ySpeed = -C;
bounce.trigger();
hit++;
}

if(y >= 400){
  miss++;
}

float paddle = hit + 7;

background(173, 249, 255);
fill(255);
rect(mouseX, 350, 10, 10*paddle);
fill(255, 0, 0);
ellipse(x, y, 10, 10);

//top
fill(252, 201, 240, 150);
rect(0, 0, 600, 10);

fill(255, 255, 255, 150);
rect(0, 20, 600, 10);

fill(252, 201, 240, 150);
rect(0, 40, 600, 10);

fill(255, 255, 255, 150);
rect(0, 60, 600, 10);

fill(252, 201, 240, 150);
rect(0, 80, 600, 10);

fill(255, 255, 255, 150);
rect(0, 100, 600, 10);

fill(252, 201, 240, 150);
rect(0, 120, 600, 10);

//mark
fill(193, 126, 23);
textAlign(CENTER);
textSize(30); 
text("Candle(s):" + hit, 300, 60);
text("Waste:" + miss, 300, 90);

//candles
//1
fill(255);
rect(150, 480, 10, 70);
//2
fill(255);
rect(460, 480, 10, 70);
//3
fill(255);
rect(200, 430, 10, 70);
//4
fill(255);
rect(415, 430, 10, 70);

//fire
//1
fill(255, 0, 0);
ellipse(155, 473, 10, 10);
//2
fill(255, 0, 0);
ellipse(465, 473, 10, 10);
//3
fill(255, 0, 0);
ellipse(205, 423, 10, 10);
//4
fill(255, 0, 0);
ellipse(420, 423, 10, 10);

//cake
fill(193, 126, 23, 150);
rect(130, 550, 360, 50);

fill(252, 245, 235, 150);
rect(180, 500, 260, 50);

fill(252, 201, 240, 150);
rect(225, 450, 170, 50);

//image
if(hit == 20){
  image(img1, 0, 0, 600, 600);
  fill(255);
  text("HAPPY BIRTHDAY ! !", 170, 240, 300, 300);
}

//sound effect
if(hit == 20){
  image(img1, 0, 0, 600, 600);
}

if(miss == 10){
fill(193, 126, 23);
  text("LIGHT THE CANDLE ! !", 105, 200, 400, 400);
}
}

