
//Homework 7
//Tyler Porten (tporten) copyright 2012
//This is a game.


 
float tx, ty, tSize, txSpeed, tySpeed;
float x, y, d, Speed;
float cx, cy, cd, cxSpeed, cySpeed;
int score, time;
float gameMode;
 
PImage tyler;
PFont font, font2;
 
void setup(){
 size (600, 600);
 smooth();
 // noCursor();
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
 
 cx = width/2;
 cy = height/2;
 cd = 75;
 cxSpeed = 1;
 cySpeed = 1;
 
 score = 0;
 gameMode = 0;
 time = 0;
 
tyler = loadImage("tyler.png");
font = loadFont("BellMT-48.vlw");
font2 = loadFont("OCRAStd-48.vlw");
textFont(font, 48);
 
 
imageMode(CENTER);
ellipseMode(CENTER);
textAlign(CENTER);

}
 
 
void draw(){
  if (gameMode == 0){
  gameMenu();
  }
   if (gameMode == 1){ 
 prepWindow();
 drawCursor();
 wrapCursor();
 mouseDragged();
drawImage();
moveImage();
 gameInfo();
detectCollision();
   }
   if (gameMode == 2){
    gameOver(); 
   }

}
 
void gameMenu(){
 background(255);
 pushStyle();
 fill(0);
 textSize(20);
 text("Intructions:", width/2, height*.25);
 text("Move the circle by dragging", width/2, height*.5);
 text("the mouse on the screen.", width/2, height*.55);
 text("Try to hit the target as", width/2, height*.6);
 text("many times as you can in", width/2, height*.65);
 text("the time of 30 seconds.", width/2, height*.7);
 text("Press any key to play.", width/2, height*.9);
 if (keyPressed){
   gameMode = 1;
   time = millis();
 }
 popStyle();  
}

 
void prepWindow(){
  noStroke();
 fill(255, 255, 255, 30);
rect(0, 0, width, height); 
}


 
void gameInfo(){
  pushStyle();
  textFont(font2);
  textSize(24);
  fill(0);
  text("time:" + ((millis() - time))/1000, 100, 50);
  
  text("score:" + score, 300, 50);
  popStyle();
  
  if((millis() - time) > 30000){
   gameMode = 2; 
  }
  
}
 
void drawImage(){
  fill(255);
  image(tyler, tx, ty, tSize, tSize);

}
//void drawTyler(){
//  fill(255);
//    image(tyler, x, y, d, d);  
//}

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

//void wrapImage(){
// x = x + Speed;
// y = y + Speed/4;
//  if (x > width+d/2){
//   x = -d*(random(.1, .5));
//  } 
//  if (y > height+d/2){
//    y = -d*(random(.1, .5));
//  }

//}

void wrapCursor(){

 //cy = cy + cSpeed;
  if (cx > width){
   cx = 0;
  } 
  else if (cx < 0){
    cx = width;
  }
  if (cy > height){
    cy = 0;
  }
  else if (cy < 0){
    cy = height;
  }

}

void drawCursor(){
 fill(200, 200, 200, 50);
 noStroke();
 ellipse(cx, cy, cd, cd);
}


void mouseDragged(){

if (mousePressed) {
  if (mouseX > pmouseX){
   cxSpeed = cxSpeed + .5; 
  }
  else if (mouseX < pmouseX){
   cxSpeed = cxSpeed - .5; 
  }
  if (mouseY > pmouseY){
   cySpeed = cySpeed + .5; 
  }
  else if (mouseY < pmouseY){
    cySpeed = cySpeed - .5;
  }
     cx = cx + cxSpeed/4;
 cy = cy + cySpeed/4;
 
 fill(100);
 
 rect(pmouseX, pmouseY, 10, 10);
}
}

void detectCollision(){
  float d = dist (tx, ty, cx, cy);
  if (d <= tSize*.8){
    background(0);
    score = score + 1;
    textAlign(CENTER);
    pushStyle();
    textSize(150);
    text("BUH", width/2, height/2);
    popStyle();
   tx = random(10, 390);
   ty = random(10, 390); 
   txSpeed = random(1, 10);
   tySpeed = random(1, 10);
  }
  
}

void gameOver(){
 background(255);
 pushStyle();
 fill(0);
 textSize(32);
 text("Game Over", width/2, height*.25);
 text("Score: " + score, width/2, height*.5);
// text("To restart, press any key", width/2, height*.75);
// popStyle();
// if (keyPressed){
//   
//   gameMode = 1;
//   
// }
//  
}

