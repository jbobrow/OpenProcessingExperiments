
PImage a;

int numberBalls = 800;
float x[] = new float[numberBalls];
float y[] = new float[numberBalls];
float speedX[] = new float[numberBalls];
float speedY[] = new float[numberBalls];
float radius = 25;

float r[] = new float[numberBalls];
float g[] = new float[numberBalls];
float b[] = new float[numberBalls];

void setup() {
  size (456, 595);
  a = loadImage("jar.jpg");
  
   for (int i = 0; i < numberBalls; i++) {
   x[i] = width/2;
   y[i] = height/2;
   speedX[i] = random(5);
   speedY[i] = random(5);
   r[i] = random(255);
   g[i] = random(255);
   b[i] = random(255);
  }
}

//the movement of the ball
void draw() {

  image(a, 0, 0);

  for (int i = 0; i < numberBalls; i++) {

  
    x[i] = speedX[i] + x[i];
    y[i] = speedY[i] + y[i];

    if (x[i] > 370 - radius) {      
      speedX[i] = speedX[i] * -1;
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);     
    }
    else if (x[i] < 100 + radius) {
      speedX[i] = speedX[i] * -1;
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);     
    }

    if (y[i] > 495 - radius) {      
      speedY[i] = speedY[i] * -1;
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255); 
    }
    else if (y[i] < 70 + radius) {      
      speedY[i] = speedY[i] * -1;
      r[i] = random(255);
      g[i] = random(255);
      b[i] = random(255);
      }
        
    noStroke();
    fill(r[i], g[i], b[i], 100);
    ellipse (x[i], y[i], radius*2, radius*2);
  }
}




