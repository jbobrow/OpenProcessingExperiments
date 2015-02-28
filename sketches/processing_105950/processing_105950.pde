

void setup(){
 size(width,height); 
 frame.setResizable(true);
 
}

void draw() {
 background(0);
 float numBalls = 8;
 for(int i = 0; i<numBalls; i++){
   for(int k = 0; k<numBalls; k++){
   float ballDiam = 40;
   float ballRad = ballDiam/2;
   float jump = width/(numBalls+1);
   float xPos = jump+jump*i;
   float yPos = jump+jump*k;
   float mDist = dist(mouseX, mouseY, xPos, yPos);
   if(mDist<ballRad){
     ballDiam = 50;
     }
   else if (mDist>ballRad){
     ballDiam = ballDiam;
    }
    //if(mDist<ballRad && mouseX > (width/2)){
   //  xPos = xPos - 40;
    // ballDiam = ballDiam;
    // }
   
      ellipse(xPos, yPos, ballDiam, ballDiam);

 }

}
}


