
int number_circles=100;
float [] ball_w= new float [number_circles];
float [] ball_x= new float [number_circles];
float []ball_y= new float [number_circles];


float[] xspeed = new float [number_circles];   //random(10);
float[] yspeed = new float [number_circles];   // random(10);

void setup () {
  size (400, 200);
  frameRate(60);
  define();
}




void draw() {
 background(255);  
  for (int i=0;i<number_circles;i++) {
    moveBall(i); //modify the circle’s position.
    checkEdgeOfScreen(i); //check to see if the circle needs to bounce off the edge.
    drawBall(i);
  }
}

void drawBall(int x) {
  smooth();
  noStroke();
  fill(255,0,0);
    ellipse(ball_x[x], ball_y[x], ball_w[x], ball_w[x]);
}

void moveBall(int x) {
  smooth();
    ball_x[x] = ball_x[x] + xspeed[x];
    ball_y[x] = ball_y[x] + yspeed[x];
}

void checkEdgeOfScreen(int x) { 

    if (ball_x[x] > width-ball_w[x]/2) {
      xspeed[x] = xspeed[x]* -1;
    }
    else if (ball_x[x] < ball_w[x]/2) {
      xspeed[x] = xspeed[x] * -1;
    }
    if (ball_y[x] >height-ball_w[x]/2) {
      yspeed[x]= yspeed[x] *-1;
    }
    else if (ball_y[x] < ball_w[x]/2) {
      yspeed[x]=yspeed[x] * -1;
    }
}

void define () {
  for (int i=0;i<number_circles;i++) {
    ball_x[i]=random(40);
    ball_y[i]=random(40);
    ball_w[i]=min(ball_x[i],ball_y[i]);
    xspeed[i]=random(4);
    yspeed[i]=random(4);
  }
}


