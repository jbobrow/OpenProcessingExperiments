
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71, 
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81, 
  102.98, 103.57, 104.17
};
float h = 0;

size(570, 300);
smooth();



background (255);
for (int i=0; i<19; i=i+1) {
  strokeWeight(2);
  fill(255-20*i, 12*i, 12*i);
  rect(i*30, 300-(2*scores[i]), 30, 2*scores[i]);
}
for (int r=0; r<scores.length; r++) {
  h += scores[r];
  if (r==18) {
    float scoreAvg = h/scores.length;
    line (0, height-scoreAvg, 570, height-scoreAvg);
       fill(0);
    text("The Average Score is " + scoreAvg, 30,30);
  }
}
