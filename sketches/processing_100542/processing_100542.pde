
int barW = 10;
int barH = 5;
int maxVal = 100;
int length = 100;
int[] vals = new int[length];
int c = 1;
int marker = 1;
int temp = 0;
 
void setup() {
  size(1000,510);
  background(50, 50, 50);
  frameRate(4);
  for(int i = 0; i < length; i++) {
    vals[i] = (int) random(0, maxVal);
  }
}
 
void draw() {
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
    while(marker != 0 && vals[marker] < vals[marker - 1]) {
      temp = vals[marker];
      vals[marker] = vals[marker-1];
      vals[marker-1] = temp;
      marker = marker - 1;
      background(50,50,50);
      for(int i = 0; i < 100; i++) {
        fill((int)(50 + 200.0/maxVal * vals[i]), 255, 255);
        if(i > c) {
          fill((int) random(100,200), (int) random(100, 200), 0);
        }
        rect(barW*i, (maxVal-vals[i])*barH, barW, vals[i]*barH);  
        fill(255, 0, 0);
        rect(barW*marker, (maxVal-vals[marker])*barH, barW, vals[marker]*barH);
      }
      if (c < length - 1) {
        fill(255, 0, 0);
        rect(barW*(c+1), (maxVal-vals[c+1])*barH, barW, vals[c+1]*barH);
      }
    }
  }
  c++;
  marker = c;
}



