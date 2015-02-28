
int numCircle = 50;


float [] ballX = new float [numCircle];
float [] ballY = new float [numCircle];
float [] speed1 = new float [numCircle];
float [] speed2 = new float [numCircle];

void setup() {
  size(500, 500); 
  smooth();
  noStroke(); 

  for (int i = 0; i < numCircle; i = i + 1) {
    ballX [i] = random(width);
    ballY [i] = random(height);
    speed1 [i] = random(1, 5);
    speed2 [i] = random(1, 10);
  }
}


void draw() {
  background (0, 0, 255); 
  for (int i = 0; i < numCircle; i = i + 1) {
    ellipse (ballX [i], ballY [i], 25, 50);

    if (ballX [i]>=width || ballX [i]<=0) {
      speed1 [i] = speed1 [i] * (-1);
    }

    if (ballY [i]>=height || ballY [i]<=0) {  
      speed2 [i] = speed2 [i] * (-1);
    }
    ballX [i] = ballX [i] + speed1 [i];
    ballY [i] = ballY [i] + speed2 [i];
  }
}





