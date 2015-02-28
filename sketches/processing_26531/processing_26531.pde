
//DECLARATIONS
float xPos, xPos1, xPos2;
float yPos, yPos1, yPos2;

float xPosA, xPosB, xPosC, xPosD;
float yPosA, yPosB, yPosC, yPosD;

float xPosA1, xPosA2, xPosB1, xPosB2, xPosC1, xPosC2, xPosD1, xPosD2;
float yPosA1, yPosA2, yPosB1, yPosB2, yPosC1, yPosC2, yPosD1, yPosD2;

//INTITIAL SETTINGS
void setup(){
  background(255);
  size(560, 560);
  smooth();
 
  yPos = height/2;

  xPos1 = width/2;
  yPos1 = height/56*12; 
  xPos2 = width/2;
  yPos2 = height/56*12;
  
  xPosA = width/56*24;
  yPosA = height/56*8; 
  xPosA1 = width/56*20;
  yPosA1 = height/56*8; 
  xPosA2 = width/56*20;
  yPosA2 = height/56*8;
  
  xPosB = width/56*24;
  yPosB = height/56*8; 
  xPosB1 = width/56*24;
  yPosB1 = height/56*4;
  xPosB2 = width/56*24;
  yPosB2 = height/56*4;
  
  xPosC = width/56*32;
  yPosC = height/56*8; 
  xPosC1 = width/56*32;
  yPosC1 = height/56*4;
  xPosC2 = width/56*32;
  yPosC2 = height/56*4;
  
  xPosD = width/56*32;
  yPosD = height/56*8; 
  xPosD1 = width/56*36;
  yPosD1 = height/56*8; 
  xPosD2 = width/56*36;
  yPosD2 = height/56*8;
}

void draw(){

  strokeWeight(3);

//1ST BRANCH
//1ST CONSTRUCTOR LINE 
  
  if(mouseY< height/2){
   point(width/2, yPos);
    yPos--;
    
    //LINE 1
    if(yPos < height/56*12){
      point(xPos1, yPos1); 
       xPos1--;
       yPos1--;
      //LINE A
      if(yPos1 < height/56*8){
       point(xPosA, yPosA); 
        xPosA--;
        //LINE A1 & A2
        if(xPosA < width/56*20){
         point(xPosA1, yPosA1); 
         xPosA1--;
         yPosA1++;
         point(xPosA2, yPosA2);
         xPosA2--;
         yPosA2--;
        }
      }
      //LINE B
      if(yPos1 < height/56*8){
       point(xPosB, yPosB); 
        yPosB--;
        //LINE B1 & B2
        if(yPosB < height/56*4){
         point(xPosB1, yPosB1); 
         xPosB1--;
         yPosB1--;
         point(xPosB2, yPosB2);
         xPosB2++;
         yPosB2--;
      }
    }
  }
    
    //LINE 2
    if(yPos < height/56*12){
      point(xPos2, yPos2); 
       xPos2++;
       yPos2--; 
      //LINE C
      if(yPos2 < height/56*8){
       point(xPosC, yPosC); 
        yPosC--;
        //LINE C1 & C2
         if(yPosC < height/56*4){
         point(xPosC1, yPosC1); 
         xPosC1--;
         yPosC1--;
         point(xPosC2, yPosC2);
         xPosC2++;
         yPosC2--;
        }
      }
      //LINE D
      if(yPos2 < height/56*8){
       point(xPosD, yPosD); 
       xPosD++;
       //LINE D1 & D2
       if(xPosD > width/56*36){
         point(xPosD1, yPosD1); 
         xPosD1++;
         yPosD1--;
         point(xPosD2, yPosD2);
         xPosD2++;
         yPosD2++;          
        }
      }
    }
 
 
  }
  
//2ND BRANCH
//2ND CONSTRUCTOR LINE  







  
//  if(yPos1<height/4 && mouseX>0){
//  line(xPos1, yPos1, xPos1-0.1, yPos1-0.1); 
//  xPos1--;
//  yPos1--;
//  }
//  
//  //line 1
//  if(mouseY<height/4 && mouseX>0){
//   line(xPos1, yPos1, xPos1-0.1, yPos1-0.1); 
//  xPos1--;
//  yPos1--;
//  }
}


