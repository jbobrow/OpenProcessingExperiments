
/*
Jennifer Kaye
 jenniferkaye7@gmail.com
 Copyright 2011
 Parsons MFA D+T Bootcamp
 Homework 8/11/11: Fun with Functions!
 */

int ball_x = 35;
int ball_y = 100;
int ball_w = 70;
int ball_speed = 3;

void setup () {
  size (300, 300);
  frameRate (30);
}

void moveBall () {
 ball_x = ball_x + ball_speed;
  
}

void checkEdgeOfScreen (){
    if ((ball_x + 35 > width) || (ball_x < 35)) {
   ball_speed = ball_speed * -1;
  } 
}



void draw() {
background (68, 31, 81);
  
moveBall(); //modify the circle’s position.

checkEdgeOfScreen(); //check to see if the circle needs to bounce off the edge.

fill (209, 70, 188);
noStroke ();
ellipse(ball_x, ball_y, ball_w, ball_w);

}

