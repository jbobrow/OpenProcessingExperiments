
//0 means attract loop, 1 means game, 2 means game over
int state = 0;
int numStars = 500;
float[] dotX = new float[numStars];
float[] dotY = new float[numStars];
float[] velocity = new float [numStars];
float blackHoleX;
float blackHoleY;
float blackHoleVelocity;

void setup() { 
size(500, 500);
background(255, 0, 200); 

for(int i=0;i<numStars;i++){
dotX[i] = random(width);
dotY[i] = random(height);
velocity[i] = 5.0;
}
blackHoleX = width/2;
blackHoleY = height/2;
blackHoleVelocity = 8;
}

void draw() { 
  background(255, 0, 255);
  if (state == 0) {
    textSize(32);
    fill(0);
    textAlign (CENTER);
    text("Press spacebar to begin", width/2, height/2);
  }
    
  else if (state==1) {
  background(255, 0, 200);
  stroke(100, 255, 100);
  strokeWeight(10);
  for(int i=0; i<numStars; i++) {
  point(dotX[i], dotY[i]);
  dotX[i] += velocity[i];
  if( dotX[i] > width) {
  dotX[i] = 0;
  }
  }
  
  stroke(0);
  strokeWeight(25);
  point(blackHoleX, blackHoleY);
  blackHoleX += blackHoleVelocity;
  if(blackHoleX > width) {
    blackHoleX = 0;
  }
  for(int i=0;i<numStars;i++){
    if(dist(dotX[i],dotY[i],blackHoleX,blackHoleY) < 50) {
   dotY[i] = 0.9*dotY[i] + 0.1*blackHoleY;
   dotX[i] = 0.9*dotX[i] + 0.1*blackHoleX;

    }
  }
  } else {
    // game over
  }
}

void keyPressed() {
  
if(state == 0) {
 if (key == ' '){
   state = 1;
} 

} else if(state ==1) {
} else {
}
}
