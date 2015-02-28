
int diameter=15;//diameter balls
int numBalls = 30; //number of balls


float[] ballX= new float[numBalls];//array for ball x pos-starting
float[] ballY= new float[numBalls];//array for ball y pos-starting

float[]speedX= new float[numBalls];//speed in x axis array
float[]speedY= new float[numBalls];//speed in y axis array

boolean[] ballMove= new boolean[numBalls];//

void setup(){
  size(800,800);
  smooth();
  noStroke();
 
  for(int i =0; i<numBalls; i++){
    ballX[i] = random(width);//random x position array
    ballY[i]= random(height);//random y position array
    ballMove[i] = false;//balls are not initially moving boolean
    speedX[i]=3;//initial speed 
    speedY[i]=3;//initial speed
    
  ellipse(ballX[i], ballY[i], diameter, diameter);    //draw the balls in static location
    
  }
}

void draw(){
  background(230,16,16);//background color
  fill(255);
  
    for (int i=0; i<numBalls;i++){//draws initial balls in random locations
      ellipse(ballX[i],ballY[i],diameter,diameter);
      }
      
   
    if (mousePressed == true){//is the mouse clicked?
        for (int j = 0; j < numBalls; j++){
          if (((mouseX - ballX[j]) < diameter) && ((mouseY - ballY[j]) < diameter)) {//mouse clicked on a ball location
            ballMove[j] = true;//change boolean to true
              }
          }
        }
    
  
          for (int i = 0; i <numBalls; i++){//changes speed of the ball
                       
          if (ballMove[i]==true){//means mouse is already clicked on a ball location
                       ballX[i]+=speedX[i];//speed increases
                       ballY[i]+=speedY[i];
          }
   
             if(ballX[i]<diameter || ballX[i]>width-diameter) {//sets x axis boundaries, change speed at wall
                 speedX[i]*=-1; 
              }
              if(ballY[i]<diameter || ballY[i]> height-diameter) {//sets y axis boundaries, change speed at wall
                  speedY[i]*=-1;
                  }
          
                  ellipse(ballX[i], ballY[i], diameter, diameter);//draws ball
        }  
}

