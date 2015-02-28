
int[] hits = new int[100];
int   maxValue = 32;
int   trials = 0;
int   barWidth = 40;
int   leftMargin = 10;
int   botMargin = 20;
int   rowSize = 15;
int[] maxHigh = {28,24,20,17,14,11,9,7,6,5,5,4,4,4,3,3,9,14,15,9,4,4,3,3,3,2,2,2,1,1,1,0};

 
void draw() {
  int x1, x2, y1, y2, minH, maxH, y;
  background(0,0,0);
  int r = int(random(maxValue));
   
  if (hits[r]<maxHigh[r]){
    hits[r] += 1;
  }
  trials += 1;
  fill(255,255,255);
  stroke(255);
  frameRate(int(pow(trials,0.8)));
  minH = hits[0];
  maxH = 0;
  for (int i=0; i<maxValue; i++) {
    x1 = leftMargin + i*barWidth;
    x2 = x1 + barWidth;
    if (hits[i] > 0) {
      rect(leftMargin + i*barWidth,
           height - botMargin - hits[i]*rowSize,
           barWidth,
           hits[i]*rowSize);
    }
  }
  //saveFrame("output/frames####.png");


}
 
void setup() {
  size(maxValue*barWidth + 2*leftMargin, 600);
  for (int i=0; i<maxValue; i++) {
    hits[i] = 0;
  }
  frameRate(1);
  background(0,0,0);
}
