
class Branch1{
 float xPos, yPos;
 
 float xPos1, xPos2; 
 float yPos1, yPos2; 
 float xPosA, xPosB, xPosC, xPosD;
 float yPosA, yPosB, yPosC, yPosD;
 float xPosA1, xPosA2, xPosB1, xPosB2, xPosC1, xPosC2, xPosD1, xPosD2;
 float yPosA1, yPosA2, yPosB1, yPosB2, yPosC1, yPosC2, yPosD1, yPosD2;
 float weight;
 float a;
 
 
 Branch1(){   
  weight = 3;
  a = 255;
  xPos = width/2;
  yPos = height/2;
   
  xPos1 = width/2;
  yPos1 = height/56*20; 
  xPos2 = width/2;
  yPos2 = height/56*20;
  
  xPosA = width/56*26;
  yPosA = height/56*16.5; 
  xPosA1 = width/56*22.5;
  yPosA1 = height/56*14.5; 
  xPosA2 = width/56*22.5;
  yPosA2 = height/56*14.5;
  
  xPosB = width/56*26;
  yPosB = height/56*16.5; 
  xPosB1 = width/56*26;
  yPosB1 = height/56*12.5;
  xPosB2 = width/56*26;
  yPosB2 = height/56*12.5;
  
  xPosC = width/56*30;
  yPosC = height/56*16.5; 
  xPosC1 = width/56*30;
  yPosC1 = height/56*12.5;
  xPosC2 = width/56*30;
  yPosC2 = height/56*12.5;
  
  xPosD = width/56*30;
  yPosD = height/56*16.5; 
  xPosD1 = width/56*33.5;
  yPosD1 = height/56*14.5; 
  xPosD2 = width/56*33.5;
  yPosD2 = height/56*14.5; 
 }
 
 void showBranch(){

  strokeWeight(weight);
  stroke(255, 255, 255, a);
  a = constrain(a,20,255);
  
  if(yPos < height/56*15){
   weight= weight+0.06;
   }
   
  if(weight > 3){
    a-=5;
  }
   
  point(width/2, yPos);
   yPos--;
    
    //LINE 1
    if(yPos < height/56*20){
      point(xPos1, yPos1); 
       xPos1--;
       yPos1 -= 1.75;
       
       //LINE A
      if(yPos1 < height/56*16.5){
       point(xPosA, yPosA); 
        xPosA-=1.75;
        yPosA--;
        //LINE A1 & A2
        if(yPosA <= height/56*14.5){
         point(xPosA1, yPosA1); 
         xPosA1--;
         point(xPosA2, yPosA2);
         xPosA2--;
         yPosA2 -= 1.75;
        }
      }
       //LINE B
      if(yPos1 < height/56*16.5){
       point(xPosB, yPosB); 
        yPosB--;
        //LINE B1 & B2
        if(yPosB < height/56*12.5){
         point(xPosB1, yPosB1); 
         xPosB1--;
         yPosB1 -= 1.75;
         point(xPosB2, yPosB2);
         xPosB2++;
         yPosB2 -= 1.75;
        }
      }
    }
    //LINE 2
    if(yPos < height/56*20){
      point(xPos2, yPos2); 
       xPos2++;
       yPos2 -= 1.75; 
      //LINE C
      if(yPos2 < height/56*16.5){
       point(xPosC, yPosC); 
        yPosC--;
        //LINE C1 & C2
         if(yPosC < height/56*12.5){
         point(xPosC1, yPosC1); 
         xPosC1--;
         yPosC1 -= 1.75;
         point(xPosC2, yPosC2);
         xPosC2++;
         yPosC2 -= 1.75;
        }
      }
      //LINE D
      if(yPos2 < height/56*16.5){
       point(xPosD, yPosD); 
       xPosD += 1.75;
       yPosD--;
       //LINE D1 & D2
       if(yPosD <= height/56*14.5){
         point(xPosD1, yPosD1); 
         xPosD1++;
         yPosD1 -= 1.75;
         point(xPosD2, yPosD2);
         xPosD2++;         
        }
      }
    } 

 }
}

