
PImage img;

int numberOfBalls = 20;

float[] x = new float[numberOfBalls];
float[] y = new float[numberOfBalls];
float[] speedX = new float[numberOfBalls];
float[] speedY = new float[numberOfBalls];

float gravity = 0.85;
float diameter = 40;
float border = diameter / 2;


void setup() {
  size(1000, 600);
  smooth();
  for (int init = 0; init < numberOfBalls; init++) { //makes each ball start at random locations and at random speeds
    x[init] = random(border, width-border);
    y[init] = random(border, height-border);
    speedX[init] = random(2.0, 3);
    speedY[init] = speedX[init];
 
  }
  img = loadImage("mouse.png");
}

void draw() {

  background(255); //reset bg

  for (int i = 0; i < numberOfBalls; i++) {
    x[i] += speedX[i];
    speedY[i] += gravity;
    y[i] += speedY[i];

    if ((x[i] >= (width-border)) || (x[i] < border)) {  //horizontal ball boundary
      speedX[i] *= -1; //X reversal
      println("first if statement speedx " + speedX[i]);
      println("first if statement speedy " + speedY[i]);
    }

    if (y[i] >= height - border) {
      speedY[i] *= -gravity;
      println("gravity working");
    }
    
    if ((y[i] >= height - border) && (speedY[i] <= 0)){
      y[i] = height - border; //stops them from drifting along the y axis past the bottom
      x[i] -= speedX[i]; //stops them from perpetually rolling along the x axis at the bottom
      image(img, width/2, height/2);
          if (mousePressed) {
       y[i] -= 5; 
       speedY[i] *= random(1, 1.3);

      }
      println("ball stopped");
    }


    strokeWeight(3);
    fill(255, 0, 0);
    ellipse(x[i], y[i], diameter, diameter);
    fill(255);
    strokeWeight(1);
    ellipse(x[i]-5, y[i]-5, 5, 7);
    

  }
}

