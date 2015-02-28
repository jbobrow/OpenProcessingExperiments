
float ballsize = 45;
Ball[] b = new Ball[1];
int count = 0;


void setup() {
  size(400, 400);
  smooth();
  colorMode(RGB, 130);
  b[0] = new Ball(ballsize, ballsize);
}



void draw() {
  fill(0);           
  rect(0, 0, width, height);
  for (int i=0; i <= count; i++ ) {
    b[i].movement();
  }
}

void mousePressed() {
  count++;
  b = (Ball[]) expand(b, count+1);
  b[count] = new Ball(random(ballsize*5), random(ballsize*5));
}


class Ball {
  float ball_x, ball_y, speed_x, speed_y, ballcolor;
    Ball (float x, float y) {
    ball_x = x;
    ball_y = y;
    speed_x = random(5);
    speed_y = random(5);
    ballcolor = random(500);
  }

  void movement() {
    fill(ballcolor, 100, 100, 40);            
    ellipse(ball_x, ball_y, ballsize, ballsize);

    if (ball_x > (width - ballsize)) {      
      speed_x = speed_x * (-1);
    }

    if (ball_x <= 0) {                   
      speed_x = speed_x * (-1);
    }

    if (ball_y > (height-ballsize)) {      
      speed_y = speed_y * (-1);
    }

    if (ball_y <= 0) {                  
      speed_y = speed_y * (-1);
    }

    ball_x += speed_x;             
    ball_y += speed_y;
  }
}

