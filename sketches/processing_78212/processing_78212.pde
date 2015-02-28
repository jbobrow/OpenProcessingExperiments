
//Sarah Anderson, seanders
//EMS 2, Assignment 8c

float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71,
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81,
  102.98, 103.57, 104.17};
  
  
void setup(){
  size(410,200);
  smooth();
  background(255);
  strokeWeight(5);
  
}

void draw(){
  graphAvg();
}

void graphAvg(){
  int x=20;
  int avg=0;
  for(int i=0; i<scores.length; i++){
    stroke(0);
    line (x, 170, x, 170-scores[i]);
    x+=20;
    avg+=scores[i];
  }  
  avg=avg/scores.length;
  stroke(255,0,0);
  fill(255,0,0);
  line(20,avg, x, avg);
  text("Average Score is: " + avg, width/4, 50);
}
