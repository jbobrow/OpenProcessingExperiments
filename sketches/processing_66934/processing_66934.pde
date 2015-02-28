
int numCircle = 50;
float[] cirX = new float[numCircle];
float[] cirY = new float[numCircle];
float[] directionX = new float[numCircle];
float[] directionY = new float[numCircle];
boolean balldirection = false;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  
  for(int i = 0; i < numCircle; i++){
    cirX[i] = 250;
    cirY[i] = 250;
    directionX[i] = random(2,10);
    directionY[i] = random(2,10);
  }
}

void draw(){
  background(255);
  fill(random(0,256), random(0,256), random(0,256), 100);
  for(int i=0; i < numCircle; i++){
  
  if ((cirX[i] > 500) || (cirX[i] < 0)){
    directionX[i] = -directionX[i];
  }
  if((cirY[i] > 500) || (cirY[i] < 0)){
    directionY[i] = -directionY[i];
  }
  ellipse(cirX[i], cirY[i], random(10,50), random(10,50));

  
  cirX[i] = cirX[i] + directionX[i];
  cirY[i] = cirY[i] + directionY[i];
  
  
   }

   
}

