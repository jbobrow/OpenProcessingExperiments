

PImage bg, sprite;
float gravity = 0.98;
float y = 200;
int x = 583+50;
int xtwo = 883+50;
float acceleration = 0;
int gap = 150;
int score = 0;
int time = 1;
float pipe = random(300);
float pipetwo = pipe + random (-200, 200);;
boolean gameover = false;
public void setup(){
  size(583,436);
  frameRate(24);
  textSize(32);
  sprite = loadImage("/Users/Fitzgerald/Downloads/330.png");
  bg = loadImage("/Users/Fitzgerald/Downloads/tebone7_mario-background.jpg");
}
public void draw(){
  clear();
  background(bg);
  fill(0);
  score = time/5;
  text(score, 10, 30); 
  if(!gameover){ 
   x=x-10;
   xtwo=xtwo-10;
   y=y+acceleration;
  acceleration = acceleration+gravity;
  image(sprite, 180, y);
  fill(0,255,0);
  rect(x-50, 0, 50, pipe);
  rect(x-50, pipe+gap, 50, 583-pipe-gap);
  rect(xtwo-50, 0, 50, pipetwo);
  rect(xtwo-50, pipetwo+gap, 50, 583-pipetwo-gap);
  if((180<x-50)&&(x-50<230)) collisionCheck();
  if((180<xtwo-50)&&(xtwo-50<230)) collisionChecktwo();
}else {
  image(sprite, 180, 0);
  text("Game Over", 120, 120); 
}if (y>436)
{
  gameover=true;
}
if(x<0){
  x =  583+50;
  pipe = random(200);
}
if(xtwo<0){
  xtwo = 583+50;
  pipetwo = pipe + random (-300, 300);
  if (pipetwo < gap) pipetwo = gap;
  if (pipetwo > 430-gap) pipetwo = 430-gap;
}
}
public void keyPressed(){
  acceleration = -10;
}
public void collisionCheck(){
  time ++;
  if((y<pipe)||(y>pipe+gap+80)){
  gameover=true;}
}
public void collisionChecktwo(){
  time ++;
  if((y<pipetwo)||(y>pipetwo+gap+80)){
  gameover=true;}
}




