
int numCircles = 1000;
int [] rad = new int[numCircles];
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] vel = new float[numCircles];


void setup(){
  size(900, 400);
  smooth();
  frameRate(60);
  
  for(int i=0; i< numCircles; i++){
    rad[i] = round(random(10,40));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    vel[i] = 15;
  }
}

void draw(){
  background(121, 181, 200);
  stroke(255);
  for(int j=0; j< numCircles; j++){
      fill(0);
    ellipse(circleX[j], circleY[j], rad[j], rad[j]);
    
    circleY[j] += vel[j];
  
    if(circleY[j] < 0+rad[j] || circleY[j] > height-rad[j]){
      vel[j] *= -1;
    }
  }
}
