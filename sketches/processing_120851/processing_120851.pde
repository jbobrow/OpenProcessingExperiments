
Ball ball;
paddle Rpad;
paddle Lpad;

int gameMode = 0;
int time = 2000;

void setup() {
  ball = new Ball(450,150,20);
  Rpad = new paddle(830,150);
  Lpad = new paddle(70,150);
  size(900,300);
  noStroke();
  smooth();
}

void draw() {
  if(gameMode == 0){
    button(300,150,"1 Player",255);
    button(600,150,"2 Player",255);
  }
  else if(gameMode == 1) {
    OneP();
  }
  else if(gameMode == 2) {
    TwoP();
  }
}

void mouseClicked() {
  if(gameMode == 0) {
    if(mouseX>200 && mouseX<400 && mouseY>100 && mouseY<200) {
      gameMode = 1;
    }
    if(mouseX>500 && mouseX<700 && mouseY>100 && mouseY<200) {
      gameMode = 2;
    }
  }
}
    
void OneP() {
  background(0);
  ball.display();
  Rpad.display();
  Lpad.display();
  
  if( millis() > time) {
    ball.move();
    Rpad.move(1);
    Lpad.AI();
    checkWalls();
  }  
}

void TwoP() {
  background(0);
  ball.display();
  Rpad.display();
  Lpad.display();
  
  if( millis() > time) {
   ball.move();
   Rpad.move(1);
   Lpad.move(2);
   checkWalls();
  } 
}

void checkWalls(){
  float ballx = ball.Xpos;
  float bally = ball.Ypos;
  float rpy = Rpad.Ypos;
  float lpy = Lpad.Ypos;
  
  if(ballx>820 && ballx<830 && bally>rpy-38 && bally<rpy+38) {
      bsu();      //ball y speed up
      ball.CX = ball.CX + .3;
      ball.CX = ball.CX * -1;
    }

  if(ballx>70 && ballx<80 && bally>lpy-38 && bally<lpy+38) {
      bsu();      //ball y speed up
      ball.CX = ball.CX - .3;
      ball.CX = ball.CX * -1;
    }
    
  if(ballx>width || ballx<0) {
    ball.Xpos = 450;
    ball.Ypos = 150;
    ball.CX = 2;
    ball.CY = random(-2,2);
    Rpad.Ypos = 150;
    Lpad.Ypos = 150;
    time = millis() + 2000;
  }
}
  
void bsu() {
  if(ball.CY>0){
    ball.CY = ball.CY + .15;
  }
  else if(ball.CY<0) {
    ball.CY = ball.CY - .15;
  }
}  

void button(float x, float y, String btext, int buttonC){
  rectMode(CENTER);
  textSize(20);
  fill(buttonC);
  rect(x,y,180,80);
  fill(0);
  text(btext, x-35, y+8);
}

class Ball {
  float Xpos,Ypos,Size,CX,CY;
  
  Ball(float xx, float yy, float ss){
    Xpos = xx;
    Ypos = yy;
    Size = ss;
    CX = 2;
    CY = 2;
  }
   Ball(float xx, float yy, float ss, float cx, float cy){
    Xpos = xx;
    Ypos = yy;
    Size = ss;
    CX = cx;
    CY = cy;
  }
  void display() {
    fill(255);
    ellipse(Xpos,Ypos,Size,Size);  
  }
  
  void move() {
    display();
    Xpos = Xpos + CX;
    Ypos = Ypos + CY;
    if((Ypos>height-20)||(Ypos<20)){
       CY=(CY*-1);
   }
  } 
}

class paddle {
  float Xpos,Ypos,H,W;
  paddle(float x, float y) {
    Xpos = x;
    Ypos = y;
    H = 70;
    W = 5;
  }
  paddle(float x, float y, float w, float h) {
    Xpos = x;
    Ypos = y;
    H = h;
    W = w;
  }
  
  void display() {
   fill(255,0,0);
   rectMode(CENTER);
   rect(Xpos,Ypos,W,H,3);
  }
  
  void move(int mode) {
    if(mode == 1) {    
      if(keyPressed) {
        if(keyCode == UP) {
          Ypos = Ypos-2;
        }
        if(keyCode == DOWN) {
          Ypos = Ypos+2;
        }
      }
    }
    if(mode == 2) {
      if(keyPressed) {
        if(key == 'w') {
          Ypos = Ypos-2;
        }
        if(key == 's') {
          Ypos = Ypos+2;
        }
      }
    }
  }
  
  void AI() {
    float BY = ball.Ypos;
    
    if(BY>Ypos){
      Ypos = Ypos + 2;
    }
    else {
      Ypos = Ypos - 2;
    }   
  }
}
