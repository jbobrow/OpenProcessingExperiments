
//Liliana Osorio
//Comp Sci lab_5
//October 5, 2010

int ballCount;
float sprayCount;
float sprayFactor = 1.75;
float[] x;
float[] y;
float[] r;
float[] speedX;
float[] speedY;
color[] cols;
float gravity = .07;



void setup() {
  size(400, 400);
  createBalls(2000);
}

void draw() {
  background(2);
  moveBalls();
  collide();
  
  //Simulated blocks for a fountain
   
   fill(227,220,197);
  rect(0,370,400,50);
  
  fill(200,200);
  rect(0,370,40,50);
  
  fill(200,200);
  rect(80,370,40,50);
  
  fill(200,200);
  rect(160,370,40,50);
  
  fill(200,200);
  rect(240,370,40,50);
  
  fill(200,200);
  rect(320,370,40,50);
  
  
  
}


void moveBalls() {
  for(int i=0; i<sprayCount; i++) {
    fill(cols[i]);
    ellipse(x[i],y[i],r[i]*2,r[i]*2);
    x[i] += speedX[i];
    speedY[i] += gravity;
    y[i] += speedY[i];
    
    
  }
  if (sprayCount<ballCount-sprayFactor) {
    sprayCount += sprayFactor;
  }
}


void createBalls(int count) {
  ballCount = count;
  x = new float[ballCount];
  y = new float[ballCount];
  r = new float[ballCount];
  speedX = new float[ballCount];
  speedY = new float[ballCount];
  cols = new color[ballCount];

  for(int i=0; i<ballCount; i++) {
    x[i] = width/2.0;
    y[i] = 260;
    r[i] = random(1, 2);
    speedX[i] = random(-.5, .5);
    speedY[i] = random(-3, -40);
    //Particles look yellow to represent lights in water
    cols[i] = color(232, 208, random(122));
  }
}

void collide() {
  //changing the speed produces bouncing affect
  for (int i=0; i<ballCount; i++) {
    if (x[i] > width-r[i]) {
      x[i] = width-r[i];
      speedX[i] *= -.4;
    } 
    else if (x[i] < r[i]) {
      x[i] = r[i];
      speedX[i] *= -.4;
    }

    if (y[i] > height-r[i]) {
      y[i] = height-r[i];
      speedY[i] *=-.4;
    
    } 
    else if (y[i] < r[i]) {
      y[i] = r[i];
      speedY[i] *= -.4;
    }
  }
 
}

