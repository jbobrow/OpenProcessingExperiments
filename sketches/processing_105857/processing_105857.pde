
int numBalls=200;

int[] ballX=new int[numBalls];
int[] ballY=new int[numBalls];

int[] speedX=new int[numBalls];
int[] speedY=new int[numBalls];

int ballSize=5;

int[] ballColor=new int[numBalls];


void setup(){
  size(600, 600);
  noStroke();
  for(int i=0;i<numBalls;i++){
  ballX[i]=i+10*i;
  ballY[i]=i+10*i;
  
  ballSize =5;
  
  speedX[i]=5;
  speedY[i]=5;
  
  ballColor[i]=color(0,random(100,255),0);
  
  }
    
}

void draw(){
  background(0); 
  
   for(int i=0;i<numBalls;i++){
     fill(ballColor[i]);
     ellipse(ballX[i],ballY[i],ballSize,ballSize);
   
   }
   for(int i=0;i<numBalls;i++){
     ballX[i]=ballX[i]+speedX[i];
     ballY[i]=ballY[i]+speedY[i];
   }
   
   for(int i=0;i<numBalls;i++){
     if(ballX[i] > width - ballSize/2){
      speedX[i] = speedX[i] * -1; 
      
      ballX[i]=width-ballSize/2;
      
     }
     
     if(ballX[i]<ballSize/2){
       speedX[i] = speedX[i] * -1; 
       ballX[i]=ballSize/2;
     }
     if(ballY[i]>height-ballSize/2){
       speedY[i]=speedY[i]*-1;
       ballY[i]=height-ballSize/2;
     }
     if(ballY[i]<ballSize/2){
       speedY[i]=speedY[i]*-1;
       ballY[i]=ballSize/2;
     }
   } 
  }

void keyPressed(){
  for(int i=0; i<numBalls;i++){
    
    ballSize=20;
  }
}

void keyReleased(){
  for(int i=0; i<numBalls;i++){
    
    ballSize=5;
  }
}
  
    


