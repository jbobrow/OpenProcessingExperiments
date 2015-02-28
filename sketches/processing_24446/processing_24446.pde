
class CBall{
  color m_ballColor; 
  float m_fPosX; //
  float m_fPosY; // 
  int   m_iBallWidth = 20;
  int   m_iBallHeight= 20; 
  float m_fBoundingRange = 0.0;
  
  // vo, t, 0.5, g , t*t;
  
  
   int iInit = 0;
   int iInitAniState = 0; 
   float fVelocity = 1.0;
   float fTime = 0.0;
   float fConst = 0.5;
   float fGravity = 1.0;
   int   iBallAniStateFallDown = 1; 
   int   iBallAniStateBounding = 2; 
   int   iBallAniStateAniEnd = 3; 
   int   iCurBallAniState = 0; 

   float fSetBackToTheFuture = 0.0;

  
  CBall(){ // 
     m_ballColor = color(175);
     m_fPosX = 0;
     m_fPosY = 0;     
     iInit   = 0;
  }
  
  void drawBall(){
   // draw ball state 
   rectMode(CENTER);
   stroke(0);
   fill(m_ballColor);
   ellipse(m_fPosX, m_fPosY , m_iBallWidth, m_iBallHeight); 
  }
  
  
  void init(int iMousePosX, int iMousePosY , int iWindowWidth, int iWindowHeight){
    if(iInit==0){
      iInit = 1;
      m_fPosX = iMousePosX;
      m_fPosY = iMousePosY;     
      m_fBoundingRange = (iWindowHeight - iMousePosY)*(0.8); 
      iCurBallAniState = iBallAniStateFallDown;
    }
  }
  
   void updateBoundingAnimation(int iWindowWidth, int iWindowHeight){
     if(iInit==1){
       
       if(iCurBallAniState == iBallAniStateFallDown){
         fTime = fTime+0.1; 
         float fMovingDistanceAtMoment = fVelocity*fTime+fConst*fGravity*fTime*fTime;
         m_fPosY = m_fPosY+fMovingDistanceAtMoment;
         if(m_fPosY > iWindowHeight-(m_iBallHeight*0.8)){
           iCurBallAniState = iBallAniStateBounding;
           fSetBackToTheFuture = fTime*0.4;
         }
       }
       else if(iCurBallAniState == iBallAniStateBounding){
         fTime = fTime-0.1;          
         float fMovingDistanceAtMoment = fVelocity*fTime+fConst*fGravity*fTime*fTime;
         m_fPosY = m_fPosY-fMovingDistanceAtMoment;
         if(fTime <= fSetBackToTheFuture){
           iCurBallAniState = iBallAniStateFallDown;
           if(fSetBackToTheFuture < 0.1){
             iCurBallAniState = iBallAniStateAniEnd;
             
           }
         } 
       }
       
       // throw up..
     }
   
       
      
   }
  
} // end class 






int iBallMaxCount = 100;
int iWindowWidth = 640; 
int iWindowHeight = 480;
CBall [] MyBall = new CBall[iBallMaxCount];;
int iCurBallCount = 0;


void setup(){
  size(iWindowWidth , iWindowHeight);
}


void mousePressed(){
  
  if(iCurBallCount < iBallMaxCount-1){
    MyBall[iCurBallCount] = new CBall();
    MyBall[iCurBallCount].init(mouseX, mouseY, iWindowWidth, iWindowHeight);
    iCurBallCount++;
  }

  /*
  if(iBallCount < iBallMaxCount-1){
    iBallCount++;    
      MyBall[iBallCount].init(mouseX, mouseY, iWindowWidth, iWindowHeight);
  }
  */
  /*
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX, mouseY , 20 , 20);
  */
//  MyHouse.drawHouse(mouseX, mouseY);

  

}




void draw(){
  background(255);
  if(iCurBallCount>=0){
    for(int i=0; i < iCurBallCount ; i++){
    MyBall[i].updateBoundingAnimation(iWindowWidth , iWindowHeight);
    MyBall[i].drawBall();
     }
  }

    

  /*
  if(iBallCount>=0){
      for(int i=0;  i < iBallCount; i++){
          MyBall[i].updateBoundingAnimation(iWindowWidth , iWindowHeight);
          MyBall[i].drawBall();
      }
  }
  */
    
  /*
  MyBall.updateBoundingAnimation(iWindowWidth , iWindowHeight);
  MyBall.drawBall();
  */

  /*
  if(mousePressed){
    // pmouseX, pmouseY , mouseX, mouseY;  //<- old, cur
      stroke(0);
     
      line(pmouseX, pmouseY , mouseX, mouseY);
      
      fill(175);
      rectMode(CENTER);
      rect(mouseX, mouseY , 20 , 20);
  }
  */
  
  
 
}


