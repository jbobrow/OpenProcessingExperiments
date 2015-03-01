
float lx = 250;
float elx = 250;

float speed = 5;



Ball b1 = new Ball();
Ball b2 = new Ball();
Ball b3 = new Ball();
Ball b4 = new Ball();
Board bo1 = new Board();
Back ba1 = new Back();
Smoke s1 = new Smoke();
Start st1 = new Start();





void setup(){
  size(500, 900);
  smooth();
  background(0);
}

void draw(){
  bo1.box();
  
  if(bo1.m<4){
  
  st1.start();
  
  }
  
  if(bo1.m>=3){
  background(0);
  s1.smoke();
  ba1.back();
  fill(255);
  ellipse(elx, 800, 20, 20);
  b1.ball1();//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b2.ball1();//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b3.ball1();//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b1.ball2();//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b2.ball2();//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b3.ball2();//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b1.ball3();//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b2.ball3();//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b3.ball3();//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  b4.ball4();
  bo1.box();
  movement();
  
  
  
  if(mousePressed == true){
    
    stroke(255);
    strokeWeight(1);
    line(lx, 800, lx, 0);
    
  if(b1.b1x+10>=lx && b1.b1x-10<=lx){//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
    
    fill(245, 0, 0);
    text("1point", b1.b1x, b1.b1y); 
    b1.b1y = 0;
    ba1.thetaadd+=0.01;
    bo1.point++;
    bo1.pbar++;
    fill(245, 0, 0);
   
    
  }
  
  if(b2.b1x+10>=lx && b2.b1x-10<=lx){//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
    
    fill(245, 0, 0);
    text("1point", b2.b1x, b2.b1y);
    b2.b1y = 0;
    ba1.thetaadd+=0.01;
    bo1.point++;
    bo1.pbar++;
    
  }
  
  if(b3.b1x+10>=lx && b3.b1x-10<=lx){//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯Ã�Â¯Ã�Â¼Ã¯Â¿Â½
  
    fill(245, 0, 0);
    text("1point", b3.b1x, b3.b1y);
    b3.b1y = 0;
    ba1.thetaadd+=0.01;
    bo1.point++;
    bo1.pbar++;
    
  }
  
  if(b1.b2x+10>=lx && b1.b2x-10<=lx){//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
   
    fill(245, 0, 0);
    text("2point", b1.b2x, b1.b2y);
    b1.b2y = 0;
    ba1.thetaadd+=0.001;
    s1.smokeadd += 0.1;
    bo1.point+=2;
    bo1.pbar+=2;
    
  }
  
   if(b2.b2x+10>=lx && b2.b2x-10<=lx){//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
   
    fill(245, 0, 0);
    text("2point", b2.b2x, b2.b2y);
    b2.b2y = 0;
    ba1.thetaadd+=0.001;
    bo1.point+=2;
    bo1.pbar+=2;
    
  }
  
   if(b3.b2x+10>=lx && b3.b2x-10<=lx){//Ã�Â¨Ã�ÂµÃ�Â¤Ã�Â¯Ã�Â¼Ã¯Â¿Â½
    
    fill(245, 0, 0);
    text("2point", b3.b2x, b3.b2y);
    b3.b2y = 0;
    ba1.thetaadd+=0.01;
    bo1.point+=2;
    bo1.pbar+=2;
    
  }
  
   if(b1.b3x+10>=lx && b1.b3x-10<=lx){//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
   
    fill(245, 0, 0);
    text("-5point", b1.b3x, b1.b3y);
    b1.b3y = 0;
    ba1.thetaadd-=0.01;
    bo1.point-=5;
    bo1.pbar-=5;
    
  }
  
  if(b2.b3x+10>=lx && b2.b3x-10<=lx){//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
   
    fill(245, 0, 0);
    text("-5point", b2.b3x, b2.b3y);
    b2.b3y = 0;
    ba1.thetaadd-=0.01;
    bo1.point-=5;
    bo1.pbar-=5;
    
  }
  
  if(b3.b3x+10>=lx && b3.b3x-10<=lx){//Ã�Â§Ã�Â´Ã�Â«Ã�Â¯Ã�Â¼Ã¯Â¿Â½
   
     fill(245, 0, 0);
    text("-5point", b3.b3x, b3.b3y);
    b3.b3y = 0;
    ba1.thetaadd-=0.01;
    bo1.point-=5;
    bo1.pbar-=5;
    
  }
  
  
   if(b4.b4x+10>=lx && b4.b4x-10<=lx){//Ã�Â£Ã¯Â¿Â½Ã�Â¹Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â¼Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â¢Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½
    fill(245, 0, 0);
    text("speedUP", b4.b4x, b4.b4y);
    b4.b4y = 0;
    speed+=0.1;
   
    
  }
  
  
  
  }
  
}
}
  
boolean moveKeys[] = new boolean[2];

// Replace your old keyPressed()
void keyPressed(){
if(key == 'f'){
moveKeys[0] = true;
}
if(key == 'h'){
moveKeys[1] = true;
}
}

void keyReleased(){
if(key == 'f'){
moveKeys[0] = false;
}
if(key == 'h'){
moveKeys[1] = false;
}
}

void movement(){
if(moveKeys[0]){
lx-=speed;
elx-=speed;
}
if(moveKeys[1]){
lx+=speed;
elx+=speed;
}
}

  
 
 
    

  class Back{
  
  float theta=0;
  float thetaadd = 0.01;

 void back(){
  float el1x = 250+30*sin(theta);
  float el1y = 650+30*cos(theta);
  float el2x = 100+30*sin(theta);
  float el2y = 650+30*cos(theta);
  float el3x = 400+30*sin(theta);
  float el3y = 650+30*cos(theta);
  
  fill(245, 245, 0);
  noStroke();
  ellipse(250, 650, 100, 100);
  ellipse(100, 650, 100, 100);
  ellipse(400, 650, 100, 100);
  fill(255);
  ellipse(el1x, el1y, 10, 10);
  ellipse(el2x, el2y, 10, 10);
  ellipse(el3x, el3y, 10, 10);
 fill(245, 245, 0);
 stroke(255);
 strokeWeight(5);
 line(el1x, el1y, el2x, el2y);
 line(el2x, el2y, el3x, el3y);
  
  theta+=(0+thetaadd);
  noStroke();
  rect(100, 200, 100, 300);
  rect(50, 390, 400, 220);
  rect(480, 390, 20, 220);
  fill(25, 25, 250);
  rect(100, 440, 50, 50);
  rect(160, 440, 50, 50);
  rect(220, 440, 50, 50);
  rect(280, 440, 50, 50);
  rect(340, 440, 50, 50);
}
}
    
    
  
class Ball{
  
  float b1x;
  float b1y = 0;
  
  float b2x;
  float b2y = 0;
  
  float b3x;
  float b3y = 0;
  
  float b4x;
  float b4y = 0;
  
  void ball1(){//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â³Ã�Â£Ã¯Â¿Â½Ã�Â¯
    if(b1y == 0){
    b1x = random(500);
    } 
    fill(245, 72, 72);
    noStroke();
    ellipse(b1x, b1y, 20, 20);
    b1y++;
    
    if(b1y >= 810){
      b1y = 0;
    }
    
  }
  
  void ball2(){//Ã�Â¨Ã�ÂµÃ�Â¤
    if(b2y == 0){
      b2x = random(500);
    }
    fill(245, 0, 0);
    noStroke();
    ellipse(b2x, b2y, 15, 15);
    b2y+=2;
    
    if(b2y >= 810){
      b2y = 0;
      
    }
  }
  
  void ball3(){//Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â¼Ã�Â£Ã¯Â¿Â½Ã¯Â¿Â½Ã�Â£Ã¯Â¿Â½Ã�Â«
    if(b3y == 0){
      b3x = random(500);
    }
    fill(140, 53, 250);
    noStroke();
    ellipse(b3x, b3y, 20, 20);
    b3y+=random(1, 3);
    
    if(b3y >= 810){
      b3y = 0;
    }
  }
  
  void ball4(){
    if(b4y == 0){
      b4x = random(500);
    }
    fill(255, 220, 0);
    noStroke();
    ellipse(b4x, b4y, 10, 10);
    b4y+=10;
    
    if(b4y >= 810){
      b4y = 0;
    }
  }
  
  
}

  
class Board{
  
  int point = 0;
  int pbar = 0;
  int m;
  
  void box(){
     m = millis()/1000;
    fill(255);
    rect(0, 810, 500, 90);
    fill(0);
    textSize(20);
    text(point+"point", 10, 830);
    fill(245, 0, 0);
    rect(100, 820, pbar, 10);
    text(63-m, 10, 870);
       
    
    if(m >= 63){
      
      textSize(50);
      fill(245, 0, 0);
      text("TIME UP", 200, 500);
      
      if(point >= 100){
       
       
        background(0);
        text("Mission Completed", 50, 600);
      }else{
      background(0);
     
     
      text("Mission Failured", 50, 600);
    }
    if(m >= 70){
      
      Stop();
    }
    }
  }
  
}

class Smoke{

float theta = 0.1;
float smokeadd = 0;

 void smoke(){ 
  
  for(int x = 0; x <= 500; x+=1){
    fill(255);
    stroke(255);
    strokeWeight(3);
    point(150+40*cos(theta), 10+x);
    theta += 0.01+smokeadd;
  }
 }
}

class Start{
  
float elsize;
float colrand1;
float colrand2;
float colrand3;
float rx;
float ry = 800;
  
  
  void start(){
    textSize(65);
    loadFont("shoot.vlw");
    text("Shooting Game", 10, 100);
    textSize(40);
    text("Get 100points!!", 10, 300);
    
   
  }
}
