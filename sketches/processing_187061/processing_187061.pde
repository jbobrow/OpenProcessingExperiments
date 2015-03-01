
int ball_x = 350;
int ball_y = 350;
int ball2_x = 250;
int ball2_y = 450;
int ball_speed_x = -1;
int ball_speed_y = -5;
int circle_x = 30;
int circle_y = 30;
float pink = 0;
float pink_add = .2;
float blue = 255;
float blue_add = -.2;
int wall = 200;

void setup () {
  size (700, 700);
  background(0);
}

void draw () {
  ball_x = ball_x + ball_speed_x;
  ball_y = ball_y + ball_speed_y;
  ball2_x = ball2_x + ball_speed_x;
  ball2_y = ball2_y + ball_speed_y;
  pink = pink + pink_add;
  blue = blue + blue_add;
  strokeWeight(.5);
  stroke(255, pink, blue);
  line( ball_x, ball_y, 700, 0);
  stroke(255, pink, blue);
  line( ball_x, ball_y, 0, 700);
  stroke(255, pink, blue);
  line( ball_x, ball_y, 0, 0);
  stroke(255, pink, blue);
  line( ball_x, ball_y, 700, 700);
  stroke(232, pink, blue);
  line( ball_x, ball_y, 0, 350);
  stroke(206, pink, blue);
  line( ball_x, ball_y, 350, 0);
  stroke(206, pink, blue);
  line( ball_x, ball_y, 700, 350);
  stroke(206, pink, blue);
  line( ball_x, ball_y, 350, 700);


  if (ball_y-10 < wall) {
    ball_speed_y = 1;
  }
  if (ball_y+10 > height-wall) {
    ball_speed_y = -2;
  }
  if (ball_x-10 < wall) {
    ball_speed_x = 10;
  }
  if (ball_x+10 > width-wall) {
    ball_speed_x = -1;
  }
  if (ball_x < width/2) { //////top left section 
    if (ball_y < height/2) {
      stroke(105, 0, 235);
    }
  }
  if (ball_x > width/2) { //////bottom right section 
    if (ball_y > height/2) {
      stroke(0, 181, 0);
      strokeWeight(2.9);
    }
  }
  if (ball_x < width/2) { //////bottom left section 
    if (ball_y > height/2) {
      stroke(255, 181, 235);
      strokeWeight(.9);
    }
  }
  if (ball_x > width/2) { //////top right section 
    if (ball_y < height/2) {
      stroke(105, 181, 235);
      strokeWeight(.1);
    }
  }
  if (ball_y-10 < wall) {
    ball_speed_y = 1;
  }
  if (ball_y+10 > height-wall) {
    ball_speed_y = -2;
  }
  if (ball_x-10 < wall) {
    ball_speed_x = 10;
  }
  if (ball_x+10 > width-wall) {
    ball_speed_x = -1;
  }


  if (ball2_x < width/2) { //////top left section 
    if (ball2_y < height/2) {
      stroke(105, 0, 235);
    }
  }
  if (ball2_x > width/2) { //////bottom right section 
    if (ball2_y > height/2) {
      stroke(0, 181, 0);
      strokeWeight(2.9);
    }
  }
  if (ball2_x < width/2) { //////bottom left section 
    if (ball2_y > height/2) {
      stroke(255, 181, 235);
      strokeWeight(.9);
    }
  }
  if (ball2_x > width/2) { //////top right section 
    if (ball2_y < height/2) {
      stroke(105, 181, 235);
      strokeWeight(.1);
    }
  }
}

