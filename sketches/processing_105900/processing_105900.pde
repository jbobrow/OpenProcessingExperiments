
int nBall=5;//number of the ball
float dia=40;//diameter
//int xPos;
float[] xPos= new float[nBall];
float[] ySpeed=new float[nBall]; 
float[] yPos=new float[nBall];
void setup(){
size(400,400);
smooth();
noStroke();
background(67,152,92);
fill(191,13,25);

 for(int i=0; i<nBall;i++){
    xPos[i]=50+50*i;
    ySpeed[i]=random(-10,10);
    yPos[i]=random(10,height-10);

}
}

void draw(){

  background(9,152,219);
    for(int i=0;i<nBall;i++){  
      ellipse(xPos[i],yPos[i],dia,dia);
      if(yPos[i]>=height-dia/2||yPos[i]<=dia/2){
      ySpeed[i]=-ySpeed[i];
      }

    yPos[i]=yPos[i]+ySpeed[i];
    }

  }
