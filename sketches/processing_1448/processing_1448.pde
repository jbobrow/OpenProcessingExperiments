
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

void setup() {
  size(600, 500, P2D);
  font = loadFont("font.vlw");
  background(0);
  fill(255);
  noStroke();
  noCursor();
}


void draw() {
  noCursor();
  background(0);
  ball();
  paddles();
  action();
  speedplus();
  numbers();
  if(menu == 1) {
    background(0);
    textFont(font, 32);
    textAlign(CENTER);
    text("Click to Begin", 300, 250);
    noLoop();
    cursor();
    
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
  rect(30, mouseY, 10, 60);
  rect(mouseX, 30, 60, 10);
  rect(width-30, mouseY, 10, 60);
  rect(mouseX, height-30, 60, 10);
  
}


void action() {
  if(ballx >= 25 && ballx <=35 ) {
    if (bally >= mouseY - 30 && bally <= mouseY + 30) {
      xspeed = -xspeed;
      leftscore++;
    }
  }
  if(ballx <= width-25 && ballx >= width-35) {
    if(bally >= mouseY - 30 && bally <= mouseY + 30){
      xspeed = -xspeed;
      leftscore++;
    }
  }
  if(bally >= 25 && bally <= 35){
    if(ballx >= mouseX - 30 && ballx <= mouseX + 30){
      yspeed = -yspeed;
      leftscore++;
    }
  }
  if(bally >= height-35 && bally < height-25) {
    if(ballx >= mouseX - 30 && ballx <= mouseX + 30){
      yspeed = -yspeed;
      leftscore++;
    }
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
  



