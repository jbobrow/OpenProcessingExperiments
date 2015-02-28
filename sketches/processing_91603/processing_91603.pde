
//Ryan Shaver
//A09497449
//VIS 140
//Final Project: Social Interaction (Forced to crowd around a keyboard to play game)


float paddleLong = 80;
float paddleShort = 10;
float paddleSpeed=9;
float ballx = 300;
float bally = 250;
float yspeed = 3;
float xspeed = 2.5;
int leftscore = 0;
PFont font;
int x = 0;
int pause;
int tmpscore = leftscore;
int menu = 1;
float tPaddle = 200;
float rPaddle = 200;
float bPaddle = 200;
float lPaddle = 200;

void setup() {
  size(600, 500, P2D);
  font = loadFont("Serif-48.vlw");
  background(0);
  fill(255);
  noStroke();
}


void draw() {
  background(0);
  ball();
  paddles();
  action();
  speedplus();
  numbers();
  if(menu == 1) {
    background(0);
    
    textFont(font, 34);
    textAlign(CENTER);
    text("P4PP : Play Four Player Pong", 300, 50);
    
    textFont(font, 52);
    textAlign(CENTER);
    text("CLICK TO START", 300, 200);
    
    textFont(font, 28);
    //leftright, topbottom
    text("Player Top: Q W",  300, 300);
    text("Player Right: O L", 480, 380);
    text("Player Bottom: Z X", 300, 480);
    text("Player Left : J M", 120, 380);
    noLoop();
    
   }
  
  if(keyPressed){
     
    //TOP Paddle
     if (key == 'q'){
       tPaddle = constrain(tPaddle - paddleSpeed,paddleLong/2,width-paddleLong/2);
     }
     
     if (key == 'w'){
       tPaddle = constrain(tPaddle + paddleSpeed,paddleLong/2,width-paddleLong/2);
     }
  
    //RIGHT Paddle
     if (key == 'o'){
       rPaddle = constrain(rPaddle - paddleSpeed,paddleLong/2,height-paddleLong/2);
     }
     
     if (key == 'l'){
       rPaddle = constrain(rPaddle + paddleSpeed,paddleLong/2,height-paddleLong/2);
     }
   
    //BOTTOM Paddle
     if (key == 'z'){
       bPaddle = constrain(bPaddle - paddleSpeed,paddleLong/2,width-paddleLong/2);
     }
     
     if (key == 'x'){
       bPaddle = constrain(bPaddle + paddleSpeed,paddleLong/2,width-paddleLong/2);
     }
    
    
      //LEFT Paddle
     if (key == 'j'){
       lPaddle = constrain(lPaddle - paddleSpeed,paddleLong/2,height-paddleLong/2);
     }
     
     if (key == 'm'){
       lPaddle = constrain(lPaddle + paddleSpeed,paddleLong/2,height-paddleLong/2);
     }
    
  
  }
  
   
}


void ball() {
  ballx += xspeed;
  bally += yspeed;
  fill(255);
  rect(ballx, bally, 10, 10);
}


void paddles() {
  rectMode(CENTER);
  //Left
  rect(30, lPaddle, paddleShort, paddleLong);
  //Top
  rect(tPaddle, 30, paddleLong, paddleShort);
  //Right
  rect(width-30, rPaddle, paddleShort, paddleLong);
  //Bottom
  rect(bPaddle, height-30, paddleLong, paddleShort);
  
}


void action() {
  //TOP
  if((ballx<= tPaddle+paddleLong/2) && (ballx>=tPaddle-paddleLong/2) &&(bally<=35)&&(bally>=25)){
  
  yspeed = -yspeed;
      leftscore++;
      println("top hit");
    }
    
    
  //RIGHT  
   if((bally<= rPaddle+paddleLong/2) && (bally>=rPaddle-paddleLong/2) &&(ballx >= width-35)&&(ballx <= width-25)){
  
  xspeed = -xspeed;
      leftscore++;
      println("right hit");
    }
  
  //BOTTOM
   if((ballx<= bPaddle+paddleLong/2) && (ballx>=bPaddle-paddleLong/2) &&(bally<=height-25)&&(bally>=height-35)){
  
  yspeed = -yspeed;
      leftscore++;
      println("bottom hit");
    }
  
  //LEFT
   if((bally<= lPaddle+paddleLong/2) && (bally>=lPaddle-paddleLong/2) &&(ballx >= 25)&&(ballx <= 35)){
  
  xspeed = -xspeed;
      leftscore++;
      println("left hit");
    }
  
  
  
 

  
  
  if(ballx < 0 || ballx > width || bally < 0 || bally > height) {
    reset();  
  }
}



     
           
void speedplus() {  
  if(leftscore==10){
    if(yspeed==3 && xspeed==2.5){
      yspeed += 0.5;
      xspeed += 0.5;
    }
    if(yspeed == -3 && xspeed==2.5) {
      yspeed += -0.5;
      xspeed += 0.5;
    }
    if(yspeed == 3 && xspeed== -2.5) {
      yspeed += 0.5;
      xspeed += -0.5;
    }
    if(yspeed == -3 && xspeed==-2.5) {
      yspeed += -0.5;
      xspeed += -0.5;
    }
  }
  
  
  
  
  if(leftscore==20){
    if(yspeed==3.5 && xspeed==3){
      yspeed += 1;
      xspeed += 1;
    }
    if(yspeed == -3.5 && xspeed==3) {
      yspeed += -1;
      xspeed += 1;
    }
    if(yspeed == 3.5 && xspeed== -3) {
      yspeed += 1;
      xspeed += -1;
    }
    if(yspeed == -3.5 && xspeed==-3) {
      yspeed += -1;
      xspeed += -1;
    }
  }
  
  
  
  
  if(leftscore==25){
    if(yspeed==4.5 && xspeed==4){
      yspeed += 1.5;
      xspeed += 1.5;
    }
    if(yspeed == -4.5 && xspeed==4) {
      yspeed += -1.5;
      xspeed += 1.5;
    }
    if(yspeed == 4.5 && xspeed== -4) {
      yspeed += 1.5;
      xspeed += -1.5;
    }
    if(yspeed == -4.5 && xspeed==-4) {
      yspeed += -1.5;
      xspeed += -1.5;
    }
  }
  
  
  
  
  if(leftscore==30){
    if(yspeed==6 && xspeed==5.5){
      yspeed += 2.5;
      xspeed += 2.5;
    }
    if(yspeed == -6 && xspeed==5.5) {
      yspeed += -2.5;
      xspeed += 2.5;
    }
    if(yspeed == 6 && xspeed== -5.5) {
      yspeed += 2.5;
      xspeed += -2.5;
    }
    if(yspeed == -6 && xspeed==-5.5) {
      yspeed += -2.5;
      xspeed += -2.5;
    }
  }  
}    






void reset() {
  ballx = 300;
  bally = 250;
  xspeed = 2.5;
  yspeed = 3;
  leftscore=0;
  menu=1;
  
}


void keyPressed() {
  if(key == 'p' || key == 'P') {
    if(pause == 0) {
      noLoop();
      pause = 1;
      textFont(font, 32);
      textAlign(CENTER);
      text("PAUSED", 300, 250);
    }
    else {
      loop();
      pause = 0;
    }
  
  }
  if (key == 'r' || key == 'R') {
    reset();
  }
}


void mouseClicked() {
  if(menu==1) {
    loop();
    menu = 0;
  }
}

void numbers() {
  textFont(font, 48);
  textAlign(CENTER);
  text(leftscore, 300, 250);
}

