
class disk
{ 
  float xCenter,yCenter,xCenterOld,yCenterOld,xTrans,yTrans,rad,aVel,xLight,yLight; 
  
  disk (float x, float y, float z, float u) 
   {  
   
     xCenter=x;
     yCenter=y;
     xCenterOld=x;
     yCenterOld=y;
     rad=z;
     aVel=u; 
     xLight=xCenter+rad;  // de moment, el punt de llum te posicio fixa
     yLight=yCenter;    // respecte del disc
   } 
   
  void displayDisk()
  {
   ellipseMode(RADIUS);
   ellipse(xCenter,yCenter,rad,rad);
  } 
  
  void updateDisk()
  {
    translateCenter();
    rotateDisk(); 
    
  }
  
 void translateCenter()
  {
   xTrans=xCenter-xCenterOld;
   yTrans=yCenter-yCenterOld;
   xLight=xLight+xTrans;  // actualitza les coord. del punt de llum
   yLight=yLight+yTrans;
   xCenterOld=xCenter;  // guarda el centre per a la propera vegada
   yCenterOld=yCenter;
  
  }

  void rotateDisk()
  {
    float dA=aVel*(5/frameRate);  //increment d'angle  (velocidad)
    xLight=(xLight-xCenter)*cos(dA)-(yLight-yCenter)*sin(dA)+xCenter;
    yLight=(xLight-xCenter)*sin(dA)+(yLight-yCenter)*cos(dA)+yCenter;
  }
  
 
}  
 

