
int posX;
int posY;
int speed; //ball step movement on X axis
int speedY; //ball step movement on Y axis
//player
int pLocation; //center of paddle on Y axis
int direP=0; //paddle direction (up/down)
int pHeight=40; //paddle height
int pGoal=50; //player goal area; 50px up and 50px down = total 100px
//cpu paddle
int cpuLocation=0; //top of cpu goal on Y axis
int cpuDirection=4; //step (speed) for cpu goalon Y axis
int cpuHeight=100; //cpu goal height
int cpuScore=0;
int myScore=0;

void setup(){
  
  size (600,400);
  posX=50;
  posY=200;
  noStroke();
  speed= 5;
  speedY = 5;
  smooth();
  background (255);
  //frameRate(60);
  pLocation=height/2;
}

void draw (){
 background (255); //white back
 fill (0);  //black fill
 rect(width/2,0,1,height); //middle line; for some reason line() doesn't work
 
 text(myScore,width/2-20,20);
 text(cpuScore,width/2+10,20);

 rect (0,0,20,height/2-pGoal); // left full black bar 
 rect(0,height/2+pGoal,20,height/2-pGoal); //left (player) white goal area
 rect (width-20,0,20,height); //right (cpu) full black bar
 
fill(255);//white fill
cpuLocation+=cpuDirection; //start cpu goal movement (up/down)
rect (width-20,cpuLocation ,20,cpuHeight); //cpu goal area in white; new position
if (cpuLocation >= height-cpuHeight) {//if new cpu goal position hits top then bounce down
  cpuDirection *=-1;
}
else if ( cpuLocation <= 0) {//from bottom to top
  cpuDirection *=-1;
}

 fill (220); //grey
 ellipse (width/2,height/2,100,100); //center of field
 fill(255);  //white                      
  text(" PONG",width/2-22,height/2+5);
 
 fill(0); //black fill
 ellipse (posX,posY,20,20); //draw new ball
 
 if (posX==25+10){//check if ball hits paddle
   if (posY >= pLocation-22  && posY <= pLocation+22) { 
   speed *=-1;  //it does so bounce back
  } 
 }
 
pLocation+=direP; //when key is pressed then direP changes
//UP = direP = -4 (where 4 is step along Y axis)
//DOWN = direP = +4
//key relased = direP = 0; paddle does not move
rect(25,pLocation-(pHeight/2),5,pHeight);//draw left paddle


if ((posX+10+20)>=width) {//ball hits right side
    //check if ball posY between CPU goal
    if (posY>cpuLocation && posY<cpuLocation+cpuHeight){
      myScore+=1; //yay
      pGoal+=20; //player goal box increases in size
      posX=35; //move ball to player side; direction stays same
      posY=pLocation;// set Y axis location to center of player's paddle
    } else {
    speed *=-1; //ball hits cpu's black bar
    }
  }
  else if (posX-10-20<=0){//ball hits left side
    if (posY>height/2-pGoal && posY<height/2+pGoal){ //check if hit then cpu goal
     cpuScore+=1; //nay
     pGoal-=5; // player goal box sze decreases
     posX=width-30;// move ball to cpu side
     posY=cpuLocation+(cpuHeight/2); //center from cpu goal
    } else {
    speed*= -1; //ball hits player's black bar
    }
  }
if (posY+10>=height) {//ball hits top
  speedY*=-1; 
} else if (posY-10<=0) {//ball hits bottom
  speedY*=-1;
}
  posX+=speed;
  posY+=speedY;
}

void keyPressed(){
if (key == CODED) {
    if (keyCode == UP) {
      direP=-4;
    }
    else if (keyCode == DOWN) {
      direP=4;
    }
  } 
}

void keyReleased(){
  direP=0;
}

