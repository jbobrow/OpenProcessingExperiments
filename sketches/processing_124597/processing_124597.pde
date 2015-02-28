
//PAPER BALL GAME
//Vaclav Bocek, 2013
//Computational Arts, Project 2, coursera.rog

import ddf.minim.*;    //audio player

float y = 400;        //y position of the ball
float x = 400;        //x position of the ball
float radius = 30;    //radius of the ball
float speedX = 1;      //speed x direction
float speedY = 1;       //speed y direction
int directionX = 1;     //direction way
int directionY = -1;    //direction opposite way
int bumperx;             //bumper       
int bumpery;
int gameStage;        //game part
int totalTime;        //total time at end
int timer;            //seconds passed
int lastSavedTime;    //last saved time
int secondsPassed;


//images, fonts and audio player set up
PImage gameStage1;  
PImage gameStart;
PImage gameOver;
PImage deska;
PImage ball;
PFont font;
Minim minim;
AudioSample defeat;    //game over sound
AudioSample bounce;    //bounce sound

//initialize stuff 
void setup(){
size(600, 599);
smooth ();
noStroke();
ellipseMode (RADIUS);
rectMode(CENTER);


gameStage = 0; //first screen
timer = 0; 
gameStart = loadImage("gameStart.png");      //images and fonts loading
gameOver = loadImage("gameOver.png");
ball = loadImage("ball.png");
gameStage1 = loadImage("gameStage.png");
deska = loadImage("deska.png");
font = loadFont("font_sketch.vlw");
minim = new Minim(this);
defeat = minim.loadSample("defeat.wav");    //sound loading
bounce = minim.loadSample("bounce.wav");    //sound loading


}


//void draw - this part still runs
void draw(){
   
  if (gameStage == 0){   //fist screen
    startGame();
    
  }
   
  if (gameStage == 1){    //second screen
    game();
    
  }
   
  if (gameStage == 2){    //third screen
    gameOver();
  }
  
 
 
}


//time counting and drawing
void clock(){
   
  if (gameStage == 1){  //time couting visibile only in stage 1 - game
  fill(0);  
  timer = 0 + secondsPassed;
  String t = "      " + nf(timer, 2);
  textFont(font, 20);
  text(t, 480, 570);  //text and postition
  }
}

void gameOver(){
  
  imageMode(CORNER);
     
  gameStage = 2; //game over stage
  
  background(255);
  image(gameOver, 0, 0, 600, 599); //background image
      
  totalTime = timer;
  fill(0);
  String tt = "" + totalTime;    //displays your score - time
  textFont(font, 30);
  text(tt, 380, 260);  
  
  
  //clasification of your score
  if (timer <= 8 ){
    text("bad", 250, 330);
  }
  
   if (timer >= 14 && timer <= 20){
    text("gooood", 250, 330);
  }
   if (timer < 14 && timer > 8){
    text("not bad", 250, 330);
  }
  if (timer > 20 && timer < 24){
    text("excelent", 250, 330);
  }

  if (timer > 24 && timer < 30 ){
    text("fantastic", 250, 330);
  }
  
   if (timer > 30 ){
    text("superb", 250, 330);
  }
  
         
}  

//first screen - game start
void startGame(){   
  
 //int changed to default position after game over
  gameStage = 0;
  totalTime = 0;
  timer = 0;
  lastSavedTime = 0;
  secondsPassed = 0;
  x=400;
  y=400;
  
  background (255);
  
  image(gameStart, 0, 0, 600, 599); //background image
  
}

//the actual game 
void game(){
  
imageMode(CORNER);  
gameStage = 1;  
frameRate(300);

 if (millis() - lastSavedTime > 1000){   //time saving
      secondsPassed ++;
      lastSavedTime = millis();
    }
 
background (255);
image(gameStage1, 0, 0, 600, 599);  //background image
imageMode(CENTER); 
image (ball, x, y, radius, radius);  //paper ball image

image (deska, mouseX, 520, bumperx, bumpery);  //bumper image

//bumper dimensions 
bumperx=120; 
bumpery=8;
 
y += speedY*directionY*2*timer/3;    //*timer=speed increasing in time
if (y > height-radius || y < 0+radius ) {directionY = -directionY;   //paper ball bounce y
}
 
x += speedX*directionX*2*timer/3;   //*timer=speed increasing in time
if (x > width-radius || x< 0+radius ) {directionX = -directionX;}  //paper ball bounce x
 
if (y <= 520+bumpery+radius/2 && y>=520-bumpery-radius/2 && (x>mouseX-bumperx/2)  //bumper bounce
&& (x<mouseX+bumperx/2)){
         directionY = -directionY;   
         bounce.trigger();     //bounce sound played
}          
if (y > 550){    //ball fall limit
    gameOver();     //game over screen
    defeat.trigger();  //defeat sound played
  }       
      
  clock();   //timer
 
}


//starting game by mouse click
void mouseClicked(){
   
  if (gameStage == 0){  //first screen > click > game start
    gameStage = 1;
  }
    
  if (gameStage == 2){  //game over screen > click > first screen
    gameStage = 0;
  }
}

 


 


