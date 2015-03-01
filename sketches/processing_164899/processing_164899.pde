
float[] graphNums = {
  17, 22, 3, 0, 26, 15, 12, 14, 11, 17
};
float[] x = new float[10];
float[] y = new float[10];
 
void setup(){
  size(400,400);
  smooth();
  for(int i = 0; i < graphNums.length; i++){
    x[i] = width/(graphNums.length-1)*(i);
    y[i] = height - 3*graphNums[i];
  }
}
 
void draw(){
  background(100);
  stroke(255,0,0);
  strokeWeight(5);
  for(int i = 0; i < y.length-1; i++){
    line(x[i], y[i], x[i+1], y[i+1]);
  }
}



