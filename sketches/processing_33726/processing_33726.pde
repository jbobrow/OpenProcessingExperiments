
int numCircles = 1000;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] velX = new float[numCircles];
int [] rad = new int[numCircles];
float [] r = new float[numCircles];
float [] g = new float[numCircles];
float [] b = new float[numCircles];
float [] velY = new float[numCircles];
 
void setup(){
  size(500,500);
  smooth();
  noStroke();
  frameRate(50);
   
  for(int i=0; i< numCircles; i++){
    rad[i] = 10;
    fill(91,55,201);
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    velX[i] = random(1, 2);
    velY[i] = random(4, 6);
  }
}
 
void draw(){
  background(59, 167, 232);
  noStroke();
  for(int j=0; j< numCircles; j++){
    ellipse(circleX[j], circleY[j],rad[j],rad[j]);
    
    circleX[j] = circleX[j] + velX[j];
    circleY[j] = circleY[j] + velY[j];
    
    r[j] = random(1,255);
    g[j] = random(1,255);
    b[j] = random(1,255);
    
    
    if(circleX[j] <= 0 || circleX[j] >= width){
      velX[j] = -velX[j];
       
    if(circleY[j] >= height || circleY[j] <= 0 ){
      velY[j] = -velY[j];
      fill(r[j],g[j],b[j]);
  }
  
    }
  }
}
  


