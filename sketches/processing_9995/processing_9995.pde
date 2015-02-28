
/**
breakout clone controlled by the mouse
use mouse to move left/right
and mouseclick to start
@ author Robert Oehler
@ version 1.0
*/
int playerx,playerLife=3,score,weiss =255,startG=0;
int counter,rowCounterOrange,rowCounterRed;
float ballx, bally = 665;
float ballDirectionX, ballDirectionY;
int ballspeed = floor(abs(ballDirectionY)-2);
final int rows = 10;
final int colm = 10;
int[][] allMyBricks=new int[rows][colm];
boolean[][] filledBricks=new boolean[rows][colm];
import ddf.minim.*;
AudioSample klong,lost,start,end;
Minim minim;
PFont amType,term,ingame;

void setup() {
  size(900, 700);
  frameRate(60);
  stroke(0,50);
  smooth();
  mousePressed();
  for(int i=0;i<rows;i++){    //set all Bricks true, i.e. visible
    for(int j=0;j<colm;j++){
      filledBricks[i][j]=true;   
    }
  } 
  minim= new Minim(this);
  klong = minim.loadSample("klong.mp3");
  lost = minim.loadSample("gameover.mp3");
  end = minim.loadSample("end.mp3");
  start = minim.loadSample("start.mp3");
  amType=loadFont("AmazObitaemOstrovV.2-24.vlw");
  term =loadFont("Term.vlw");
  ingame =loadFont("Astronaut.vlw");
  start.trigger();
  textAlign(CENTER);
}

void draw() {
  background(0);
  collision(-55,-40);    //different paddle(100px) collision zones
  collision(-39,-15);    //from -55 to 55 with a little bonus;-)
  collision(-15,15);     //hence avoiding bad angles
  collision(16,39);
  collision(40,55);
  int ballspeed = floor(abs(ballDirectionY)-2);
  if (score==400){           //if not special cases, draw!
    textAlign(CENTER);      // won case
    textSize(50);
    fill(255);
    text(" You Won! Great! ",width/2,350); 
    end.trigger();
    bally=750;
    noLoop();
  }
  if (playerLife<=0){          //lost case
    textAlign(CENTER);
    textSize(36);
    fill(255);
    text(" Game Over ! ",width/2,450);
    text(" Try Again ! ",width/2,480);
    noLoop();
    bally=750;
    lost.trigger();
    fill(weiss);
  }
  if(startG==0){       //start screen
    textFont(term);
    text("BREAKOUT",width/2,350);
    textFont(amType);
    textSize(24);
    text("use mouse to move the paddle",width/2,390);
    text("Press mouse button to start",width/2,420);
    textFont(term);
    textSize(16);
    text("developed by Robert Oehler",width/2,680);
    if (mousePressed && (mouseButton == LEFT)){
      startG++;
    }
  }  
  else {   //finally: draw!
    fillAllMyBricks();
    fill(weiss);
    drawBall(ballx,bally); 
    moveBall();
    killBricks();
    textFont(ingame);
    textAlign(LEFT);
    text("Speed : "+ ballspeed,5,65);
    text("Score : " + score + " ",5,30);
    text("Lifes : " + playerLife+ "",800,30); 
    drawPlayer(mouseX);
  }

  if (ballDirectionY==0){  //ball follows paddle until released
    ballx=mouseX;
  }
  if (bally>720){          //life lost
    restart();
  }
}

void drawPlayer(int playerx) {     //paddle
  fill(161,161,161);
  rectMode(CENTER);
  rect (playerx, 680, 100, 10); 
}

void drawBall(float ballx,float bally) {   //ball
  ellipse(this.ballx,this.bally, 20, 20); 
}

void moveBall(){     //ball speed increasing and wall deflection
  ballx += ballDirectionX;
  bally += ballDirectionY;
  if (counter==4){        //4th Brick speed increase
    ballDirectionY*=1.003;
  }
  if (counter==12){         //12th
    ballDirectionY*=1.003;
  }
  if (rowCounterOrange==1){  //orange brick hit increasion  
    ballDirectionY*=1.003;
  } 
  if (rowCounterRed==1){     //red brick hit incresion
    ballDirectionY*=1.003;
  } 
  if (ballDirectionY>=10){       // speed limit
    ballDirectionY-=1;     //sorry, I liked this more than
  }                        // your normalization
  if (ballx <=10||ballx>=890){   // X deflection
    ballDirectionX*=-1;
    klong.trigger();
  }
  if (bally<=5){                 // Y deflection
    ballDirectionY*=-1;
    klong.trigger();
  }
}
void fillAllMyBricks(){       //color filling
  for(int i=0;i<rows;i++){
    for(int j=0;j<colm;j++){
      allMyBricks[i][j]=i+j;
      if (j>=0&&j<3){           // some nice pale colors
        fill(240,29,71);        //red
      }   
      if (j>=3&&j<5){
        fill(255,166,29);      //orange
      } 
      if (j>=5&&j<7){
        fill(129,350,192);     //green
      }  
      if (j>=7&&j<=9){
        fill(227,218,114);     //yellow
      }
      int x =i*89+50;
      int y =j*25+150;
      //fill when true, 'disappear' if false
      if (filledBricks[i][j]){
        rectMode(CENTER);
        rect (x,y, 90, 25); 
      }
    }
  }
}
//kill bricks if hit, count hits for speed increase,count score
void killBricks(){
  for(int i=0;i<rows;i++){
    for(int j=0;j<colm;j++){
      int x =i*89+50;           //brick positions
      int y =j*25+150;
      if((ballx-x<=50&&ballx-x>=-50)&&(bally-y<=12&&bally-y>=-12)){
        if (filledBricks[i][j]){
          ballDirectionY*=-1;
          filledBricks[i][j]=false; //turn 'off' bricks
          counter++;    //counter for brickhits
          if (rowCounterRed!=0){
            rowCounterRed++;
          }
          if (rowCounterOrange!=0){
            rowCounterOrange++;
          }
          if (j>=0&&j<3){         //red rows count 7
            score+=7;
            rowCounterRed++;      //red brick was hit
          }    
          if (j>=3&&j<5){         //orange rows count 5
            score+=5; 
            rowCounterOrange++;   //orange brick was hit
          }  
          if (j>=5&&j<7){
            score+=3;             //green rows count 3
          }  
          if (j>=7&&j<=9){
            score+=1;             //yellow rows count 1
          } 
          klong.trigger(); 
        }
      }
    }
  }
}   
void collision(int x, int y){
  float dist1 = ballx-mouseX;
  float dist2 = sqrt(bally);
  if ((dist2>=25.79&&dist2<=25.99)&&(dist1>=x)&&(dist1<=y)) {
    if (dist1<-40){           //different cases for ball return
      ballDirectionY*=  -1; //depending where the paddle hits the ball
      ballDirectionX =  -2;
    } 
    if (dist1>=-40&&dist1<=-15){
      ballDirectionY*=  -1; 
      ballDirectionX =  -1;
    }
    if (dist1>-15&&dist1<15){
      ballDirectionY*=  -1; 
      ballDirectionX =   0;
    }
    if (dist1>=15&&dist1<40){
      ballDirectionY*=  -1; 
      ballDirectionX =   1;
    }
    if (dist1>=40){
      ballDirectionY*=  -1; 
      ballDirectionX =   2;
    }
  }
} 
void restart(){     //reset after lost life
  playerLife--;
  delay(1500);
  bally=665;
  ballx=mouseX;
  ballDirectionY=0;
  ballDirectionX=0;
  counter=0;
  rowCounterOrange=0;
  rowCounterRed=0;
}
//start turn with left mouseclick
void mousePressed() {
  if (ballDirectionY==0&&mouseButton == LEFT) {
    ballDirectionY=-3;
  }
}


