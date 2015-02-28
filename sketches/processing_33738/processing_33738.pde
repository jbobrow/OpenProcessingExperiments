
int numCircles = 1000;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] velX = new float[numCircles];
float [] velY = new float[numCircles];

void setup(){
  size(500,500);
  smooth();
  noStroke();
 
  for(int i=0; i< numCircles; i++){
    circleX[i] = random(0,500);
    circleY[i] = random(0,500);
    velX[i]=1;
    velY[i]=1;
     
  }
 }

void draw(){
  background(121,181,200);

  for(int i=0; i< numCircles; i++){
  ellipse(circleX[i], circleY[i],10,10);
  circleX[i]=circleX[i]+velX[i];
  circleY[i]=circleY[i]+velY[i];
  if((circleX[i]>width)||(circleX[i]<0)) {
    velX[i]=velX[i]*-1;
  }
  if((circleY[i]>height)||(circleY[i]<0)){
    velY[i]=velY[i]*-1;
  }
  }
}
 
 
 
  

