
// Oliver Haimson 
// Assignment 08C
// Copyright 2012

float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71,
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81,
  102.98, 103.57, 104.17};
  
void setup() {
  size(620, 400);
  smooth();
  background(255);
  float sum = 0;
  noStroke();
  fill(25,150,200);
  // draw rectangles
  for (int i=0; i<scores.length; i++){
    rect(40+i*30, height-30-scores[i]*3, 20, scores[i]*3);
    sum+=scores[i];
  }
  float avg = sum/scores.length;
  // the average value is 81.986
  strokeWeight(2);
  stroke(200,50,25);
  fill(200,50,25);
  line(35, height-30-avg*3, width-20, height-30-avg*3);
  text("mean: "+nf(avg,2,2), 40,height-35-avg*3);
  fill(0);
  textSize(10);
  stroke(0);
  strokeWeight(1);
  textAlign(CENTER);
  // y axis
  line(35,height-30, 35,height-30-100*3);
  for (int n=0; n<max(scores); n+=20) {
    text(n, 20, height-30-(n*3-4));
    line(29, height-30-n*3, 35, height-30-n*3);
  }
  // title
  textSize(30);
  text("Exam Scores", width/2, 35);
}
