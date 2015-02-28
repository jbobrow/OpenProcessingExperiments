
int numCircles = 1000;
int [] rad = new int[numCircles];
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] vel = new float[numCircles];


void setup(){
  size(900, 400);
  smooth();
  frameRate(10);
  
  for(int i=0; i< numCircles; i++){
    rad[i] = round(random(10,40));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    vel[i] = round(random(-50,50));
    
  }
}

void draw(){
  background(121, 181, 200);
  stroke(255);
  fill(0);
  for(int j=0; j< numCircles; j++){
    ellipse(circleX[j], circleY[j], rad[j], rad[j]);
    circleY[j] += vel[j];
    circleX[j] += vel[j];
  
   if(circleY[j] < 0+rad[j] || circleY[j] > height-rad[j]){
      vel[j] *= -1;
    }
   if(circleX[j] < 0+rad[j] || circleX[j] > width-rad[j]){
      vel[j] *= -1;
    }
  }
}
