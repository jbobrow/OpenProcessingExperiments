
int ballnumber=5;
float [] ballx=new float[ballnumber];
float [] bally= new float[ballnumber];
float [] ballSize=new float[ballnumber];
float [] xspeed=new float [ballnumber];
float [] yspeed=new float [ballnumber];

float gravity;

void setup() {
  //noStroke();
  fill(50, 0, 255,30);
  size(500, 500);
  gravity=0.5;
  for (int i=0; i<ballnumber; i++) {
    ballx[i]=random(width);
    bally[i]=random(height);
    ballSize[i]=i+40;
    xspeed[i]=random(-1, 1);
    yspeed[i]=0;
  }
}

void draw() {
  //background(200, 200, 200, 10);

  for (int i=0; i<ballnumber; i++) {
    ellipse(ballx[i], bally[i], ballSize[i], ballSize[i]);
    ballx[i]+=xspeed[i];
    bally[i]+=yspeed[i];
    yspeed[i]+=gravity;
    //this checks the ball does not exit the screen height
    if (bally[i]>height) {
      yspeed[i]=yspeed[i]*-0.7;
      bally[i]=height;
    }
    //this checks that the ball does not exit the screen width
    if (ballx[i]>width || ballx[i]<0) {
      xspeed[i]=xspeed[i]*-0.7;
      if (ballx[i]>width) {
        ballx[i]=width;
      }
      if (ballx[i]<0) {
        ballx[i]=0;
      }
    }
  }
  for (int i=0; i<ballnumber; i++) {
    for (int j=i+1; j<ballnumber; j++) {
      if (dist(ballx[i], bally[i], ballx[j], bally[j])<40) {
        yspeed[i]=yspeed[i]*-0.7;
        xspeed[i]=xspeed[i]*-0.7;
      }
    }
  }
}



