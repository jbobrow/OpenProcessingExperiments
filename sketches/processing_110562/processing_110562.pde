
// Define variables
float x, y, xSpeed, ySpeed, C;

// hit and miss
int hit = 0;
int miss = 0;

// BGM
import ddf.minim.*;
AudioPlayer player;
Minim minim;

// Image
PImage img1;

void setup(){

// Image
img1 = loadImage("BG.jpg"); 
size(600, 600);
 
// BGM 
minim = new Minim(this);
player = minim.loadFile("HOTPEPPER.mp3");
player.loop();

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

  if(y > 450){
  x = 200;
  y = 20;  
  }

if(y < 400 && y > 399 && x > mouseX && x < mouseX+10){
ySpeed = -C;
}

if(y < 400 && y > 399 && x > mouseX && x < mouseX+10){
  hit++;
}

if(y >= 450){
  miss++;
}

float paddle = hit + 10;

background(173, 249, 255);
fill(255);
rect(mouseX, 400, 10, 10*paddle);
fill(255, 0, 0);
ellipse(x, y, 10, 10);

// TOP
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

fill(193, 126, 23);
textAlign(CENTER);
textSize(30); 
text("Candle(s):" + hit, 300, 60);
text("Waste:" + miss, 300, 90);

//CAKE
fill(193, 126, 23, 150);
rect(130, 550, 360, 50);

fill(252, 245, 235, 150);
rect(180, 500, 260, 50);

fill(252, 201, 240, 150);
rect(230, 450, 170, 50);

if(hit == 10){
  image(img1, 0, 0, 600, 600);
  fill(255);
  text("HAPPY BIRTHDAY ! !", 170, 240, 300, 300);
}

if(miss == 30){
fill(193, 126, 23);
  text("LIGHT THE CANDLE AGAIN ! !", 160, 200, 300, 300);
}
}

