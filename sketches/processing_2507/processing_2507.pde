
//found at www.learningprocessing.com



int circleSize = 0;
int circleX = 250;
int circleY = 250;



void setup() {
  size(600,600);
  smooth();
  background(0);
}

void draw() {
  background(255);
  stroke(0);
  fill(175);
  // Use the variables to specify the location of an ellipse.
  ellipse(circleX,circleY,circleSize,circleSize);
  
  // An assignment operation that increments the value of circleSize by 1.
  circleSize = circleSize + 1;

}

