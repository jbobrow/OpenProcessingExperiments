
PFont myFont;
boolean bm = false;
float y = random(1000);
float x = random(1000);
int score = 0;
int bX;
boolean direction = false;
int gameState;

import ddf.minim.*;
Minim minim;//宣告
AudioPlayer in;//宣告

void setup(){
  minim = new Minim(this);
  in = minim.loadFile("123.mp3");
  

  size(1000, 300);
  frameRate(150);
  noStroke();
  ellipseMode(CENTER);  
  smooth();
  myFont = loadFont("ARDESTINE-48.vlw");
  textFont(myFont,50);
  gameState = 0;
}

void draw(){
 background(0);
  if(gameState == 0){
    fill(255,random(256),random(256)); 
    text("HIT THE BALL ! !",220,100);
    text("PRESS MOUSE 2 START",220,200);
    if(mousePressed){
    gameState = 1;in.loop(); 
  }
}

  
  
  if(gameState == 1){  
    
  fill(0);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);  
  fill(255);
  rect(mouseX, 280, 20, 3);
  text("SCORE:", 400, 150);
  text(score, 570, 150);
  ellipse(x, y, 25, 25);
  if(mouseX > x-20 && mouseX < x+20 & 280 > y-1 && 280 < y+1 ) 
  {bm=true; score=score+1;}
  if(y < 0){bm=false; x=random(1000);}   
  if(y > height){x=random(1000); y=0; score=score++;}
  if(bm) {y = y-1;} else{y = y+1;}

  if(score >= 10){
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);  
    fill(200,255,0);
    rect(mouseX, 280, 20, 3);
    text("SCORE:", 400, 150);
    text(score, 570, 150);
    ellipse(x, y, 20, 20);
    rect(bX,20, 20, 3);
    if(mouseX > x-20 && mouseX < x+20 & 280 > y-1 && 280 < y+1 ) 
    {bm=true; score=score+1;}
    if(y < 0){bm=false; x=random(1000);}   
    if(y > height){x=random(1000); y=0; score=score++;}
    if(bm) {y = y-1;} else{y = y+1;}
   
    if( bX>=0 && direction==false){bX+=10;}
    if( bX>=1000){direction=true;}
    if(bX<=1000 && direction==true){bX-=10;}
    if(bX<=10){direction=false;}
  }

  if(score >= 30){
   fill(0);
   rectMode(CENTER);
   rect(width/2, height/2, width, height);  
   fill(255,150,0);
   rect(mouseX, 280, 20, 3);
   text("SCORE:", 400, 150);
   text(score, 570, 150);
   ellipse(x, y, 15, 15);
   rect(bX,20, 20, 3);
   rect(bX,100, 20, 3);
   if(mouseX > x-20 && mouseX < x+20 & 280 > y-1 && 280 < y+1 ) 
   {bm=true; score=score+1;}
   if(y < 0){bm=false; x=random(1000);}   
   if(y > height){x=random(1000); y=0; score=score++;}
   if(bm) {y = y-1;} else{y = y+1;}
   
   if( bX>=0 && direction==false){bX+=10;}
   if( bX>=1000){direction=true;}
   if(bX<=1000 && direction==true){bX-=10;}
   if(bX<=10){direction=false;}
 }
 
   if(score >= 60){
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);  
    fill(255,242,0);
    rect(mouseX, 280, 20, 3);
    text("SCORE:", 400, 150);
    text(score, 570, 150);
    ellipse(x, y, 10, 10);
    rect(bX,20, 20, 3);
    rect(bX,100, 20, 3);
    rect(bX,180, 20, 3);
    if(mouseX > x-20 && mouseX < x+20 & 280 > y-1 && 280 < y+1 ) 
    {bm=true; score=score+1;}
    if(y < 0){bm=false; x=random(1000);}   
    if(y > height){x=random(1000); y=0; score=score++;}
    if(bm) {y = y-1;} else{y = y+1;}
    
    if( bX>=0 && direction==false){bX+=10;}
    if( bX>=1000){direction=true;}
    if(bX<=1000 && direction==true){bX-=10;}
    if(bX<=10){direction=false;}
  }


  if(score >= 120){
    fill(0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);  
    fill(170,90,165);
    rect(mouseX, 280, 20, 3);
    text("SCORE:", 400, 150);
    text(score, 570, 150);
    ellipse(x, y, 5, 5);
    rect(bX,20, 20, 3);
    rect(bX,100, 20, 3);
    rect(bX,180, 20, 3);
    rect(bX,260, 20, 3);
    if(mouseX > x-20 && mouseX < x+20 & 280 > y-1 && 280 < y+1 ) 
    {bm=true; score=score+1;}
    if(y < 0){bm=false; x=random(1000);}   
    if(y > height){x=random(1000); y=0; score=score++;}
    if(bm) {y = y-1;} else{y = y+1;}
    
    if( bX>=0 && direction==false){bX+=10;}
    if( bX>=1000){direction=true;}
    if(bX<=1000 && direction==true){bX-=10;}
    if(bX<=10){direction=false;}
  }
  if(y > height){gameState = 2;}
 }
   if(gameState == 2){
   fill(255,random(256),random(256));  
   text("GAME OVER",355,50);
   text("FINAL SCORE",350,100);
   text(score,480,175);
   text("PRESS R 2 RESTART",250,250);
   if(keyPressed && key == 'r'){
    gameState = 0;
    score=0;
    in.close();
   setup();
  }
 }
}

