
/* Justin Wagner
2.1.2012
First Game

Click the Button as many times in 10 seconds as you can! */

boolean button = false;
int score = 0;
float timer = 0;
int r = 255;
float timerstop = 10.0;

void setup(){
  frameRate(30);
  size(200,200);
  smooth();
  noLoop();
}
void draw(){
  background(255);
  fill(r,0,0);
  rectMode(CORNERS);
  rect(width/4,height/4,width/4+width/2,height/4+height/2);
  if (mousePressed && mousePressed == true){
    r = 150;
  }
  text ("Timer: " + timer, 120, 20);
  timer = frameCount/30;
  text ("Clicks: " + score, 10, 20);
  if (timer > timerstop){
    gameEnder();  
  }
}
void mouseClicked(){
  if (mouseX>=width/4 && mouseX<=width/4+width/2 && mouseY>=height/4 && mouseX<=height/4+height/2){
   button = true;
   score++;
  }
}
void mouseReleased(){
  r = 255;
}
void mousePressed(){
  if (mouseX>=width/4 && mouseX<=width/4+width/2 && mouseY>=height/4 && mouseX<=height/4+height/2 && timer == 0){
    loop();
  }
}
void gameEnder(){
  noLoop();
  fill(0);
  text("You averaged " + (score/timerstop), width/4, 172);
  text("clicks per second!", width/4, 188); 
}


