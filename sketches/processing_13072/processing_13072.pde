
int ballCount;
float[] x2;
float[] y2;
float[] r;
float[] speedX;
float[] speedY;
color[] cols;


 void moveBalls(){
   for(int i=0; i<ballCount; i++){
     fill(cols[i]);
     ellipse(x2[i], y2[i], r[i]*2, r[i]*2);
     x2[i] += speedX[i];
     y2[i] += speedY[i];
   }
 }

void createBalls(int count){
  ballCount = count;
  x2 = new float[ballCount];
  y2 = new float[ballCount];
  r = new float[ballCount];
  speedX = new float[ballCount];
  speedY = new float[ballCount];
  cols = new color[ballCount];
  
  for(int i=0; i<ballCount; i++){
    x2[i] = random(width/2 - 50, width/2 + 50);
    y2[i] = random(height/2 - 50, height/2 + 50);
    r[i] = random(2, 10);
    speedX[i] = random(-1, 1);
    speedY[i] = random(-1, 1);
    cols[i] = color(random(255), random(20), random(216));
  }
}

