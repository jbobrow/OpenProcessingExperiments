
int ball_x = int(random(400));
int ball_y = int(random(400));
int ball_size = 30;
int num_balls = 50;
int speed = 4;

int [] ball_x_pos = new int [num_balls];
int [] ball_y_pos = new int [num_balls];

int [] ball_x_speed = new int [num_balls];
int [] ball_y_speed = new int[num_balls];



void setup () {
  size (400, 400);
  for (int i=0; i<num_balls; i++){
    ball_x_pos [i] = int(random (width));
  }

  for (int i=0; i<num_balls; i++){
    ball_y_pos [i] = int(random (height));
  }
  
  for (int i=0; i<num_balls; i++){
    ball_x_speed [i] = speed;
  }
  
  for (int i=0; i<num_balls; i++){
    ball_y_speed [i] = speed;
  }

}

void draw () {
  background (154, 75, 208);
  for (int i = 0; i <= 7; i++) {
    drawBall(ball_x_pos[i], ball_y_pos[i]);
    ball_x_pos[i] += ball_x_speed[i];
    ball_y_pos[i] += ball_y_speed[i];
    checkEdgeOfScreen(i);
  }
    
}


void checkEdgeOfScreen (int i_passed_in) {
  if ((ball_x_pos[i_passed_in] - ball_size/2)> width) {
    ball_x_speed[i_passed_in] = ball_x_speed[i_passed_in] * -1;
  }
  if ((ball_x_pos[i_passed_in] - ball_size/2)< 0) {
    ball_x_speed[i_passed_in] = ball_x_speed[i_passed_in] * -1;
  }
  if ((ball_y_pos[i_passed_in] - ball_size/2)> height) {
    ball_y_speed[i_passed_in] = ball_y_speed[i_passed_in] * -1;
  }
 if ((ball_y_pos[i_passed_in] - ball_size/2)< 0) {
    ball_y_speed[i_passed_in] = ball_y_speed[i_passed_in] * -1;
  }
}

void drawBall (int x_cookie, int y_cookie)  
{//whatever variables are in the drawBall ()  
//have to match the variables inside ellips and be in the same format
//as the variables in "drawBall" in the void draw section.
  noStroke();
  fill (256, 256, 256);
  ellipse (x_cookie, y_cookie, ball_size, ball_size);
}

