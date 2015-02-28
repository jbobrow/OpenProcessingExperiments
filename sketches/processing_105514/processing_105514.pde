
int numCircle = 90;

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

    speedX[i] = random (-3, 5);
    speedY[i] = random (-5, 8);
  }
}





void draw() {

  background (255);
  fill(random(250),random(250),random(250),100);


  for (int i= 0; i<numCircle; i++) {
    
    if(mousePressed == true) 
    
    circleX[i]= circleX [i] + speedX[i];
    circleY[i]= circleY [i] + speedY[i];

    if(circleX[i] >= width) {
      speedX[i] = speedX[i] *-1;
    }

    if(circleY[i] >=height) {

      speedY[i] = speedY[i] *-1;
    }

    if(circleX[i] <= 0) {
      speedX[i] = speedX[i] *-1;
    }

    if(circleY[i] <= 0) {

      speedY[i] = speedY[i] *-1;
    }




    ellipse(circleX[i],circleY[i], i+10, i+10);
  }
}
