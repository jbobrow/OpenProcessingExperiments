
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71,
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81,
  102.98, 103.57, 104.17
};
  
float average = 0.0;

void setup() {
  size (410, 200);
  background (50);
  fill (255);
  smooth();
  
}

void draw() {
  
  float xval = 15;
  float sum = 0;
  
  for (int i=0; i<19; i++) {
    noStroke();
    rect (xval, height - scores[i], 15, height);
    xval = xval + 20;
    sum += scores[i];
  }
  
  average = sum/19;
  text ("average score : " + average, 20, 20);
  
  stroke (255,0,0);
  line (0, height - average, width, height - average);
}

//average value = 81.98631
