
int diam=15;
int numBalls=50;
 
float[] xpos = new float[numBalls];
float[] ypos= new float[numBalls];
 
float[] velX = new float [numBalls];    
float[] velY = new float [numBalls];   
 
 
void setup(){
  size (600,200);
  background(3, 288, 255);
  frameRate(20);
  noStroke();
  smooth();
  
    for(int i=0; i<numBalls; i++){
    xpos[i]=random(diam, width-diam);
    ypos[i]=random(diam, height-diam);
     
    velX[i]=random(5,10);
    velY[i]=random(5,10);

  }
}
void draw(){
  background(3, 227, 255);
 
  for (int i=0; i<numBalls; i++){
    xpos[i] += velX[i];
    ypos[i] += velY[i];
   
  if(xpos[i]< diam || xpos[i] > width-diam){
      velX[i]*=-1;
  }
   
  if(ypos[i] < diam || ypos[i] > height-diam){
       velY[i]*=-1;
        
  }
  
  fill (215, 9, 9);
  ellipse (xpos [i], ypos [i], diam, diam);
  }
}

