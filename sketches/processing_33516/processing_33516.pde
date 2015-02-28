
int numberBalls = 10;
float centerX[] = new float[numberBalls];
float centerY[] = new float[numberBalls];
float xspeed[] = new float[numberBalls];
float yspeed[] = new float[numberBalls];
float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];

int ballsize = 50;

void setup() {
  size(600, 600);

  //assignment of position of balls
  for (int i = 0; i<numberBalls; i++) {
    centerX[i] = random(50, 550);
    centerY[i] = random(50, 550);

    xspeed[i] = random(10);
    yspeed[i] = random(10);

    r[i]=random(255);
    g[i]=random(255);
    b[i]=random(255);
    fill(r[i], g[i], b[i]);
  }
}

void draw() {
//  background(255,255,255);

  for (int i=0;i<numberBalls;i++) {
    centerX[i]=centerX[i]+xspeed[i];
    centerY[i]=centerY[i]+yspeed[i];

    if (centerX[i] > width - ballsize/2 || centerX[i] < 0 + ballsize/2) {
      xspeed[i] = xspeed[i] *= -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
      fill(r[i], g[i], b[i]);
      background(random(255),random(255),random(255));
    }

    if (centerY[i] > height- ballsize/2 || centerY[i] < 0+ballsize/2) {
      yspeed[i] = yspeed[i] *= -1;
      r[i]=random(255);
      g[i]=random(255);
      b[i]=random(255);
      fill(r[i], g[i], b[i]);
      background(random(255),random(255),random(255));
    }

    fill(r[i], g[i], b[i],100);
    ellipse(centerX[i], centerY[i], ballsize, ballsize);
    noStroke();
  }
}


