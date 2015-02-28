
import netscape.javascript.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioSample sSound;

int numberOfBalls = 200;
float[] xCenter;
float[] yCenter;
float[] xSpeed;
float[] ySpeed;
color[] cols;
float[] radius;

int hit = 0;
int miss = 0;

int GAME_READY = 0;
int GAME_RUNNING = 1;
int GAME_OVER = 2;
int GAME_CLEAR = 3;

int currentState;
PFont font; 

void setup(){
  size(400,400);
  smooth();
  colorMode(HSB,359,99,99);
  font = loadFont("SybilGreen-48.vlw");
  textFont(font,48);
  currentState = GAME_READY;
  minim = new Minim(this);
  sSound = minim.loadSample("score.wav");
  player = minim.loadFile("sigma27.mp3");
  xCenter = new float[numberOfBalls];
  yCenter = new float[numberOfBalls];
  xSpeed = new float[numberOfBalls];
  ySpeed = new float[numberOfBalls];
  cols = new color[numberOfBalls];
  radius = new float[numberOfBalls];
  
  for(int i=0;i<numberOfBalls;i++){
    xCenter[i] = random(radius[i],width-radius[i]);
    yCenter[i] = -random(radius[i],2*radius[i]+12000);
    xSpeed[i] = random(-0.2,0.2);
    ySpeed[i] = random(6.0,7.0);
    cols[i] = color(random(360),random(80,100),random(80,100));
    radius[i] = random(10,30);
  }
}
    
void showScore(){
  textFont(font);
  stroke(0);
  fill(0);
  text(hit+"HIT",30,height-20);
}

void showGameOver(){
  fill(0);  
  textFont(font);
  textAlign(CENTER);
  text("Game Over ...",width/2,height/2);
}
  
void showGameClear(){
  fill(352,98,98);
  textAlign(CENTER);
  textSize(48);
  text("Game Clear!!",width/2,height/2);
  fill(334,97,99);
  textSize(32);
  text("Congratulation!!",width/2,height/2+130);
}
  
void showContinue(){
  String con = "Continue";
  textSize(24);
  if(isOnContinue(mouseX,mouseY)){
    fill(55,91,94);
   }else{
    fill(0,0,99);
   }
  stroke(0); 
  rect(width/2-60,height/2+40-22,textWidth(con),24);
  textAlign(LEFT);
  fill(0);
  text(con,width/2-60,height/2+40);
}

void whiteShelter(){
  noStroke();
  fill(0,0,99,90);
  rect(0,0,width,height);
}

boolean inDisk(float x,float y,float xC,float yC,float r){
  float d = dist(x,y,xC,yC);
  if(d <= r && r > 25){
    return true;
  }else{
    return false;
  }
}

boolean isOnContinue(int x,int y){
   String con = "Continue";
  if((width/2-60 <= x && x < width/2-60 + textWidth(con)) 
      && (height/2+40-22 <= y && y < height/2+40-22 + 24)){
        return true;
      }else{
        return false;
      }
}

void showStart(){
  fill(0);
  textAlign(CENTER);
  textFont(font,24);
  text("Please press any button",width/2,height/2);
}

void subSystem(){
  textAlign(CORNER);
  fill(299,90,85);
   if(player.isPlaying() == false){
       player.loop();
     }
     if(hit >=10 && hit < 20){
       text("Great!!",15,height-65);
     }else if(hit >= 20){
       text("Excellent!!",15,height-65);
     }
}
  
void draw(){
  background(348,25,99);
    for(int i=0;i<numberOfBalls;i++){
      if(xCenter[i]-xSpeed[i] > width && yCenter[i]-ySpeed[i] > height){
      xCenter[i] = random(radius[i],width-radius[i]);
      yCenter[i] = -random(radius[i],2*radius[i]);
    } 
    xCenter[i] += xSpeed[i];
    yCenter[i] += ySpeed[i];
    stroke(cols[i]);
    fill(cols[i]);
    ellipse(xCenter[i],yCenter[i],2*radius[i],2*radius[i]);
    if((inDisk(mouseX,mouseY,xCenter[i],yCenter[i],radius[i]) && mousePressed == false
        || !(inDisk(mouseX,mouseY,xCenter[i],yCenter[i],radius[i] ))) && radius[i] > 25){
      stroke(0);
      fill(0);
      ellipse(xCenter[i]+10,yCenter[i]-5,5,5);//左目
      ellipse(xCenter[i]-10,yCenter[i]-5,5,5);//右目
      line(xCenter[i]-5,yCenter[i]+10,xCenter[i]+5,yCenter[i]+10);//口
    }
  }

  if(currentState == GAME_READY){
    whiteShelter();
    showStart();
  }else if(currentState == GAME_RUNNING){
    subSystem();
    showScore();
  }else if(currentState == GAME_OVER){
    whiteShelter();
    showGameOver();
    showContinue();
    if(isOnContinue(mouseX,mouseY) && mousePressed){
      currentState = GAME_RUNNING;   
  }
  }else if(currentState == GAME_CLEAR){
    whiteShelter();
    showGameClear();
    showContinue();
    if(isOnContinue(mouseX,mouseY) && mousePressed){
      currentState = GAME_RUNNING;
  }
 }
}





void keyPressed(){
  if(currentState == GAME_READY){
    currentState = GAME_RUNNING;
  }
}

void mousePressed(){
  boolean flag;
  if(currentState == GAME_RUNNING){
    flag = false;
    for(int i=0;i<numberOfBalls;i++){
      if(inDisk(mouseX,mouseY,xCenter[i],yCenter[i],radius[i]) && radius[i] > 25){
        flag = true;
        stroke(0);
        fill(0);
        line(xCenter[i]-15,yCenter[i]-10,xCenter[i]-8,yCenter[i]-5);//左目
        line(xCenter[i]-15,yCenter[i],xCenter[i]-8,yCenter[i]-5);
        line(xCenter[i]+15,yCenter[i]-10,xCenter[i]+8,yCenter[i]-5);//右目
        line(xCenter[i]+15,yCenter[i],xCenter[i]+8,yCenter[i]-5);
        fill(320,99,99);
        ellipse(xCenter[i],yCenter[i]+15,23,10);
        sSound.trigger();
      }
    }
    if(flag){
      hit ++;
      if(hit == 30){
        currentState = GAME_CLEAR;
        hit = 0;
        miss = 0;
      }
    }else{
      miss++;
      if(miss == 5){
        hit = 0;
        miss = 0;
        currentState = GAME_OVER;
      }
    }
  }
}

void stop(){
  player.close();
  sSound.close();
  minim.stop();
  super.stop();
}
