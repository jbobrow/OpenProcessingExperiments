
String sample = "";
int sampleLength = 333;
int num0, num1 = 0;
double expectedRuns = 0;
double variance = 0;
double standardDev = 0;
int numberOfRuns = 1;
double zStat = 0;
float x = 0;
float y = 0;
float movingAvg1[] = new float[50];
float movingAvg2[] = new float[150];
float movingAverage1 = 0;
float movingAverage2 = 0;
float displayMultiplier;

void setup() {
  size(700,300);
  displayMultiplier = int(height/8);
  smooth();
  strokeWeight(1);
  for (int i=0; i < sampleLength; i++) {
    sample += str(int(random(0,2)));
  }
  for (int i=0; i < movingAvg1.length; i++) {
    movingAvg1[i] = 0;
  }
  for (int i=0; i < movingAvg2.length; i++) {
    movingAvg2[i] = 0;
  }
  background(0);

}

void draw() {
  delay(int(random(1,11)));
  if (x%10 == 0) {
    fill(0,12);
    rect(0,0,width,height);
  }
  stroke(128);
  line(0,height/2,width,height/2);
  stroke(128,0,0);
  line(0,-2.58*displayMultiplier+height/2,width,-2.58*displayMultiplier+height/2);
  line(0,2.58*displayMultiplier+height/2,width,2.58*displayMultiplier+height/2);
  stroke(128,42,42);
  line(0,-1.96*displayMultiplier+height/2,width,-1.96*displayMultiplier+height/2);
  line(0,1.96*displayMultiplier+height/2,width,1.96*displayMultiplier+height/2);
  stroke(128,85,85);
  line(0,-1.645*displayMultiplier+height/2,width,-1.645*displayMultiplier+height/2);
  line(0,1.645*displayMultiplier+height/2,width,1.645*displayMultiplier+height/2);
  
  sample += str(int(random(0,2)));
  sample = sample.substring(1,sampleLength+1);
  num0 = 0;
  num1 = 0;
  numberOfRuns = 1;
  for (int i=0; i < sampleLength; i++) {
    if (sample.charAt(i) == 48) {
      num0++;
    } else {
      num1++;
    }
    if (i < sampleLength-1) {
      if (sample.charAt(i) != sample.charAt(i+1)) {
        numberOfRuns++;
      }
    }
  }
 
  expectedRuns = 1 + ((2*num0*num1)/(sampleLength));
  variance = ((2.0 * num0 * num1) * ((2.0 * num0 * num1) - sampleLength));
  variance /= ((sampleLength * sampleLength)*(sampleLength-1));
  standardDev = Math.sqrt(variance);
  zStat = (numberOfRuns - expectedRuns) / standardDev;
  

  if ((zStat < -2.58) || (zStat > 2.58)) {
    stroke(255,0,0);
  } else if ((zStat < -1.96) || (zStat > 1.96)) {
    stroke(255,85,85);
  } else if ((zStat < -1.645) || (zStat > 1.645)) {
    stroke(255,170,170);
  } else {
    stroke(255);
  }
  if (x > width) {
    x = 0;
  }
  y = (float) (-zStat*displayMultiplier + (height/2));
  
  line(x,y,x-1,movingAvg1[movingAvg1.length-1]);
  movingAvg1 = subset(movingAvg1, 1, movingAvg1.length-1);
  movingAvg1 = append(movingAvg1, y);
  movingAverage1 = 0;
  for (int i = 0; i < movingAvg1.length; i++) {
    movingAverage1 += movingAvg1[i];
  }
  movingAverage1 /= movingAvg1.length;
  
  line(x,y,x-1,movingAvg2[movingAvg2.length-1]);
  movingAvg2 = subset(movingAvg2, 1, movingAvg2.length-1);
  movingAvg2 = append(movingAvg2, y);
  movingAverage2 = 0;
  for (int i = 0; i < movingAvg2.length; i++) {
    movingAverage2 += movingAvg2[i];
  }
  movingAverage2 /= movingAvg2.length;
  
  stroke(0,255,0);
  point(x,movingAverage1);
  point(x,movingAverage2);
  x++;

}


