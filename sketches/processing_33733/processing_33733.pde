
int numCircles = 1000;
float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];

int [] rad= new int[numCircles];
float [] speedX = new float [numCircles];
float [] speedY = new float [numCircles];

void setup(){
  
  frameRate(60);
  size(800,800);
  smooth();
    noStroke();
  
  
  
  for( int i = 0; i< numCircles; i++){
  rad[i] = round(random(10,50));
  circleX[i] = round(random(rad[i], width-rad[i])) ;
  circleY[i] = round(random(rad[i], width-rad[i]));
  
    speedX [i] = 3;
    speedY [i] = 10;
  
  }
  
  
  
}
    


void draw(){

    background(120,120,60);
   
   
   
 
    for(int j=1; j<numCircles; j++){
      
      
       //moving the balls// 
   
   circleX[j] = circleX[j] + speedX[j];
   circleY[j] = circleY[j] + speedY[j];
   
      
    
  //bouncing//
  
   if(circleX[j] >= width || circleX[j] <= 0){
     speedX[j] = speedX[j] *-1;
   
  }
   
    else if(circleY[j] >= height || circleY[j] <= 0){
     speedY[j] = speedY[j] *-1;
  
   }
    
  
   fill(255,240,255,30);
   ellipse(circleX[j], circleY[j], rad[j],rad[j]);
   
  }
 
  
  }
    
    
    
    
    
  


