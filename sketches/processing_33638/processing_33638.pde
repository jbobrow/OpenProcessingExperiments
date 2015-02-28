
int numberBalls = 10; //defines x number of balls
int counter;  //defines counter element

float centerX [] = new float [numberBalls]; //defines xposition
float centerY [] = new float [numberBalls]; //defines yposition

void setup() {

  size(400, 400);
  noStroke();
  smooth();

  frameRate(30);
  counter = 0;
  
}
void mousePressed() {
  centerX[counter % numberBalls] = mouseX;
  centerY[counter % numberBalls]= mouseY;
  counter++;
}

void draw() {

  background(255);
  fill(100, 180, 200, 50);
  for (int i = 0; i<numberBalls && i<counter; i++) { //this equation adds 1 ball everytime [i] is called at positions centerX, centreY
    ellipse(centerX[i], centerY[i], 100, 100);
  }
}


