
//DECLARE
Cannon cannon;
Timer timer;
Target target;
Score score;
PImage img;
PImage instructions;
import ddf.minim.*;
Minim minim;
AudioPlayer player;

//SETUP
void setup(){
  size(700,500);
  //loads the image located in the same file
img=loadImage("deck.jpg");
instructions=loadImage("instructions.jpg");
  background(img);
  
    //INITIALIZE  
    //loads the song located in the same file
  minim= new Minim(this);
  player = minim.loadFile("That XX.wav");
 //plays the song
  player.play();
  
  //creates a new target with the specified location
  target= new Target(0,100,3);
  
   //creates a new cannon with the specified location
  cannon= new Cannon(0,0,350,400);
  
   //creates a new timer with the specified time
  timer= new Timer(30);
  
   //creates a new score with the starting score
  score= new Score(0);
}


//DRAW
void draw(){
  background(img);
  image(instructions,20,20);
  cannon.display();
  cannon.direction();
  target.display();
  target.hit();
  timer.start();
  timer.finish();
  timer.restart();
  score.update();

 
}
class Cannon{
  //VARIABLES 
float ballX; 
float ballY;
float speedX;
float speedY;
float cannon;
float xpos;
float ypos;

  //CONSTRUCTOR
Cannon(int tempXpos,int tempYpos,int tempBallX, int tempBallY){
 xpos=tempXpos;
ypos=tempYpos;
ballX=tempBallX;
ballY=tempBallY;
speedX=0;
speedY=0;

}

  //FUNCTIONS
void display(){
  rectMode(RADIUS);
  ellipseMode(CENTER);
//allows cannonball to move
ballX+=speedX;
ballY+=speedY;
fill(0);
//draws the cannonball
ellipse(ballX,ballY,40,40);
 //A Push Matrix to move cannon in a different location
pushMatrix();
translate(350, 400);
//rotates the cannon
  rotate(cannon); 
 fill(70,66,60); 
 //draws the cannon
  rect(0, 0, 75,30,30,5,5,30);
  popMatrix();
  fill(133,100,14);
  
  rect(350,490,80,9);
  rect(350,450,20,55,15,15,0,0);
}
void direction(){
  //if left key is pressed then cannon moves left 0.05 pixels
  if(keyPressed){
    if(keyCode ==LEFT){
      cannon-=0.05;
}

else if (keyCode == RIGHT) {
      //if right key is pressed then cannon moves right 0.05 pixels
    cannon += 0.05;
  } else if (key == ' ') {
   //creates and draws the cannonball with the location
    ballX = 350;
    ballY = 400; 
    
   
    speedX = 10 * cos(cannon);
    speedY = 10 * sin(cannon);
  }  

}
}
}
class Score{
  //VARIABLES 
int tally;

  //CONSTRUCTOR
Score(int tempScore){
  tally=tempScore;
}
  //FUNCTIONS
void update(){
  //prints the score on the display
  fill(255);
  textSize(20);
   text("Score:"+tally,50,height-50); 
}
}
  
    
class Target{
  //VARIABLES 
float targetX;
float targetY;
float speedX;

  //CONSTRUCTOR
Target(int tempTargetX, int tempTargetY,int tempSpeedX){
  targetX=tempTargetX;
  targetY=tempTargetY;
  speedX=tempSpeedX;
}
  //FUNCTIONS
void display(){
  //drawst the target
   fill(255, 0, 0);
  ellipse(targetX, targetY, 50, 50);
 
  fill(255, 255, 255);
  ellipse(targetX, targetY, 40, 40);

  fill(255, 0, 0);  
  ellipse(targetX, targetY, 30, 30);
  
  fill(255, 255, 255);
  ellipse(targetX, targetY, 20, 20);
  
    fill(0);
  ellipse(targetX, targetY, 5, 5);
  
  //Allows teh target to move
   targetX+=speedX;
  
  //creates the parameters for the target to move left and right
  if(targetX > width || targetX < 0) {
    speedX = -speedX;

  }
   
  
}

void hit(){
  //if the distance between the cannonball and taget is less then 50 than a new target is created
  if(dist(cannon.ballX,cannon.ballY,targetX,targetY)<50){
    targetX= random(700);
    //targetY=random(200);
    //add the score by 1
    score.tally++;
    //plays sound when target is hit
    player = minim.loadFile("explosion.wav");
 
  player.play();
  }
}


}
class Timer{
  //VARIABLES 
  int duration;
  int finish;
 
   //CONSTRUCTOR 
  Timer(int tempDuration){
    duration = tempDuration;
   finish = 0;
   
  }
   //FUNCTIONS 
  void start(){
    //if timer is more than zero 
    if(timer.duration>0){
      //if second if not the same as zero
    if(second()!=finish){
      finish=second();
      //-1 second 
      duration-=1;
    }
    //displays time
    fill(255);
   text("Time:"+duration,width-125,height-50); 
    
  }
  }
  void  finish(){
  if (duration==0) {
    //when time is over prints score 
    background(img);
    textAlign(CENTER);
    text("GAME OVER!", width/2, height/2);
    text("Your score was : "+score.tally, width/2, height/2 + 50);
    text("Click To Play Again ", width/2, height/2 + 100);
    
     
  }
  
  
  }
    
   void restart(){
     //if timer is over and mouse is presesd then a new score, timer, target and cannon is drawn
     if (duration==0&&mousePressed==true) {
       timer= new Timer(30);
       score= new Score(0);
       target= new Target(0,100,3);
       cannon= new Cannon(0,0,400,500);
     }
   }
}


