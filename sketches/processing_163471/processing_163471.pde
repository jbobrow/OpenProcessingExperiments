
int ballCount=150;
float[] circleX = new float [ballCount];
float[] circleY = new float [ballCount];
float gravity;
float[] speedY = new float[ballCount];
float diam=25;
 
void setup() {
  size(600, 600);
 
  for (int i=0; i<ballCount; i++) {
    circleX[i]=random(diam/2, width-diam/2);
    circleY[i]=random(-1000, 0);
    speedY[i]=25;
  }
 
  gravity=1;
}
 
void draw() {
   
  
  float brightness = map(sin(frameCount/3),-1, 1, 1, 2);
  background(150*brightness/random(1,10));
   
  noStroke();
  fill(10, 200, random(200, 255));
  for (int i=0; i<ballCount; i++) {
    circleY[i] += speedY[i];
    speedY[i] += gravity;
    ellipse(circleX[i], circleY[i], 2, diam);
 
    if (circleY[i]>height) {
      circleY[i]=random(-500, 0);
      gravity=0;
       
    }
  }
}

