
float myNoise = 0;

void setup() {

  size(600, 600);
}

void draw() {

  background(255);

  circle(50, 0.001, 40, 100, 200);
  circle(100, 0.002, 80, 10, 200);
  circle(150, 0.003, 120, 100, 10);
  circle(200, 0.004, 160, 10, 200);
  circle(250, 0.005, 200, 200, 80);
  circle(300, 0.006, 245, 100, 90);
  circle(350, 0.006, 100, 150, 10);
  circle(400, 0.007, 190, 100, 200);
  circle(450, 0.008, 10, 255, 90);
  circle(500, 0.007, 50, 90, 200);
  circle(550, 0.006, 255, 140, 100);
  circle(600, 0.005, 110, 10, 110);
  circle(700, 0.004, 180, 180, 20);
  circle(800, 0.003, 50, 50, 200);
  circle(900, 0.002, 170, 70, 255);
  myNoise++;
}


void circle(int ellipseSize, float factor, int circleFillA, int circleFillB, int circleFillC) {

  float x = noise(myNoise * factor, ellipseSize) * ellipseSize;


  noStroke();

  fill(
  noise(1, myNoise * factor)*circleFillA, 
  noise(2, myNoise * factor)*circleFillB, 
  noise(3, myNoise * factor)*circleFillC, noise(4, myNoise * factor)*150);

  ellipseMode(CENTER);

  ellipse(width/2, height/2, x, x);

}

