
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer s1, s2, s3, s4;

//kevin kan game
//Copyright © 2014
//bounce code cited from: "http://processing.org/examples/bounce.html"
//Thanks to "http://www.wavsource.com/" for the .WAV files.

//use arrow keys to control your character.
//dodge the red circles, you can get hit five times.
//reach the yellow dot to win.

boolean timer = false;

int game;
int score;
color collision = color(255,0,0);
color yellow = color(255,255,100);
int win;

//player
float deltaX, deltaY;
float x, y;

//bounce
int rad = 40;

//dodge1
float xpos, ypos;
float xspeed = 3;
float yspeed = 3;
int xdirection = 1;
int ydirection = 4;

//dodge2
float xpos2, ypos2;
float xspeed2 = 3;
float yspeed2 = 3;
int xdirection2 = -1;
int ydirection2 = -4;

//dodge3
float x1, y1;
float dy;

void setup (){
  size(500,500);
  textSize(10);
  textAlign(CENTER);
  
  //starting position of bounce
  xpos = width/2;
  ypos = height/2;
  xpos2 = width/2;
  ypos2 = height/2;
  y1=0;
  
  minim = new Minim(this);
  s2 = minim.loadFile("dog_bark_x.wav");
  s4 = minim.loadFile("coyote_howl.wav");
  s1 = minim.loadFile("chicken6.wav");
  s3 = minim.loadFile("cat_meow_x.wav");
  
}

void draw(){
  if(game==0){
    startScreen();
    score=0;
  }
  if (game == 1){
    playGame();
  }
  if (score==5){
    loseScreen();
    s1.play( );
    s1.rewind( );
  }
  else if (win==1){
    winScreen();
    s2.play( );
    s2.rewind( );
  }
}

void winScreen(){
  fill(0,0,0);
  rect(0,0,width, height);
  fill(0,255,0);
  textAlign(CENTER);
  text("You Win!", width/2, height/2-.1*height);
  text("You won on attempt:" +score, width/2, height/2);
  text("Time Elapsed: "+millis()/1000+" seconds", width/2, height/2-.05*height);
  
  //Level
  if(score==0 && millis()/1000<5){
    text("Level: Adept", width/2, height/2-.15*height);
  }
  if(score==0 && millis()/1000<10 && millis()/1000>5){
    text("Level: Skillful", width/2, height/2-.15*height);
  }
  if(score==0 && millis()/1000<25 && millis()/1000>10){
    text("Level: Slowpoke", width/2, height/2-.15*height);
  }
  if(score==0 && millis()/1000>25){
    text("Level: Turtle", width/2, height/2-.15*height);
  }
  //1 hit
  if(score==1 && millis()/1000>10){
    text("Level: One Hit Wonder", width/2, height/2-.15*height);
  }
  if(score==1 && millis()/1000<10){
    text("Level: Second Try", width/2, height/2-.15*height);
    //2 hit
  }
  if(score==2 && millis()/1000>10){
    text("Level: Two Hit Wonder", width/2, height/2-.15*height);
  }
  if(score==2 && millis()/1000<10){
    text("Level: Third Try", width/2, height/2-.15*height);    
  }
      //3 hit
  if(score==3 && millis()/1000>10){
    text("Level: Three Hit Wonder", width/2, height/2-.15*height);
  }
  if(score==3 && millis()/1000<10){
    text("Level: Fourth Try's the Charm", width/2, height/2-.15*height);    
  }
      //4 hit
  if(score==4 && millis()/1000>10){
    text("Level: Berzerker", width/2, height/2-.15*height);
  }
  if(score==4 && millis()/1000<10){
    text("Level: Just Barely", width/2, height/2-.15*height);    
  }
  }
  
void loseScreen(){
  fill(0,0,0);
  rect(0,0,width, height);
  fill(255,0,0);
  textAlign(CENTER);
  text("You Lose", width/2, height/2-.1*height);
  text("Press [ENTER] to retry.", width/2, height/2 -.05*height);
  
}
  
void startScreen(){
  fill(0,0,0);
  rect(0,0,width, height);
  fill(255,255,255);
  textAlign(CENTER);
  text("Use arrow keys to move.", width/2, height/2-.1*height);
  text("Avoid the red balls.", width/2, height/2 -.05*height);
  text("reach the yellow dot.", width/2, height/2);
  text("You have five attempts.", width/2, height/2+.05*height);
  
  text("Press [ENTER] to begin.", width/2, height/2+ .2*height);
  
}

void playGame(){
  grid();
  winNode();
  drawPlayer();
  dodge();
  dodge2();
  dodge3();
  timeElapsed();
  scoreCard();
  checkCollision();
  winCheck();
}

void winCheck(){
  if (x==width-25 && y==height-25){
    win = 1;
    timer = true;
    if (timer=true){
    noLoop();
  }
  }
}

void grid()
{
  fill (0,0,0);
  rect(0,0,500, 500);
  stroke(100,100,100);
  
  //vertical
  int v = 0;
  while (v < width)
  {
  line(v, 0, v, height);
  v = v + 25;
  }
  
  //horizontal
  int h = 0;
  while (h < height)
  {
  line(0, h, width, h);
  h = h + 25;
  }
  
}

void drawPlayer(){
  x = 25 + deltaX;
  y = 25 + deltaY;
  noStroke();
  fill(yellow);
  ellipse(x,y,10,10); 
}

void checkCollision(){
  if (xpos+rad/2>x && x>xpos-rad/2 && ypos-rad/2<y && y<ypos+rad/2){
    s3.play( );
    s3.rewind( );
    deltaX=0;
    deltaY=0;
    score=score+1;
  }
  if (xpos2+rad/2>x && x>xpos2-rad/2 && ypos2-rad/2<y && y<ypos2+rad/2){
    s3.play( );
    s3.rewind( );
    deltaX=0;
    deltaY=0;
    score=score+1;
  }
  if (x1+rad/2>x && x>x1-rad/2){
    if (y1+rad/2>y && y1-rad/2<y){
      s3.play( );
    s3.rewind( );
      deltaX=0;
      deltaY=0;
      score=score+1;
    }
  }
}
 


void keyPressed(){
  //START
  if (keyCode==ENTER && game == 0){
    game=1;
    s4.play( );
    s4.rewind( );
  }
  
  //RETRY
  if (keyCode==ENTER && score == 5){
    score=0;
    game=1;
    s4.play( );
    s4.rewind( ); 
  }
    
  
  //CONTROLS
  if (keyCode == RIGHT && x<width-25)
  {
    deltaX = deltaX+25;
  }
  if (keyCode == LEFT && x>25)
  {
    deltaX = deltaX-25;
  }
  if (keyCode == DOWN && y< height-25)
  {
    deltaY = deltaY+25;
  }
  if (keyCode == UP && y>25)
  {
    deltaY = deltaY-25;
  }
}

void winNode(){
  noStroke();
  fill(255,255,255);
  ellipse(width-25,height-25, 10,10);
}

void timeElapsed(){
  fill(255,255,255);
  text("Time Elapsed: "+millis()/1000, width/2, 16);
  }

void scoreCard(){
  text("attempt: "+score, width/2, height-16);
}
  
void dodge(){
  xpos = xpos + (xspeed*xdirection);
  ypos = ypos + (yspeed*ydirection);
 if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-rad || ypos < rad) {
    ydirection *= -1;
  }

  // Draw the shape
  fill(collision);
  ellipse(xpos, ypos, rad, rad);
}

void dodge2(){
  xpos2 = xpos2 + (xspeed2*xdirection2);
  ypos2 = ypos2 + (yspeed2*ydirection2);
 if (xpos2 > width-rad || xpos2 < rad) {
    xdirection2 *= -1;
  }
  if (ypos2 > height-rad || ypos2 < rad) {
    ydirection2 *= -1;
  }
   // Draw the shape
  fill(collision);
  ellipse(xpos2, ypos2, rad, rad);
}
  
void dodge3(){
  dy=5;
  
  if(y1<height+rad/2){
  y1=y1+dy;
  }
  if(y1 == height+rad/2){
    y1 = 0-rad/2;
  }
  x1=width/2;
  // Draw the shape
  fill(collision);
  ellipse(x1, y1, rad, rad);
}






