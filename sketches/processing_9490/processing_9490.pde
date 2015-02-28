
void motif(int x, int y, float largeurCase, float hauteurCase)
{
  stroke(0);
  noFill();
  
  //interactivity : stroke color change with the mouseX deplacement
  //the mouseX values need to be included between 0 & 255
  float mouseRange = map(mouseX, 0, width, 0, 255);
  
  //creation & initialization of coswave an array of float numbers
  float[] coswave = new float[width/6];
  //we filled the array with cosine values
  for (int i = 0; i < largeurCase; i++) {
    //amount is to re-maps a number from one range to another
    //value, low1, high1, low2, high2 where low/high is the 
    //Lower/Upper bound of the value's current/target range
    float amount = map(i, 0, largeurCase, 0, PI);
    //abs to calculate the absolute value (which is always positive)
    coswave[i] = abs(cos(amount));
  }
  
  //1st graphic representation
  for (int i = 0; i < largeurCase; i++) {
    //stroke(coswave[i]*255);
    stroke(coswave[i] * mouseRange);
    line(i, 0, i, hauteurCase/3);
  }
  
  //2nd graphic representation
  for (int i = 0; i < largeurCase; i++) {
    stroke(127 - coswave[i] * mouseRange / 2);
    line(i, hauteurCase/3, i, hauteurCase/3*2);
  }
  //3rd graphic representation
  for (int i = 0; i < largeurCase; i++) {
    stroke(255 - coswave[i] * mouseRange);
    line(i, hauteurCase/3*2, i, hauteurCase);
  }  
  
}

