
int numBalls = 5;
Circles[] balls = new Circles[numBalls];

void setup(){
  size(700, 700);
  
  for(int i=0; i<numBalls; i++){
    balls[i] = new Circles(i);
  }
}

void draw(){
  background(0);
  for(int i=0; i<numBalls; i++){
   balls[i].create(); 
   balls[i].move();
  }
  
  if(mousePressed){
    for(int i=0; i<numBalls; i++){
      balls[i].trail();
    }
    }
}
class Circles{
int numCircles = 50;

float[] circleX = new float[numCircles]; 
float[] circleY = new float[numCircles];
float[] diam = new float[numCircles];
color[] fill = new color[numCircles];
float[] speedX = new float[numCircles];
float[] speedY = new float[numCircles];
float[] time = new float[numCircles];




Circles(int index){
  for(int i = 0; i<numCircles; i++){
    circleX[i]= int(random(width));
    circleY[i] = int(random(height));
    diam[i] = random(50, 100);
    fill[i] = color(random(200, 255), 0, random(0, 100));
    time[i] = millis()*0.001;
    speedX[i] = int(random(2, 5));
    speedY[i] = int(random(4, 6));
  }
  
 
  
}

void create(){
  for(int i = 0; i<numCircles; i++){
    noStroke();
    fill(fill[i]);
    ellipse(circleX[i], circleY[i], diam[i], diam[i]);
  }
}

void move(){
  for(int i = 0; i<numCircles; i++){ 
    circleX[i]+=speedX[i];
    circleY[i]+=speedY[i];
       if(circleX[i]<diam[i]/2){
          circleX[i] = diam[i]/2;
          speedX[i] = - speedX[i];
          }
          
       if(circleX[i]>width-diam[i]/2){
          circleX[i] = width-diam[i]/2;
          speedX[i] = - speedX[i];
          }
          
        if(circleY[i]>height-diam[i]/2){
          circleY[i] = height-diam[i]/2;
          speedY[i] = - speedY[i];
          }    
          
        if(circleY[i]<diam[i]/2){
          circleY[i] = diam[i]/2;
          speedY[i] =- speedY[i];
          }      
  }
}
        
 void trail(){
   for(int i=0; i<numCircles-1; i++){
     circleX[i] = circleX[i+1];
     circleY[i] = circleY[i+1];
   }
   
   circleX[numCircles-1] = mouseX;
   circleY[numCircles-1] = mouseY;
 }
  
}




