
int ballNumber = 20;
float[] xPos = new float[ballNumber];
float[] yPos = new float[ballNumber];
float[] xSpeed = new float[ballNumber];
float[] ySpeed = new float[ballNumber];
int ballSize = 25;

void setup(){
  size(600,600);
  noStroke();
  for(int i=0; i<ballNumber; i++){
  xPos[i] = random(0,width);
  yPos[i] = random(0,height);
  xSpeed[i] = random(-5,5);
  ySpeed[i] = random(-3,7);  
  }
}


void draw(){
  background(0);
  for(int i=0; i<ballNumber; i++){
  fill(0,255,255);
  ellipse(xPos[i],yPos[i],ballSize,ballSize);
  xPos[i]= xPos[i] + xSpeed[i];
  yPos[i] = yPos[i] + ySpeed[i]*1;
  if(xPos[i]>width-ballSize/2||xPos[i]<ballSize/2){
      xSpeed[i] = xSpeed[i]*-1;
      //xPos[i]=width-ballSize/2;
      
  }
   if(yPos[i]>height-ballSize/2||yPos[i]<ballSize/2){
      ySpeed[i] = ySpeed[i]*-1;
     // yPos[i]=height-ballSize/2;
    }  
    
//   if(yPos[i]<height-ballSize&&ySpeed;[i]<0.2&&ySpeed;[i]>-.02){
//     ySpeed[i]=0;
//   
//   }
    

      for(int j=0;j<ballNumber;j++){
        if(i!=j)
        {
          if(dist(xPos[i],yPos[i],xPos[j],yPos[j])<ballSize/2){
                xSpeed[i]=xSpeed[i]*-1;
                ySpeed[i]=ySpeed[i]*-1;
          
          } 
        }  
        



    }}}
