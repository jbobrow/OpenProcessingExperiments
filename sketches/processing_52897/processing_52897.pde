
int nbEtoile= 3000;
float speedX,speedY=0;
float[] posX = new float [nbEtoile];
float[] posY = new float [nbEtoile];
float[] posZ = new float [nbEtoile];
float[] opacite = new float[nbEtoile];
void setup(){
  size (640,480,P3D);
  frameRate(60);
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
    stroke(posZ[i]+50);
    point(posX[i],posY[i],posZ[i]);
    posX[i]+=speedX;
    posY[i]+=speedY;
    if(posX[i]>650)posX[i]=random(10)*-1;
    else if (posX[i]<-10)posX[i]=random(10)+640;
    if(posY[i]>490)posY[i]=random(10)*-1;
    else if(posY[i]<-10)posY[i]=random(10)+480;
  }
  speedX=-(((mouseX-width/2)/float(width/2))*10);
  speedY=-(((mouseY-height/2)/float(height/2))*10);
}

