
int ballNo = 100;

float [] ballX = new float [ballNo];
float [] speedX = new float [ballNo];

float [] ballY = new float [ballNo];
float [] speedY = new float [ballNo];

void setup() {
  size(700, 700);
  smooth();
  noStroke();
  
  for (int i = 0; i < ballNo; i++){
    ballX[i] = random(width);
    ballY[i] = random(height);
    speedX[i] = random(-8, 8);
    speedY[i] = random(-10, 10);
  }
}

void draw(){
  background(254, 219, 240);
  
 for (int i = 0; i < ballNo; i++){
   ballX[i] += speedX[i];
   ballY[i] += speedY[i];
   
   if (ballX[i] < 0 || ballX[i] > width){
     speedX[i] = speedX[i] * -1;
   }
   
   if (ballY[i] < 0 || ballY[i] > height){
     speedY[i] = speedY[i] * -1;
   }
   fill (10, 30, 100, 90);
   ellipse (ballX[i], ballY[i], i+10, i+10);
 }
}
  

