
class Balloon{
  float balloonSize, balloonTextSize, balloonLength, posX1, posY1, posX2, posY2, posXCenter, posYCenter;
  float ellipseX1, ellipseY1;
  float prevPosX1, prevPosY1;
  float targetX1 = width/2;
  float targetY1 = height/2;
  String naam, leeftijd;
  boolean isDirectedUp;
  boolean isDirectedLeft;
  boolean targetReached = false;
  float speedLeft, speedUp;
  color balloonColor, textColor, strokeColor;
  Calendar birthDay;
  Cord cord;
  
  public Balloon(float _balloonSize, String _naam, String _leeftijd, Calendar _birthDay){
    int bColorR = round(random(150,255));
    int bColorG = round(random(150,255));
    int bColorB = round(random(150,255));
    balloonColor = color(bColorR, bColorG, bColorB);
    
    int tColorR = bColorR - 70;
    int tColorG = bColorG - 70;
    int tColorB = bColorB - 70;
    textColor = color(tColorR, tColorG, tColorB);
    
    strokeColor = color(tColorR + 30, tColorG + 30, tColorB + 30);
    
    balloonTextSize = map(_balloonSize, 10, 365, 2, 75);
    balloonSize = _balloonSize;
    naam = _naam;
    leeftijd = _leeftijd;
    balloonLength = balloonSize * 1.1;
    birthDay = _birthDay;
    posX2 = posX1 + balloonSize;
    posY2 = posY1 + balloonLength;    
    posXCenter = posX1 + (balloonSize / 2);
    posYCenter = posY1 + (balloonLength / 2);
    
    ellipseX1 = posX1 + (balloonSize / 2);
    ellipseY1 = posY1 + (balloonLength / 2);
    cord = new Cord(posXCenter,posY2,balloonLength);
  }
  
  void display(){
    fill(balloonColor);
    stroke(strokeColor);
    if(mouseX > posX1 && mouseX < posX2 && mouseY > posY1 && mouseY < posY2){
      println("hover");
      if(mousePressed){
        targetX1 = mouseX;
        targetY1 = mouseY;
        println("clicked");
      }
    }
    else{
      if(posX1-targetX1 < 80 && posX1-targetX1 > -80){
        setTarget();
      }
      if(posX1 < 0 || posX2 > width || posY1 < 0 || posY2 > height){
        float multiplierX = round(random(1,20));
        float multiplierY = round(random(1,20));
        targetX1 = width/20*multiplierX;
        targetY1 = height/20*multiplierY;
      }
    }
    
    ellipse(ellipseX1, ellipseY1, balloonSize, balloonLength);
    textAlign(CENTER,BOTTOM);
    fill(textColor);
    textFont(font, (int)balloonTextSize); 
    text(naam, posX1, posY1, balloonSize, balloonLength / 8 * 3);
    
    
    textAlign(CENTER,TOP);
    fill(strokeColor);
    textFont(font, (int)balloonTextSize *1.5); 
    text(leeftijd, posX1, posY1 + balloonLength/8*4, balloonSize, balloonLength/8*4);
    cord.display();
  }
  
  void setTarget(){
    float index = random(0, 4);
    float directionChange = width * 0.2;
    if(index < 1){
      targetX1 = targetX1 + random(-directionChange, 0);
      targetY1 = targetY1 + random(-directionChange, 0);
    }
    else if(index < 2){
      targetX1 = targetX1 + random(0, directionChange);
      targetY1 = targetY1 + random(0, directionChange);
    }
    else if(index < 3){
      targetX1 = targetX1 + random(-directionChange, 0);
      targetY1 = targetY1 + random(0, directionChange);
    }
    else if(index < 4){
      targetX1 = targetX1 + random(0, directionChange);
      targetY1 = targetY1 + random(-directionChange, 0);
    }
  }
  
  
  void setPosition(float _posX1, float _posY1){
    prevPosX1 = posX1;
    prevPosY1 = posY1;
    posX1 = _posX1;
    posY1 = _posY1;
    updateAttributes();
    determineDirection();
    cord.setPosition(posXCenter, posY2, speedLeft, speedUp);
  }
  
  void determineDirection(){
    speedLeft = prevPosX1 - posX1;
    speedUp = prevPosY1 - posY1;
  }
  
  void updateAttributes(){
    posX2 = posX1 + balloonSize;
    posY2 = posY1 + balloonLength;    
    posXCenter = posX1 + (balloonSize / 2);
    posYCenter = posY1 + (balloonLength / 2);
    ellipseX1 = posX1 + (balloonSize / 2);
    ellipseY1 = posY1 + (balloonLength / 2);
  }
  
  void update(){
    cord.update();
  }


}

