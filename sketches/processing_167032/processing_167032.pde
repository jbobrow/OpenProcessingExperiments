
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/52897*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int nbEtoile= 500;
float speedX,speedY=0;
float[] posX = new float [nbEtoile];
float[] posY = new float [nbEtoile];
float[] posZ = new float [nbEtoile];
float radius = 1.5;
void setup(){
  size (850,500,P3D);
  frameRate(80);
  background(0);
  stroke(255);
  for (int i=0;i<posX.length;i++){
    posX[i]=random(width+20);
    posY[i]=random(height+20);
    posZ[i]=random(255);
  }
}
void draw(){
 background(0);
  for(int i=0;i<posX.length;i++){
    stroke(posZ[i]+20);
    ellipse(posX[i],posY[i], radius, radius); 
    posX[i]+=speedX;
    posY[i]+=speedY;
    if(posX[i]>860)posX[i]=random(10)*-1;
    else if (posX[i]<-10)posX[i]=random(10)+850;
    if(posY[i]>510)posY[i]=random(10)*-1;
    else if(posY[i]<-10)posY[i]=random(10)+500;
  }
  speedX=-(((mouseX-width/2)/float(width/2))*20);
  speedY=-(((mouseY-height/2)/float(height/2))*20);
}

