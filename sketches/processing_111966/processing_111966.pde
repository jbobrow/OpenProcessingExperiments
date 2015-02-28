
int x = 100;
int y = 100;
int xSpeed = 2;
int ySpeed = 1;
int rect_x = 0;
 
int xDir =1;
int yDir =1;
  
int score = 0;
int level = 1;
 
float pStart;
float pEnd;
  
String GameOver;
PImage img;
import ddf.minim.*;

int GameFlow = 0;

Minim minim;
AudioSample bounce;
AudioPlayer bgsound;
AudioSample dead;
 
void setup() {

x = 100;
y = 100;
xSpeed = 2;
ySpeed = 1;
 
xDir =1;
yDir =1;
  
score = 0;
level = 1;
GameFlow = 1;
 
  size(600, 600);
  rectMode(CENTER);
  img = loadImage("mickey.jpg");
  
  minim = new Minim(this);
  bounce = minim.loadSample("do.mp3");
  bgsound = minim.loadFile("Sequence 01.mp3");
  dead = minim.loadSample("dead.mp3");
  bgsound.loop();
}
 
 
void draw() {
 if (GameFlow == 1){
   
  background(0, 0, 0);
      image(img, 0, 0);
 
  noStroke();
  ellipse(x, y, 50, 50);
  ellipse(x-25, y-25, 35, 35);
  ellipse(x+25, y-25, 35, 35);
  textSize(20);
  text("Score: "+ score, 10, 50);
  text("Level: "+ level, 10, 70);
  textSize(20);
  text("Press 'h' to play harder",160,50);
  text("Press 'e' to play easier",160,70);
  text("Click your mouse to stabilize the ball",160,90);
  fill(250,0,0);
  textSize(20);
  text("Don't let Mickey ",40,180);
  text("falling down!!!",40,205);
  
  fill(50,50,50);
  if(y>height){
    rect_x = rect_x;
  }
  else
  {
    rect_x = mouseX;
  }
  rect( rect_x, height-30, 100, 30);
  
 //score
  if (y < height-30) {
    score = score + 1;
  }
 
 
  
 //level
  
   if (ySpeed == 1){
   level = level;
  }
   if (ySpeed == 2){
   level = 2;
  }
  if (ySpeed == 4){
   level = 3;
  }
  if (ySpeed == 8){
   level = 4;
  }
  if (ySpeed == 16){
   level = 5;
  }
  if (ySpeed == 32){
   level = 6;
  }
   
  
   
  // ball
  
  x= x + (xSpeed * xDir);
  y= y + (ySpeed * yDir);
  
  if (x>width) {
    bounce.trigger();
    xDir*=-1;
  }
  
  if (x<0) {
    bounce.trigger();
    xDir*=-1;
  }
  
  if (y<0) {
    bounce.trigger();
    yDir*=-1;
  }
  
  // Paddle
  
  
  pStart = mouseX - 37.5;
  pEnd = mouseX + 37.5;
  
 
  if (y >= height-60
  
    && pStart < x
  
    && pEnd > x) {
      bounce.trigger();
  
    yDir*=-1;
  }
  
  if (y> height) {
  
    String s = "Game Over";
    img = loadImage("dead-mickey-mouse.jpg");
    textSize(40);
    text(s,200,300);
    textSize(20);
    text("Press 'r' to replay the game",173,330);
    img = loadImage("dead-mickey-mouse.jpg");
    yDir=0;
    xDir=0;
    GameFlow = 0;
  }
  if(GameFlow == 0){
    dead.trigger();
  }
    
  }
}
 
 
 
void mousePressed (){
    xSpeed = xSpeed * -1;
          
  }
     
  void keyPressed (){
    if (key == 'h'){
      xSpeed = xSpeed * 2;
      ySpeed = ySpeed * 2;
    }
         
     if (key == 'e') {
       xSpeed = xSpeed / 2;
       ySpeed = ySpeed / 2;
     } 
     if(key == 'r' && GameFlow==0){
       GameFlow = 1;
       bgsound.pause();
       //dead.pause();
       setup();
     }
  }
  


