
int scoresSize = 19;
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};

float average = 0.0;

void setup() {
  size(290, 150);
  background(0);

  return;
}

void draw() {
  background(255);

  fill(135, 125, 193);

  float loc = 5.0;
  float sum = 0.0;

  for (int i = 0; i < scoresSize; i++) {
    rect(loc, height-(scores[i]), 10, height);
    loc += 15.0;
    sum += scores[i];
  }
  
  fill(0);
  average = sum/scoresSize;
  text("average = " + average, 10, 20);
  line(0, average, width, average);
}

