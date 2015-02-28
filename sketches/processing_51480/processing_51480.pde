
//Homework 6
//Tyler Porten (tporten) copyright 2012

//"drawImage" function is the one that bounces.
//"drawTyler" function is the one that wraps.

 
float tx, ty, tSize, txSpeed, tySpeed;
float x, y, d, Speed;
 
PImage tyler;
PFont font;
 
void setup(){
 size (400, 400);

frameRate(100);
 
 x = random(0, width);
 y = random(0, height);
 d = 100;
 Speed = 5;
 
 tx = random(0, width);
 ty = random(0, height);
 txSpeed = 2.5;
 tySpeed = 5;
 tSize = 100;
 
 
tyler = loadImage("tyler.png");
font = loadFont("BellMT-48.vlw");
textFont(font, 48);
 
 
imageMode(CENTER);
}
 
 
void draw(){
 prepWindow();
drawImage();
moveImage();
drawTyler();
wrapImage();

}
 

 
void prepWindow(){
  noStroke();
 fill(255, 255, 255, 30);
rect(0, 0, width, height); 
}
 

 
void drawImage(){
  fill(255);
  image(tyler, tx, ty, tSize, tSize);

}
void drawTyler(){
  fill(255);
    image(tyler, x, y, d, d);  
}

void moveImage(){
  tx = tx +txSpeed;
  if (tx > width-tSize/2){
   txSpeed = -txSpeed; 
   fill(0);
   text ("duh", random(width), random(height));
  }
  else if (tx < 0+tSize/2){
    txSpeed = -txSpeed;
     fill(0);
   text ("buh", random(width), random(height));
  }
   ty = ty +tySpeed;
  if (ty > width-tSize/2){
   tySpeed = -tySpeed; 
    fill(0);
   text ("duh", random(width), random(height));
  }
  else if (ty < 0+tSize/2){
    tySpeed = -tySpeed;
       fill(0);
   text ("buh", random(width), random(height));
  }
}

void wrapImage(){
 x = x + Speed;
 y = y + Speed/4;
  if (x > width+d/2){
   x = -d*(random(.1, .5));
  } 
  if (y > height+d/2){
    y = -d*(random(.1, .5));
  }

}



