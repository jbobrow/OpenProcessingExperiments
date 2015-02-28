

float ball_w=150;
float ball_x=ball_w/2;
float ball_y=ball_w/2;

float xspeed = random(10);
float yspeed = random(10);
 
void setup () {
  size (600,400);
}
  
  
void draw() {

moveBall(); //modify the circle’s position.

checkEdgeOfScreen(); //check to see if the circle needs to bounce off the edge.
fill(255,0,0);
ellipse(ball_x, ball_y, ball_w, ball_w);

}


void moveBall() {
  
  background(255); 
  ball_x = ball_x + xspeed;
  ball_y = ball_y + yspeed; 
}


void checkEdgeOfScreen() {
  
  if (ball_x > width-ball_w/2) {
    xspeed = xspeed * -1;
   
  }
  else if (ball_x < ball_w/2) {
    xspeed = xspeed * -1;
      
  }
        if (ball_y >height-ball_w/2) {
        yspeed= yspeed *-1;
     
        }
        else if (ball_y < ball_w/2) {
        yspeed=yspeed * -1;
        }

}

   
    



