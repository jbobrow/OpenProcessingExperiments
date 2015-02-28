
int numberCircle=85;




float[] circleX =new float[numberCircle];//the array must come before the circleX wich is the variable//
float[] circleY =new float[numberCircle];//we need X and Y because its random //

float[] velXcircleX=new float[numberCircle];//now we are creating how fast the ball is goin gto move//
float[] velYcircleY=new float[numberCircle];


void setup() {
  
  
      size(500,500); 
      for(int i=0; i<numberCircle; i++){
      circleX[i] =random(10,width-10);
      circleY[i] =random(10,width-10);
      velXcircleX[i] =random(3);
      velYcircleY[i] =random(3);


    }
}


void draw() {
  
  smooth();
  background(240,185,2);
  noStroke();
  for(int i=0;i<numberCircle;i++)
  {
    
  circleX[i]+=velXcircleX[i];
  circleY[i]+=velYcircleY[i];
  ellipse(circleX[i],circleY[i],20,20);
  
  
  
  fill(255, 90, 13, 95); //yellow
  circleX[i]+=velXcircleX[i];
  circleY[i]+=velYcircleY[i];
  ellipse(circleX[i],circleY[i],50,50);
  
  if((circleX[i]<=0)||(circleX[i]>=width-10)) {
    velXcircleX[i]=-velXcircleX[i];
  }

  if((circleY[i]<=0)||(circleY[i]>=height-10)) {
    velYcircleY[i]=-velYcircleY[i];
  }
 }
}

