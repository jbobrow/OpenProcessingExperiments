
//53463247 Young Hiu Ting Assignment4

import ddf.minim.*;
Minim minim;
AudioPlayer bgsound;
AudioSample bell;

int xPos;
int yPos;   //Position of the ball
int xDir=1; //Dirextion of the ball
int score=0; //the score will start from 0
int lives=5; //number of lives you have at the beginning
boolean lost=false;
float poswidth;
float posheight;

void setup(){
  size (400,400); //set the background size
  
  minim = new Minim(this);
  bell = minim.loadSample("desk_bell.mp3"); //load the sound effect file
  bgsound = minim.loadFile("Move Forward.mp3"); //load the background music file
  bgsound.loop(); //loop the background music
  
  smooth();
  poswidth=(int) width;
  posheight = (int) height;
  xPos= (int)random(poswidth); 
  yPos= (int)random(posheight);  //set the position of x and y with random values
  fill(0); //set the color of the ball and the text to be black
  textSize(13); //Set the size of text
}

void draw(){
  background (255); //set white background
  ellipse(xPos, yPos,20,20); //draw the ball
  
  text("score = "+score,10,20); //show the score you have got
  text("lives = "+lives,10,40); //show the lives you still have  
  
  //when the live is smaller or equal to 0, some text will be shown
  if (lives<=0)
  {
    textSize(20);
    textAlign(CENTER); //make the align point of the font to be center
    
    //when the game is over, ask people to click the screen to restart it
    text("Game Over", width/2, 100);
    text("Click to Restart", width/2,130);
    lost=true;
    textSize(13);
  }
}

void mousePressed(){
    bell.trigger();
  if (dist(mouseX, mouseY, xPos, yPos)<=20)
  {
    score=score+1; // when you click the ball, you can get one mark.
    
    //set the position of x and y with random values
    xPos= (int)random(poswidth); 
  yPos= (int)random(posheight);                
  }
  else
  {
    lives=lives-1; //if you click anywhere except the ball, one life will be taken away
  }
  if (lost==true) //If the game is over, reset all variables to initial conditions 
  {
    lives=5;
    score=0;
    xPos= (int)random(poswidth);
    yPos= (int)random(posheight);
    lost=false;
  }
}

