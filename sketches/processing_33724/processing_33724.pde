
int numCircles = 1000;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] vel = new float[numCircles];
 
int [] rad = new int[numCircles];
 
void setup(){
  size(500,500);
  smooth();
  noStroke();
   
  for(int i=0; i< numCircles; i++){
    rad[i] = 10;
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    vel[i] = (10);
  }
}
 
void draw(){
  background(181,55,201);
  fill(255);
  for(int j=0; j< numCircles; j++){
    ellipse(circleX[j], circleY[j],rad[j],rad[j]);
    
    circleX[j] = circleX[j] + vel[j];
    
    if(circleX[j] <= 0 || circleX[j] >= width){
      vel[j] = -vel[j];
  
  }
  }
  
}


