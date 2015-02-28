
float ballSize = 10;
int num = 100;    //number of balls
float [] x = new float[num];
float [] y = new float[num];
float [] xSpd = new float[num];
float [] ySpd = new float[num];
float [] ballColorR = new float[num];
float [] ballColorG = new float[num];
float [] ballColorB = new float[num];


void setup() 
{
  size(500, 400);
  fill(255);
  noStroke();
  smooth();

  for (int i = 0; i < num - 1; i++) {
    x[i] = random(10, 490);
    y[i] = random(10, 390);
    xSpd[i] = random(1, 7);
    ySpd[i] = random(1, 7);
    ballColorR[i] = random(20, 255);
    ballColorG[i] = random(20, 255);
    ballColorB[i] = random(20, 255);
  }
}


void draw() {

  background(255); 


  for (int i = 0; i < num - 1; i++) {   
    for (int j = i + 1; j < num; j++) {
      if ( dist(x[i], y[i], x[j], y[j]) <= 10 ) {
        if (xSpd[i] < 0 && xSpd[j] > 0 || xSpd[i] > 0 && xSpd[j] < 0) {
          xSpd[i] *= -1;
          xSpd[j] *= -1;
        }
        if (ySpd[i] < 0 && ySpd[j] > 0 || ySpd[i] > 0 && ySpd[j] < 0) {
          ySpd[i] *= -1;
          ySpd[j] *= -1;
        }
      }
    }
  }


  for (int i = 0; i < num - 1; i++) {
    // adjust the speed
    x[i] += xSpd[i];
    y[i] += ySpd[i];

    // check the walls
    if (y[i] > height-ballSize/2 || y[i] < ballSize/2)
      ySpd[i] = ySpd[i] * -1;

    if (x[i] > width-ballSize/2 || x[i] < ballSize/2)
      xSpd[i] = xSpd[i] * -1;

    fill(ballColorR[i], ballColorG[i], ballColorB[i]);
    ellipse(x[i], y[i], ballSize, ballSize);
  }
}


