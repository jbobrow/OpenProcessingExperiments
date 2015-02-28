
// average = 81.98631

float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};

float numScores = scores.length;
float border = 5;



void setup() {
  size(400, 200);
  smooth();
}

void draw() {
  strokeWeight(3);
  drawScores();
  drawAverages();
  fill(255);
  String s = "average= " + findAverage();
  text(s, 10, height-15);
}

void drawScores() {
  stroke(0);
  float xStep = (width-border*2)/numScores;
  for (int i=0; i< scores.length; i++) {
    line((i+1)*xStep, 0, (i+1)*xStep, scores[i]);
  }
}

void drawAverages() {
  float yPos = findAverage();
  strokeWeight(1);
  stroke(255, 0, 255);
  line(0, yPos, width, yPos);
}

float findAverage() {
  float sum = 0;
  for (int i=0; i< scores.length; i++) {
    sum += scores[i];
  }

  return sum/numScores;
}

void drawAverage() {
}
