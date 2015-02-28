
/*

Daniela Gill
08-11-11
lelagillny@mac.com
copyright 2011
Bootcamp/ Bouncy ball  

*/

float ball_x = 80;
float ball_y = 100;
float xspeed = random (13);
float yspeed = random (13);
int ball_w = 90;
 
void setup(){
  background(#FF9900);
  size(550,550);
}
 
void moveBall(){
  ball_x = ball_x + xspeed;
  ball_y = ball_y + yspeed;
} 
 
void draw() {
  moveBall();
  checkEdgeOfScreen();
  background(#9900CC);
  noStroke();
  ellipse(ball_x, ball_y, ball_w, ball_w);
   
}
 
void checkEdgeOfScreen(){ 
  if (ball_x > width - ball_w/2) {
    xspeed = xspeed * -1;
   
  }
  else if (ball_x < ball_w/2) {
    xspeed = xspeed * -1;
     
  }
 if (ball_y > height- ball_w/2) {
   yspeed= yspeed *-1;
  
  }
  else if (ball_y < ball_w/2) {
   yspeed=yspeed * -1;
    
  }
    
}

