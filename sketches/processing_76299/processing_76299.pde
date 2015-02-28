
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};
float count = 0;

void setup() {
  size(650, 190);
  background(255);
}

void draw() {
  line(0, height - 30, 650, height - 30);
  line(40, 0, 40, 300);
  fill(230, 100, 250);
  for (int i = 0; i < scores.length; i++) {
    rect(i*30 + 50, height - 30 - scores[i], 20, scores[i]); 
    count += scores[i];
  }
  fill(0);
  for (int i = 0; i < 11; i++) {
    line(30, height - 30 - i*10, 45, height - 30 - i*10);
    text(i* 10, 10, height - 25 - i*10);
  }
  float avg = count/scores.length;
  text("average score : " + avg, 300, 20);
  line(0, height - 30 - avg, 650, height - 30 - avg);
  noLoop();
}
