
/* Eulani Labay. Bootcamp 2011. */

int ball_x = 150;
int ball_y = 50;
int ball_w = 50;
int ball_h = 50;
int ball_speed = 6;

void setup () {
  size (300, 300);  
}


void draw() {
  background (255);
  moveBall ();
  checkEdgeOfScreen();
}

void moveBall() { // modify the circle’s position: drop ball
  noStroke ();
  fill (255, 0, 0);
  ellipse (ball_x, ball_y, ball_w, ball_h);
  ball_y = (ball_y + ball_speed);
  }
//  
void checkEdgeOfScreen() { // check to see if the circle needs to bounce off the edge
  ellipse (ball_x, ball_y, ball_w, ball_h);
  ball_y = (ball_y + ball_speed);
  if ((ball_y - ball_h > 300) || ball_y > 300) { 
  ball_speed = ball_speed * -1;
  }
  if ((ball_y + ball_h < 50) || ball_y < 50) { 
  ball_speed = ball_speed * -1;
  }
 
}


