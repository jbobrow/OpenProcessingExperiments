

//FINAL
//DORAHAN ARAPGIRLIOGLU
//NOTE: I couldn't get the sound and the image to work when you reach the red rectangle. I have no idea why it is not working


import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float x = 50;   
float y = 10;     
float vx = 2;
float vy = 0;
float gravity = 0.2;
float frictionX = .998;
float move = 700;
float move2 = 200;
float movevel = 2;
float movevel2 = 2;
float move3 = 350;
float movevel3 = -2;
float move4 = 800;
float movevel4 = -3;
float move5 = 600;
float movevel5 = 2;
float move6 = 100;
float movevel6 = 3;
float move7 = 200;
float movevel7 = -3;

PImage resim;


Minim minim;
AudioPlayer sou;


void setup() {
  size(1200,600);
  smooth();
  resim = loadImage("win2.jpg");

}

void draw() {
  background(255);


    if (x > 1150 && x < 1120 && y > 70 && y < 20){
      
      image(resim, 400,200);
      
      //The sound code
      //http://www.youtube.com/watch?v=yNsiBVlxO98
      minim = new Minim(this);
      sou = minim.loadFile("goodlife.mp3");
      sou.loop();

  }
  

  
  BALL();   
  block();
  block2();
  block3();
  block4();
  block5();
  block6();
  block7();
  hover();
  bounce();
  winblock();
  
 

  
}



void block(){
  
  fill(137);
  rect(move,500,100,5);
  
  move = move + movevel;
  
  if(move > 1100 || move <0){
    movevel = movevel *-1 ;
  } 
 //  if(move < 0){
  //  movevel = move + 3;
  // }
  
  
  
}


void block2(){
  
  fill(137);
  rect(move2,440,100,5);
  
  move2 = move2 + movevel2;
  
  if(move2 > 1100 || move2 <0){
    movevel2 = movevel2 *-1 ;
  } 
  
  
}

void block3(){
  
  fill(137);
  rect(move3,475,100,5);
  
  move3 = move3 + movevel3;
  
  if(move3 > 1100 || move3 <0){
    movevel3 = movevel3 *-1 ;
  }   
}

void block4(){
  
  fill(137);
  rect(move4,300,100,5);
  
  move4 = move4 + movevel4;
  
  if(move4 > 1100 || move4 <0){
    movevel4 = movevel4 *-1 ;
  }   
}

void block5(){
  
  fill(137);
  rect(move5,350,100,5);
  
  move5 = move5 + movevel5;
  
  if(move5 > 1100 || move5 <0){
    movevel5 = movevel5 *-1 ;
  }   
}

void block6(){
  
  fill(137);
  rect(move6,270,100,5);
  
  move6 = move6 + movevel6;
  
  if(move6 > 1100 || move6 <0){
    movevel6 = movevel6 *-1 ;
  }   
}

void block7(){
  
  fill(137);
  rect(move7,250,100,5);
  
  move7 = move7 + movevel7;
  
  if(move7 > 1100 || move7 <0){
    movevel7 = movevel7 *-1 ;
  }   
}

void hover(){
  
  fill(200);
  rect(500,300,100,5);
  
  
  if(x > 500 && x < 600 && y < 305){
    vy = vy * 0.50;
  }
}

void bounce(){
  
    if(x > move && x < move+100 && y > 498 && y < 507){
    vy = vy * -0.80;
  }
  
  if(x > move2 && x < move2+100 && y > 438 && y < 446){
    vy = vy * -0.80;
  }
  
    if(x > move3 && x < move3+100 && y > 473 && y < 480){
    vy = vy * -0.80;
  }
  
  if(x > move4 && x < move4+100 && y > 298 && y < 305){
    vy = vy * -0.80;
  }
  
  if(x > move5 && x < move5+100 && y > 348 && y < 356){
    vy = vy * -0.80;
  }
  
  if(x > move6 && x < move6+100 && y > 268 && y < 275){
    vy = vy * -0.80;
  }
  
  if(x > move7 && x < move7+100 && y > 248 && y < 256){
    vy = vy * -0.80;
  }
}

void BALL(){

  fill(175);
  stroke(0);
  ellipse(x,y,10,10);
  
  x = x + vx;
  y = y + vy;
  
  if( y > 598){
    vy = vy * -0.80;
  }
  
  vx = vx * frictionX;

  vy = vy + gravity;
  
  if (y > height) {
    
   
    y = height;  
  }
  
 // if (vx < 0.5 && vy > 0.1){
 //   vx = 0;
 //   vy = 0;
 // }
  
  
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
     vy = vy - 0.2;
     y = y - 5;
    }
      if (key == 'a' || key == 'A') {
      vx = vx - .1;
      }
        if (key == 'd' || key == 'D') {
      vx = vx + 0.1;
    }
  }
    
    if (x > 1200){
      vx = vx *-1;
    } else {
      if (x < 0){
        vx = vx *-1;
      }
    }

}

void winblock(){
  fill(255,0,0);
  rect(1120,20,30,50);
}





