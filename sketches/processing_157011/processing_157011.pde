
int numObj = 1000;
float [] hue = new float[numObj];
float [] xPos = new float[numObj];
float [] yPos = new float[numObj];
float [] dropW = new float[numObj];
float [] dropH = new float[numObj];
float [] speedX = new float[numObj];
float [] speedY = new float[numObj];
float gravity;

void setup(){
  size(600,600);
  gravity = 0.1;
  for(int i=0; i<numObj; i++){
    hue[i] = random(200,255);
    xPos[i] = random(250,350);
    yPos[i] = random(0,600);
    speedX[i] = 0;
    speedY[i] = random(0,20);
    dropW[i] = random(2,15);
    dropH[i] = random(2,15);
  }
  
}

void draw(){
    background(0);
    for(int i=0; i<numObj; i++){
       ellipse(xPos[i],yPos[i],dropW[i],dropH[i]);
       yPos[i]= yPos[i]+speedY[i];
       xPos[i]= xPos[i]+speedX[i];
       fill(0,0,hue[i]);
       speedY[i] = speedY[i]+gravity;
       
       if(yPos[i]> height-dropH[i]/2){
         yPos[i] = height-dropH[i]/2;
         speedY[i]=speedY[i]*(-.3);
         if(abs(speedY[i])<1){
           yPos[i]=random(0,150);
           xPos[i]=random(250,350);
           speedX[i]=0;
         }
       }
       
      float distance = dist(mouseX, mouseY, xPos[i], yPos[i]);
      if(distance<20){
        speedX[i]=(mouseX-pmouseX)/5;
        speedY[i]=((mouseY-pmouseY)/5)*-.4;
      }
      
      if(xPos[i]<0){
        xPos[i]=0;
        speedX[i]=speedX[i]*-.8;
      }
      if(xPos[i]>width){
        xPos[i]=width;
        speedX[i]=speedX[i]*-.8;
      }
      
    }
  
  
}
