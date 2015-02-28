
/*
Based of of ramayac's Futurismo
Refactored a bit of his code and used a recursive strategy.
*/
 
int superCounter = 0;

void setup() {
  size(600,600);
  smooth();
  noLoop();
}

void draw() {
  background(#F56991);
  stroke(255);
  noStroke();
  square(100,500,100,500,5);
}

void square(float x1, float x2, float y1, float y2, int counter) {
  if (counter == 0) {
    return;
  }
  float iWidth = (x2 - x1)/4;
  float iHeight = (y2 - y1);
  color[] colors = {#D1F2A5, #EFFAB4, #FFC48C, #FF9F80};
  for(int i = 0; i <= 3; i ++) {
    fill(colors[i]);
    rect(x1 + i * iWidth, y1, iWidth, iHeight);
  }
  counter --;
  float recX1 = x1 + (x2 - x1)/2;
  float recY1 = y1 + (y2 - y1)/2;
  square(recX1, x2, recY1, y2, counter);
}
