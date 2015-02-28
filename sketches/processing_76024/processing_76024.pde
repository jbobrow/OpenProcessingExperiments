
float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71,
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81,
  102.98, 103.57, 104.17};
int position = 10;


smooth();
size(380, 200);
background(221, 234, 216);
float arraySum = 0;
  
stroke(242, 154, 53);
int arrayLength = scores.length - 1;
for (int i = 0; i < scores.length; i++){
  strokeWeight(10);
  line (position, height, position, scores[arrayLength - i]);
  position += 20;
  arraySum += scores[i];
    
  if (i == arrayLength){
    float average = arraySum / scores.length;
    // average is 81.98631
    stroke(41, 173, 145);
    strokeWeight(2);
    line (0, (height-average), width, (height-average));
  }
 }
