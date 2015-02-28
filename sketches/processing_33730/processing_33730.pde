
int numCircles = 1000;
float [] vel = new float[numCircles];
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];

int [] rad = new int[numCircles];

void setup(){
  size(1000,500);
  smooth();
  
  frameRate(25);
  

  for(int i=0; i< numCircles; i++){
    rad[i] = round(random(10,50));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    vel[i] = 5;
  }
}

void draw(){
  background(242,203,220);
  
  for(int i=0; i< numCircles; i++){
    ellipse(circleX[i], circleY[i],rad[i],rad[i]);
  circleX [i] = circleX [i] + vel[i];
  if(circleX[i] >= width || circleX[i]<= 0){
    vel[i] = -vel[i];
  }
  }
}

//helped by mike and dena --- thank you!

