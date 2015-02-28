
int numBalls = 100; 

int[] xpos = new int[numBalls];
int[] ypos = new int[numBalls];
float[] xspeed = new float[numBalls];
int[] yspeed = new int[numBalls];
int[] d = new int[numBalls];
float[] weight= new float[numBalls];

int[] gravity=new int[numBalls];


void setup() {

  size(600, 600);
  noFill();

  for (int i = 0; i < numBalls; i++) {
    xpos[i] = int(random(d[i]/2, width-d[i]/2));
    ypos[i] = int(random(d[1]/2, height-d[i]/2));
    xspeed[i] = random(2, 8);
    yspeed[i] = int(random(4, 8));
    d[i] = int(random(10, 80));
    gravity[i] = 3;
  }
}

void draw() {
  background(0);
  stroke(255);

  drawBalls();
  moveBalls();
  bounceBalls();
  for (int i = 0; i < numBalls; i++) {
  yspeed[i]=yspeed[i]+gravity[i];
  xspeed[i]=xspeed[i]*0.95;
  }

  //  for (int i = 0; i < numBalls; i++) {
  //    stroke(int(random(255)),100,100);
  //    ellipse(xpos[i], ypos[i], d[i], d[i]);
  //    
  //  }
}


//draw the ball
void drawBalls() {
  for (int i = 0; i < numBalls; i++) {
    stroke(255);
    ellipse(xpos[i], ypos[i], d[i], d[i]);
  }
}

//movement and direction of the ball
void moveBalls() {
  for (int i = 0; i < numBalls; i++) {
    xpos[i]+=xspeed[i];
    ypos[i]+=yspeed[i]+gravity[i];
  }
}

//make the ball bounce
void bounceBalls() {
  for (int i = 0; i < numBalls; i++) {

    if (ypos[i] > height-d[i]/2) {
      yspeed[i]=-yspeed[i];
      ypos[i]=height-d[1]/2;
    }

    if (ypos[i] <  d[i]/2) {
      yspeed[i]=-yspeed[i];
      ypos[i]=d[1]/2;
    }

    if (xpos[i] < d[i]/2) {
      xspeed[i]=-xspeed[i];
      xpos[i]=d[1]/2;
    }

    if (xpos[i] > width-d[i]/2) {
      xspeed[i]=-xspeed[i];
      xpos[i]=width-d[1]/2;
    }
  }
}

void gravity() {
  for (int i = 0; i < numBalls; i++) {
  gravity[i] = 3;
  }
}
