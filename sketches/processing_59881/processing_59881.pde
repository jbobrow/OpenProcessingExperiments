
class Alien {

//body
int bodyXLoc; 
int bodyYLoc; 
int bodyWidth;
int bodyHeight;

//eye
int eyeWidth;
int eyeHeight;
float eyeXLoc;
float eyeYLoc;
int speed = 10;

//flashing eyes
float r;
float g;
float b;

Alien (int tempbodyXLoc,int tempbodyYLoc,int tempbodyWidth,int tempbodyHeight){
  bodyXLoc = tempbodyXLoc;
  bodyYLoc = tempbodyYLoc;
  bodyWidth = tempbodyWidth;
  bodyHeight = tempbodyHeight;
}

void drawBody(){ //body of alien
  fill(46,113,46); //body colour of alien
  ellipse(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);
}

void drawTopLeftEye(){ //green part of left eye
  eyeWidth = bodyWidth - 225;
  eyeHeight = eyeWidth;
  eyeXLoc = bodyXLoc - 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top left eye
  ellipse(eyeXLoc + 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle left eye
  ellipse(eyeXLoc + 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom left eye
}
  
void drawTopRightEye(){ //green part of right eye
  eyeWidth = eyeWidth;
  eyeHeight = eyeHeight;
  eyeXLoc = bodyXLoc + 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top right eye
  ellipse(eyeXLoc - 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle right eye
  ellipse(eyeXLoc - 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom right eye
}  
  
void drawTopLeftEyeWhite(){ //white part of left eye
  fill (r=random(255), g=random(255), b=random(255)); //flashing random colours on eye
  eyeWidth = bodyWidth - 250;
  eyeHeight = eyeWidth;
  eyeXLoc = bodyXLoc - 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top left eye
  ellipse(eyeXLoc + 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle left eye
  ellipse(eyeXLoc + 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom left eye
}  
  
void drawTopRightEyeWhite(){ //white part of right eye
  eyeWidth = eyeWidth;
  eyeHeight = eyeHeight;
  eyeXLoc = bodyXLoc + 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top right eye
  ellipse(eyeXLoc - 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle right eye
  ellipse(eyeXLoc - 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom right eye
}  
  
void drawTopLeftEyeBlack(){ //black part of left eye
  fill(0);
  eyeWidth = bodyWidth - 280;
  eyeHeight = eyeWidth;
  eyeXLoc = bodyXLoc - 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top left eye
  ellipse(eyeXLoc + 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle left eye 
  ellipse(eyeXLoc + 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom left eye
}
  
void drawTopRightEyeBlack(){ //black part of right eye
  eyeWidth = eyeWidth;
  eyeHeight = eyeHeight;
  eyeXLoc = bodyXLoc + 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top right eye
  ellipse(eyeXLoc - 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle right eye
  ellipse(eyeXLoc - 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom right eye
}
  
void drawTopLeftEyeGlint(){ //white glint in left eye
  fill(255);
  eyeWidth = bodyWidth - 290;
  eyeHeight = eyeWidth;
  eyeXLoc = bodyXLoc - 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top left eye
  ellipse(eyeXLoc + 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle left eye
  ellipse(eyeXLoc + 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom left eye
}
  
void drawTopRightEyeGlint(){ //white glint in right eye
  eyeWidth = eyeWidth;
  eyeHeight = eyeHeight;
  eyeXLoc = bodyXLoc + 100;
  eyeYLoc = bodyYLoc - (1.2 * bodyHeight);
  ellipse(eyeXLoc, eyeYLoc, eyeWidth, eyeHeight); //top right eye
  ellipse(eyeXLoc - 35, eyeYLoc + 65, eyeWidth, eyeHeight); //middle right eye
  ellipse(eyeXLoc - 75, eyeYLoc + 127, eyeWidth, eyeHeight); //bottom right eye
}  
  
void drawMouth(){ //mouth of alien
  fill(180,80,107); //colour of mouth of alien
  ellipse(bodyXLoc, bodyYLoc + 20, bodyWidth / 3.75, bodyHeight / 1.7); //mouth of alien
}

void drawMove(){ //allowing the alien to move
  bodyXLoc = bodyXLoc + speed; 
}
void checkForBounce(){ //allowing the alien to hit off the sides
  if(bodyXLoc > width - (bodyWidth/2)){
     speed = speed - 1; //bounce hitting off the right wall
  } 
  if(bodyXLoc < 0 + (bodyWidth/2)){
     speed = speed + 1; //bounce hitting off the left wall
  }  
}


}//end class

