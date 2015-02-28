
int numCircle = 30;

float[] circleX = new float [numCircle];
float [] circleY = new float [numCircle];

float [] speedX = new float [numCircle];
float [] speedY = new float [numCircle];

void setup() {
  size(500, 500); 
  smooth(); 
  noStroke(); 
  colorMode(RGB, 256); 

  for (int i = 0; i < numCircle; i++) {
    circleX[i] = random(width); 
    circleY[i] = random(height); 
    
    speedX[i] = 5;
    speedY[i] = 5;
  }
}

void draw() {
  background(255, 255, 255); // background color
  fill(255, 105, 180, 200); 

  for (int i = 0; i < numCircle; i++) {
    ellipse(circleX[i], circleY[i], i+50, i+50); 
  }
  
  if (mousePressed == true){
   for (int i = 0; i < numCircle; i++) { 
   circleX[i]+=random(2);
   circleY[i]-=random(5); 
    }
  }


}
