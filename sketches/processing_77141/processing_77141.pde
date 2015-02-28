
//Sarah Anderson, seanders
//hw7 game
//copywrite Sarah Anderson @ CMU 2012
//move the mouse to move your mollecule
//if your mollecule goes out of bounds, score is reset to 0
//collide with the bouncing mollecule to gain points

float xNPC,yNPC,xSpeed, ySpeed, di,px,py,inc;
int score;
float windX, windY,windX2, windY2;
color colNPC, strNPC;


void setup(){
  size(600,600);
  smooth();
  textSize(20);
  //movement,score, & placement variables
  windX=30;
  windY=30;
  xNPC=random(70,500);
  yNPC=random(70,500);
  xSpeed= random(1,15);
  ySpeed=random(1,15);
  di= width/10;
  px=width/2;
  py=height/2;
  inc=0.08;
  windX2= 540;
  windY2=540;
  score=0;
  //various colors
  colNPC=color(random(255), random(255),random(255),180);
  strNPC=color(random(255), random(255),random(255),180);
}


void draw(){
  prepScreen();
  moveNPC();
  easePlayer();
  collision();
  
  
}

void prepScreen(){
  background(0);
  fill(50,50,50,100);
  noStroke();
  rect(windX, windY, windX2, windY2);
  textSize(48);
  fill(100);
  text("MOLECULAR REACTION", width/20, height/2);
  time();
  score();
  drawNPC();
  drawPlayer();
}

void drawNPC(){
  fill(colNPC);
  strokeWeight(4);
  stroke(strNPC);
  ellipse(xNPC,yNPC,di,di);  
}

void drawPlayer(){
  fill(255);
  ellipse(px,py, di,di);
}

void moveNPC(){
  xNPC+=xSpeed;
  yNPC+=ySpeed;
  if(xNPC+(di/2)>width-windX || xNPC-(di/2)<windX){
    xSpeed= -xSpeed;  
  }
  if(yNPC+(di/2)>height-windY || yNPC-(di/2)<windY){
    ySpeed= -ySpeed;  
  }
  
}

void easePlayer(){
  px+=(mouseX-px)*inc;
  py+=(mouseY-py)*inc;
  if(mouseX>width-windX){
  text("OUT OF BOUNDS", width/3, 350);
  px=windX;  
  score=0;
  }
  if(mouseY>height-windY){
  text("OUT OF BOUNDS", width/3, 350);  
  py=windY;  
  score=0;
  }
  if(mouseX<windX){
  text("OUT OF BOUNDS", width/3, 350);
  px=width-windX;  
  score=0;
  }
  if(mouseY<windY){
  text("OUT OF BOUNDS", width/3, 350);
  py=height-windY;  
  score=0;
  }
}

void collision(){
  float d=dist(px,py,xNPC,yNPC);
  if(d<=di){
    score++;
    prepScreen();
    fill(255,0,0);
    textSize(60);
    text("BANG!", px, py);
    xNPC=random(70,500);
    yNPC=random(70,500);
    xSpeed=random(1,9);
    ySpeed=random(1,9);
    colNPC=color(random(255), random(255),random(255),180);
    strNPC=color(random(255), random(255),random(255),180);
  }
}

void score(){
  textSize(20);
  fill(255);
  text ("Score: "+ score, 30,30);
}

void time(){
  textSize(20);
  fill(255);
  int time=millis()/1000;
  text("Time Played: " + time, width/2, 30);
  
}

