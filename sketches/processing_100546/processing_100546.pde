
int barW = 10;
int barH = 5;
int maxVal = 100;
int length = 100;
int[] vals = new int[length];
int c = 0;
int lowest = maxVal + 1;
int minPos = -1;
int temp = 0;
 
void setup() {
  size(1000,510);
  background(50,50,50);
  frameRate(4);
  for(int i = 0; i < length; i++) {
    vals[i] = (int) random(0,maxVal);
  }
}
 
void draw() {
  background(50,50,50);
  for(int i = 0; i < length; i++) {
    if(i > c){
      fill((int) random(100,200), (int) random(100, 200), 0);
    }else{
      fill((int)(50 + 200.0/maxVal * vals[i]), 255, 255);
    }
    rect(barW*i, (maxVal-vals[i])*barH, barW, vals[i]*barH);
    fill((int) random(100,200), (int) random(100, 200), 0);
  }
  if (c < length) {
    for(int i = c; i < length; i++) {
      
      fill(255, 0, 0);
      rect(barW*c, (maxVal-vals[c])*barH, barW, vals[c]*barH);
      fill((int)(50 + 200.0/maxVal * vals[i]), 255, 255);
      if(i > c) {
        fill((int) random(100,200), (int) random(100, 200), 0);
      }
      rect(barW*i, (maxVal-vals[i])*barH, barW, vals[i]*barH);
      if(vals[i] < lowest) {
        rect(barW*i, (maxVal-vals[i])*barH, barW, vals[i]*barH);
        fill(255, 255, 255);
        lowest = vals[i];
        minPos = i;
      }
    }
    if (c < length - 1) {
      fill(255, 0, 0);
      rect(barW*c, (maxVal-vals[c])*barH, barW, vals[c]*barH);
      fill(255, 255, 255);
      temp = vals[c];
      vals[c] = lowest;
      vals[minPos] = temp;
      c++;
    }
  }
  lowest = maxVal + 1;
  minPos = -1;
}


