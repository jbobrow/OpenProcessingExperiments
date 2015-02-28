
boolean gameStart = false;
int lpx=70;  //left paddle x value - dont change
int lpy=140;  //right paddle y value - does change
int rpx=830; //right paddle x value - dont change
int rpy=140; //right paddle y value - does change

float ballx=450; //ball x value
float bally=150; // ball y value
float ballcx=2; // change of ball x value
float ballcy=2; // change of ball y value

void setup() {
  size(900,300);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  background(0);
  //make the paddles
  
  fill(255,0,0);
  rectMode(CENTER);
  rect(lpx,lpy,5,70,3);
  rect(rpx,rpy,5,70,3);
  
  //make the ball
  fill(255);
  ellipseMode(CENTER);
  ellipse(ballx,bally,20,20);
  
  if(gameStart) {

  
  //make left paddle move
  if(keyPressed){
  if(key == 'w'){
    lpy=(lpy-2);
  }
   if(key == 's'){
    lpy=(lpy+2);
   }
  }
  
  //make right paddle move
  if(keyPressed){
    if(keyCode == UP){
      rpy=(rpy-2);
    }
    if(keyCode == DOWN){
      rpy=(rpy+2);
    }
  }
  
  //make ball move
 ballx=(ballx+ballcx);
 bally=(bally+ballcy);
 
 //make ball bounce off top and bottom
 if((bally>height-20)||(bally<20)){
   ballcy=(ballcy*-1);
 }
  
  //make ball bounce off right paddle
  if(ballx>820 && ballx<830 && bally>rpy-38 && bally<rpy+38){
    ballcx=ballcx+.3;
    ballcx=(ballcx*-1);
  }
  
  //make ball bounce off left paddle
  if(ballx>70 && ballx<80 && bally>lpy-38 && bally<lpy+38){
    ballcx=ballcx-.3;
    ballcx=(ballcx*-1);
    
  }
  
  //resets things when ball goes off screen
  if(ballx>width || ballx<0){
    gameStart = false;
    ballx=450;
    bally=150;
    ballcx=2;
  }
  
  
  
  }

}
void mouseClicked(){
gameStart = !gameStart
}
