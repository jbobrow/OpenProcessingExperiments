
int x = 100;
int y = 100;
int xSpeed = 2;
int ySpeed = 1;
 
int xDir =1;
int yDir =1;
  
int score = 0;
int level = 1;
 
float pStart;
float pEnd;
  
String GameOver;
PImage img;
import ddf.minim.*;
 
void setup() {
 
  size(600, 600);
  rectMode(CENTER);
  img = loadImage("mickey.jpg");
  Minim minim = new Minim(this);
  AudioPlayer player = minim.loadFile("Sequence 01.mp3");
  player.play();  // or .loop();
}
 
 
void draw() {
 
  background(0, 0, 0);
      image(img, 0, 0);
 
  noStroke();
  ellipse(x, y, 50, 50);
  ellipse(x-25, y-25, 35, 35);
  ellipse(x+25, y-25, 35, 35);
  text("score: "+ score, 10, 50);
  text("level: "+ level, 10, 70);
  text("Press 'h' to play harder and press 'e' to play easier",160,50);
  text("Click your mouse to stabilize the ball",160,70);
  rect( mouseX, height-30, 100, 30);
  fill(50,50,50);
   
  
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
    xDir*=-1;
  }
  
  if (x<0) {
    xDir*=-1;
  }
  
  if (y<0) {
    yDir*=-1;
  }
  
  // Paddle
  
  
  pStart = mouseX - 37.5;
  pEnd = mouseX + 37.5;
  
 
  if (y >= height-60
  
    && pStart < x
  
    && pEnd > x) {
  
    yDir*=-1;
  }
  
  if (y> height) {
  
    String s = "Game Over";
    text(s,280,300);
    yDir=0;
    xDir=0;
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
  }
  


