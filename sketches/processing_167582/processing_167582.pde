
float[] graphNums = {
  90, 25, 16, 0, 5, 35, 66, 33, 41, 12
};

void setup() {
  size(400, 400);
}


void draw() {
  background(255);
  fill(255);
  for (int i= 0; i < graphNums.length-1; i++) {
    float x1= i*40;
    float y1= (graphNums[i] * 10);
    
    float x2= (i*1)+20;
    float y2= (graphNums[i+1] *10);
    line(x1, y1, x2, y1);
  }
  
}

