
float total = 0;
float avg = 0;


float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};

void setup() {
  size(950, 250); 
  background(216, 181, 152);
  stroke(139, 119, 33);
  strokeWeight(3);
  for (int i=0; i<scores.length; i++) {
    fill(204, 187, 254);
    rect(i*50, 250, 50, -scores[i]*2);
    total = total + scores[i];
  }

  avg = total/scores.length;
  line(0, 250-avg*2, 950, 250-avg*2);
  println(avg);
}

//avergae is 81.98631
