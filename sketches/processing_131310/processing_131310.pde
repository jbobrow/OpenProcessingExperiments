
Spider spider1;
ArrayList spiderList;
ArrayList flyList;
PGraphics drawBuf;
boolean isFly;
boolean isWeb;
PVector tempWasPos = new PVector(0.0,0.0);
PVector flyPos = new PVector(0.0,0.0);
ArrayList tempSpiderTrail = new ArrayList();
boolean isOnTitleScreen = true;
PImage startImg, bgImg;

void setup() {
  size(500,500);
  drawBuf = createGraphics(width,height,JAVA2D);
  spiderList = new ArrayList();
  flyList = new ArrayList();
  spider1 = new Spider(50.0,50.0);
  spiderList.add(spider1);
  background(255);
  bgImg = loadImage("gamescreen.jpg");
  startImg = loadImage("startscreen.jpg"); 
}

void moveInsects(int mil)
{
  if (flyList.size()<=0){
    isFly = false;
  }
  else{
    isFly = true;     }
    
  for (int i=0;i<spiderList.size();i++){
    Spider currentSpider = (Spider)spiderList.get(i);
    currentSpider.findFly(isFly,flyList,drawBuf);
    tempWasPos = currentSpider.getWasPos();
    drawBuf.beginDraw();

    drawBuf.stroke(0,0,0);
    drawBuf.line(tempWasPos.x,tempWasPos.y,currentSpider.getXPos(),currentSpider.getYPos());
    tempSpiderTrail.add(tempWasPos);
    tempWasPos = new PVector();
    tempWasPos.x = currentSpider.getXPos();
    tempWasPos.y = currentSpider.getYPos();
    currentSpider.setWasPos(tempWasPos);
    currentSpider.addToSpiderTrail(tempWasPos);
    drawBuf.endDraw();
  }
  for (int i=0; i<flyList.size();i++){
    Fly currentFly = (Fly)flyList.get(i);
    flyPos.x = currentFly.getXPos();
    flyPos.y = currentFly.getYPos();
    boolean isWeb = currentFly.getStuckState();
    //looking to see if it flies into a web
    for (int j=0;j<spiderList.size();j++){
      Spider anotherSpider = (Spider)spiderList.get(j);
      for (int k=0; k<(anotherSpider.getSpiderTrail()).size();k++){
        PVector anotherWasPos = (PVector) (anotherSpider.getSpiderTrail()).get(k);
        float d = anotherWasPos.dist(flyPos);
        if(abs(d)<=1){
          currentFly.setStuckState(true);
        }
       }//end spidertrail loop
      PVector spiderPos = new PVector();
      spiderPos.x = anotherSpider.getXPos();
      spiderPos.y = anotherSpider.getYPos();
      float spiderDist = spiderPos.dist(flyPos);
      if (abs(spiderDist)<=3 && currentFly.getSeconds()==0){
           currentFly.setStuckState(true);
           currentFly.setStartTime(mil);
           currentFly.setSeconds(1);
      }
      int timeDif = mil-currentFly.getStartTime();
      int timeIncrement = (int)(timeDif/5000); //actually not seconds, very arbitrary :(
      if(timeIncrement==1 && currentFly.getSeconds()!=0.0){
         currentFly.addSeconds();
         anotherSpider.increaseSize();
      }
      if(currentFly.getSeconds()>=7){
          anotherSpider.addFliesEaten();
      }
      if (anotherSpider.getFliesEaten()==4){
         anotherSpider.setFliesEaten(0);
         Spider spidey = new Spider(anotherSpider.getXPos(),anotherSpider.getYPos());
         spiderList.add(spidey);
         anotherSpider.resetSize();
      }   
    }//end spider loop
    if(currentFly.getSeconds()>=7){
      currentFly.setEatenState(true);
    }
    
    if (currentFly.getEatenState()==false){  
      currentFly.drawFly(isWeb);
    }
    else{
      flyList.remove(i);
      i--;
    }
  }//end fly loop
}

void draw() {
  int m = millis();
  if (isOnTitleScreen){
   image(startImg, 0, 0);
   m=0; 
   if (keyPressed && key == ' '){
     isOnTitleScreen = false;
     }
 }
 else{ 
   background(255);
   //image(bgImg, 0, 0);
   moveInsects(m);
   image(drawBuf,0,0);
   if (keyPressed && key == 'c'){ //c to clear/reset
     drawBuf = createGraphics(width,height,JAVA2D);
     spiderList = new ArrayList();
     flyList = new ArrayList();
     spider1 = new Spider(50.0,50.0);
     spiderList.add(spider1);
     }
 } 
}

void mousePressed() {
  if(isOnTitleScreen==false){
    Fly newFly = new Fly(mouseX,mouseY);
    flyList.add(newFly);  
  }
}



class Fly{
  float xPos, yPos;
  boolean eatenState;
  boolean stuckState;
  int milStart = 0;
  int totalTime = 0;
  float max_acc = .05;
  float max_vel = .4;
  float z_limit = 6;
  float dx, dy, dz; 
  
  Fly(float tempX, float tempY){
    xPos = tempX;
    yPos = tempY;
    dx = random(-max_vel,max_vel);
    dy = random(-max_vel,max_vel);
    dz = random(-max_vel,max_vel);  
  }
  
  float getXPos(){
      return xPos;
  }
  
  float getYPos(){
      return yPos;
  }

  boolean getEatenState(){
    return eatenState;
  }
  
  void setEatenState(boolean tempEatenState){
    eatenState = tempEatenState;
  }
  
  boolean getStuckState(){
      return stuckState;
  }
  
  void setStuckState(boolean tempStuckState){
      stuckState = tempStuckState;
  }
  
  int getSeconds(){
      return totalTime;  
  }
  
  int getStartTime(){
      return milStart;
  }
  
  void setStartTime(int tempMilStart){
      milStart = tempMilStart;  
  }
  
  void addSeconds(){
    totalTime = totalTime + 1;
  }
  void setSeconds(int newTime){
      totalTime = newTime;
  }
  
  void drawFly(boolean tempIsWeb){  
    fill(0);
    ellipse(xPos,yPos,10,6);
    noFill();
    stroke(0);
    ellipse(xPos,yPos-3,5,7);
    ellipse(xPos,yPos+3,5,7);
    if (tempIsWeb==false){
      moveFly();
      changeMomentum();
    }
  }
  
  void moveFly(){
    xPos+=dx;
    yPos+=dy;
    xPos+=dz;
    if(xPos > width) {xPos = width; dx = 0;}
    if(xPos < 0) {xPos = 0; dx = 0;}
    if(yPos > height) {yPos = height; dy = 0;}
    if(yPos < 0) {yPos = 0; dy = 0;}   
  }
   void changeMomentum()
  {
    dx += random(-max_acc, max_acc);
    dy += random(-max_acc, max_acc);
    dz += random(-max_acc, max_acc);
   
    if(dx >  max_vel) dx =  max_vel;
    if(dx < -max_vel) dx = -max_vel;
    if(dy >  max_vel) dy =  max_vel;
    if(dy < -max_vel) dy = -max_vel;
    if(dz >  max_vel) dz =  max_vel;
    if(dz < -max_vel) dz = -max_vel;
  }
}
class Spider{
  float endX;   // Final x-coordinate
  float endY;   // Final y-coordinate
  float beginX,beginY;
  float distX, distY;          // Y-axis distance to move
  float exponent;   // Determines the curve
  float xPos, yPos;        // Current y-coordinate
  float prevXPos, prevYPos;
  float spiralX,spiralY;
  float step = 0.0008;    // Size of each step along the path
  float pct = 0.0;      // Percentage traveled (0.0 to 1.0)
  float mySize;
  float flyX, flyY;
  float distance, smallestDist;
  float r = 0;
  float theta = 0;
  PVector wasPos = new PVector(0.0,0.0);
  ArrayList spiderTrail = new ArrayList();
  int numFliesEaten = 0;
  
  Spider(float momX, float momY){
    xPos = momX;
    yPos = momY;
    mySize = 10.0;
    exponent = 1.2;
    spiralX=0;
    spiralY=0;
    wasPos.x=xPos;
    wasPos.y=yPos;
  }
  
  void findFly(boolean isFly, ArrayList flyList, PGraphics tempBuf) {
    beginX = xPos;
    beginY = yPos;

    if (isFly){
      for (int i=0;i<flyList.size();i++){
        Fly currentFly = (Fly)flyList.get(i);
        flyX = currentFly.getXPos();
        flyY = currentFly.getYPos();
        distance = dist(xPos,yPos,flyX,flyY);
        if (i==0 || distance < smallestDist){
          smallestDist = distance;
          endX = flyX-spiralX;
          endY = flyY-spiralY;
        }
      } //end for loop
      distX = endX-beginX;
      distY = endY-beginY;
      pct+=step;
      if (pct<1.0){
        xPos= beginX + ((pct*distX))/2.0;
        yPos = beginY + (pow(pct,exponent)*distY)/2.0;
      }
      else{
        pct = 0.0;
      }
    }//end if isFly
    else{
        spiralX = r*cos(theta)*2;
        spiralY = r*sin(theta)*2;
        theta+=0.05;
        r+=0.05;  
    }    
    
    fill(0);
    ellipse(xPos+spiralX,yPos+spiralY,mySize,mySize);
 
  }
  
  void increaseSize(){
    mySize = mySize+0.5;
  }
  
  void resetSize(){
    mySize = 10.0;
  }
  
  void resetRadius(){
    r = 0;
  }
  ArrayList getSpiderTrail(){
    return spiderTrail;
  }
 
  void addToSpiderTrail(PVector vect){
    spiderTrail.add(vect);
  }

  PVector getWasPos(){
    return wasPos;
  } 
  
  void setWasPos(PVector newWasPos){
    wasPos = newWasPos;
  }
  float getXPos(){
    return xPos+spiralX;}
    
  float getYPos(){
    return yPos+spiralY;}
    
  void addFliesEaten(){
    numFliesEaten = numFliesEaten + 1;
  }
  
  int getFliesEaten(){
    return numFliesEaten;
  }
  
  void setFliesEaten(int numFlies){
    numFliesEaten = numFlies;
    
  }
}//END


