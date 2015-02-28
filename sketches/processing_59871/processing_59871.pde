
class Alien{ // START CLASS ALIEN
  
  int bodyXLoc;
  int bodyYLoc;
  int bodyWidth;
  int bodyHeight;
  
  int headXLoc;
  int headYLoc;
  int headWidth;
  int headHeight;

  int eyeRWidth;
  int eyeRHeight;
  int eyeRXLoc;
  int eyeRYLoc;
  
  int eyeballRWidth;
  int eyeballRHeight;
  int eyeballRXLoc;
  int eyeballRYLoc;
  
  int eyeCWidth;
  int eyeCHeight;
  int eyeCXLoc;
  int eyeCYLoc;
  
  int eyeballCWidth;
  int eyeballCHeight;
  int eyeballCXLoc;
  int eyeballCYLoc;
  
  int eyeLWidth;
  int eyeLHeight;
  int eyeLXLoc;
  int eyeLYLoc;
  
  int eyeballLWidth;
  int eyeballLHeight;
  int eyeballLXLoc;
  int eyeballLYLoc;

  int mouthXLoc;
  int mouthYLoc;
  int mouthHeight;
  int mouthWidth;
  
  int tongueXLoc;
  int tongueYLoc;
  int tongueWidth; 
  int tongueHeight;
  
  int nostrilLXLoc;
  int nostrilLYLoc;
  int nostrilLWidth;
  int nostrilLHeight;
  
  int nostrilRXLoc;
  int nostrilRYLoc;
  int nostrilRWidth;
  int nostrilRHeight; 
  
  int RarmXLoc;
  int RarmYLoc;
  int RarmHeight;
  int RarmWidth;
  
  int LarmXLoc;
  int LarmYLoc;
  int LarmHeight;
  int LarmWidth;
  
  int RlegXLoc;
  int RlegYLoc;
  int RlegHeight;
  int RlegWidth;
  
  int ClegXLoc;
  int ClegYLoc;
  int ClegHeight;
  int ClegWidth;
  
  int LlegXLoc;
  int LlegYLoc;
  int LlegWidth;
  int LlegHeight;
  
  int speedXLoc;
  int speedYLoc;
  
 
Alien(int tempX, int tempY, int tempWidth, int tempHeight, int tempXSpeed, int tempYSpeed) {

 bodyXLoc = tempX;
 bodyYLoc = tempY;
 bodyWidth = tempWidth;
 bodyHeight = tempHeight;
// speedXLoc = tempXSpeed;
// speedYLoc = tempYSpeed;
 
 }
  //DRAW BODY
void drawbody(){
  fill(192,230,29);
  ellipse(bodyXLoc,bodyYLoc,bodyWidth,bodyHeight);
}
//DRAW HEAD
void drawhead(){
  fill(192,230,29);
  headXLoc = bodyXLoc;
  headYLoc = bodyYLoc - (bodyHeight / 2);
  headWidth = bodyHeight / 3;
  headHeight = bodyWidth;
  ellipse(headXLoc,headYLoc,headWidth,headHeight);
 } 
 //DRAW RIGHT EYE
void draweyeR(){
 fill(255);
eyeRXLoc = headXLoc - (bodyWidth / 3);
eyeRYLoc = headYLoc - (bodyWidth / 3);
eyeRWidth = headHeight / 2;
eyeRHeight = headWidth / 2;
ellipse(eyeRXLoc,eyeRYLoc,eyeRWidth,eyeRHeight);
  }
//DRAW CENTER EYE  
  void draweyeC(){
    fill(255);
    eyeCXLoc = headXLoc;
    eyeCYLoc = headYLoc - (headHeight / 2);
    eyeCWidth = headHeight / 4;
    eyeCHeight = headWidth / 4;
    ellipse(eyeCXLoc,eyeCYLoc,eyeCWidth,eyeCHeight);
  }
//DRAW LEFT EYE
void draweyeL(){
  fill(255);
  eyeLXLoc = headXLoc + (bodyWidth / 3);
  eyeLYLoc = headYLoc - (bodyWidth / 3);
  eyeLWidth = headHeight / 2;
  eyeLHeight = headWidth /2;
  ellipse(eyeLXLoc,eyeLYLoc,eyeLWidth,eyeLHeight);
}
//DRAW RIGHT EYEBALL
void draweyeballR(){
  fill(random(255),random(255),random(255)); // RANDOM EYEBALL COLOUR. STROBE EFFECT
  eyeballRXLoc = eyeRXLoc - (bodyWidth / 9);
  eyeballRYLoc = eyeRYLoc;
  eyeballRWidth = eyeRWidth / 4;
  eyeballRHeight = eyeRHeight / 2;
  ellipse(eyeballRXLoc,eyeballRYLoc,eyeballRWidth,eyeballRHeight);
}
//DRAW CENTER EYEBALL
void draweyeballC(){
  fill(random(255),random(255),random(255));
  eyeballCXLoc = eyeCXLoc; 
  eyeballCYLoc = eyeCYLoc;
  eyeballCWidth = eyeCWidth / 8;
  eyeballCHeight = eyeCHeight / 4;
  ellipse(eyeballCXLoc,eyeballCYLoc,eyeballCWidth,eyeballCHeight);
}
//DRAW LEFT EYEBALL
void draweyeballL(){
  fill(random(255),random(255),random(255));
  eyeballLXLoc = eyeLXLoc + (bodyWidth / 9);
  eyeballLYLoc = eyeLYLoc;
  eyeballLWidth = eyeLWidth / 4;
  eyeballLHeight = eyeLHeight / 2;
  ellipse(eyeballLXLoc,eyeballLYLoc,eyeballLWidth,eyeballLHeight);
}
  //DRAW MOUTH
 void drawmouth(){
   fill(0);
   mouthXLoc = headXLoc; 
   mouthYLoc = headYLoc + (headHeight / 6);
   mouthWidth = headHeight / 3;
   mouthHeight = headWidth / 2;
   ellipse(mouthXLoc,mouthYLoc,mouthWidth,mouthHeight);
 }
 //DRAW TONGUE
 void drawtongue(){
  fill(random(255),random(255),random(255)); 
   tongueXLoc = mouthXLoc;
   tongueYLoc = mouthYLoc + (headHeight / 6); 
   tongueWidth = mouthWidth / 2; 
   tongueHeight = mouthHeight;
   ellipse(tongueXLoc,tongueYLoc,tongueWidth,tongueHeight);
    }
 //DRAW LEFT NOSTRIL   
 void drawnostrilL(){
   fill(0,22,247); // BLUE
  nostrilLXLoc = headXLoc - (eyeballLHeight / 5);
  nostrilLYLoc = headYLoc - (eyeballLHeight / 2);
  nostrilLWidth = headHeight / 40;
  nostrilLHeight = headWidth / 10;
 ellipse(nostrilLXLoc,nostrilLYLoc,nostrilLWidth,nostrilLHeight);
 }
 //DRAW RIGHT NOSTRIL
  void drawnostrilR(){
   fill(0,22,247);
  nostrilRXLoc = headXLoc + (eyeballLHeight / 5);
  nostrilRYLoc = headYLoc - (eyeballLHeight / 2);
  nostrilRWidth = headHeight / 40;
  nostrilRHeight = headWidth / 10;
 ellipse(nostrilRXLoc,nostrilRYLoc,nostrilRWidth,nostrilRHeight);
 }
 
  //DRAW RIGHT ARM
  void drawRarm(){
     fill(39,129,44);
     RarmXLoc = bodyXLoc + (bodyHeight / 3);
     RarmYLoc = bodyYLoc - (bodyHeight / 5 );
     RarmWidth = bodyWidth;
     RarmHeight = bodyHeight / 6;
     ellipse(RarmXLoc,RarmYLoc,RarmWidth,RarmHeight);
   }
  //DRAW LEFT LEFT ARM
  void drawLarm(){
     LarmXLoc = bodyXLoc - (bodyHeight / 3);
     LarmYLoc = bodyYLoc - (bodyHeight / 5);
     LarmWidth = bodyWidth;
     LarmHeight = bodyHeight / 6;
     ellipse(LarmXLoc,LarmYLoc,LarmWidth,LarmHeight);
   }
   //DRAW LEFT LEG
 void drawLleg(){
   fill(39,129,44);
   LlegXLoc = headXLoc - (headWidth / 2);
   LlegYLoc = bodyYLoc + (bodyWidth);
   LlegWidth = bodyWidth / 3;
   LlegHeight = bodyHeight / 2;
   ellipse(LlegXLoc,LlegYLoc,LlegWidth,LlegHeight);
  }
  //DRAW CENTER LEG
  void drawCleg(){
    ClegXLoc = bodyXLoc;
    ClegYLoc = bodyYLoc + bodyWidth;
    ClegWidth = bodyWidth / 3;
    ClegHeight = bodyHeight / 2;
    ellipse(ClegXLoc,ClegYLoc,ClegWidth,ClegHeight);
  }
 //DRAW RIGHT LEG
 void drawRleg(){
   fill(39,129,44);
   RlegXLoc = headXLoc + (headWidth / 2);
   RlegYLoc = bodyYLoc + (bodyWidth);
   RlegWidth = bodyWidth / 3;
   RlegHeight = bodyHeight / 2;
   ellipse(RlegXLoc,RlegYLoc,RlegWidth,RlegHeight);
 } 

    
  //ALIEN MOVE AT TEMP SPEED IN X AND Y LOC
 void move() {
   bodyXLoc = bodyXLoc  + speedXLoc;
     bodyYLoc = bodyYLoc + speedYLoc;

}

//IF ALIEN TOUCHES EDGE OF CANVAS IT WILL BOUNCE OFF. MUST HAVE CORRECT PARAMETERS
void checkForBounce() {
    
  if(bodyXLoc > width - ((bodyWidth / 2) + (RarmWidth / 2))) {
     speedXLoc = speedXLoc * -1;
  } 
  if(bodyXLoc < 0 + (bodyWidth / 2 + (LarmWidth / 2))) {
     speedXLoc = speedXLoc * -1;
  } 
      if(bodyYLoc > height - (bodyHeight * 0.801 )) {
     speedYLoc = speedYLoc * -1;
  } 
  if(bodyYLoc < 0 + (bodyHeight / 2 + (headHeight / 1.5 ))) {
     speedYLoc = speedYLoc * -1;
  } 
 }
}
//END CLASS ALIEN








 
 
  

