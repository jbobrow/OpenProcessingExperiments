

//All general sizes
int centerPacmanX = 430;
int centerPacmanY = 430;
int sizePacman = 700;
int sizeStomach = 100;
int sizeFood = 40;
float anglePacmanMouthAlpha = radians(25);
float anglePacmanMouthBeta = radians(340);
float angleIncreaseEatingAlpha;
float angleIncreaseEatingBeta;
int centerEyeX = centerPacmanX- 30;
int centerEyeY = centerPacmanY- 190;
int sizeEyeX = 90;
int sizeEyeY = 80;
int pupilSize = 40;
int poopPosX = 0;
int poopPosY = 0;
float irisSizeX = 30;
float irisSizeY = 20;

//Body Parts
MatrixBG bg;
Stomach stomach;
Brain brain;
Heart heart;
Food food;

//Time and frame counters
int time = 0; //<- This is actually nb of frames!
int lastMillCount = 0;
int timeOfDinner = 0;
int millToGulp = 1200;
int millToSwallow = 6000;
int millToIngest = 18000;
int millToExpulsion = 24000;



//Starting Conditions
int positionFoodX = -100;
int positionFoodY = -100;
boolean foodTaken = false;
boolean foodEaten = false;
String fString = "";
int sizePoop = 0;
 
//Computational variables
float openingMouthUpX;
float openingMouthUpY;
float openingMouthDownX;
float openingMouthDownY;
float randomScaledDistanceForExcitation;
float mOpeningMouthDown;
float mOpeningMouthUp;
float cOpeningMouthDown;
float cOpeningMouthUp;
float vectorEyeX;
float vectorEyeY;
int positionFoodEntranceX = 0;
int positionFoodEntranceY = 0;

void setup(){
  //Loading
  //frameRate(20);
    
  openingMouthDownX = centerPacmanX + (sizePacman/2)*cos(anglePacmanMouthAlpha);
  openingMouthDownY = centerPacmanY + (sizePacman/2)*sin(anglePacmanMouthAlpha);
  openingMouthUpX = centerPacmanX + (sizePacman/2)*cos(anglePacmanMouthBeta);
  openingMouthUpY = centerPacmanY + (sizePacman/2)*sin(anglePacmanMouthBeta);
  mOpeningMouthUp = (centerPacmanY-openingMouthUpY)/(centerPacmanX-openingMouthUpX);
  cOpeningMouthUp = centerPacmanY - mOpeningMouthUp*centerPacmanX;
  mOpeningMouthDown = (centerPacmanY-openingMouthDownY)/(centerPacmanX-openingMouthDownX);
  cOpeningMouthDown = centerPacmanY - mOpeningMouthDown*centerPacmanX;
 
  angleIncreaseEatingAlpha = 0;
  angleIncreaseEatingBeta = 0;

  randomScaledDistanceForExcitation = abs(openingMouthUpY-centerPacmanY)*3;
  println(randomScaledDistanceForExcitation);
 
  
  //Set UP
  //cursor(CROSS);
  size(1200, 1200);
  smooth();
  bg = new MatrixBG();
  stomach = new Stomach(centerPacmanX, centerPacmanY, sizeStomach);
  brain = new Brain();
  heart = new Heart(centerPacmanX, centerPacmanY);
  food = new Food(positionFoodX, positionFoodY, sizeFood);
  
  drawPacman();
  
  
  //ellipse(positionHeartX - 15, positionHeartY - 10, 50, 50);
  //ellipse(positionHeartX + 15, positionHeartY - 10, 50, 50);
  //triangle(positionHeartX + 38,positionHeartY, positionHeartX - 38, positionHeartY, positionHeartX, positionHeartY + 45);


}


void draw(){
  int deltaTime = millis()-lastMillCount;
  time++;
  bg.update();
  
  //COMPUTATION DEPENDING ON POSITION FOOD
  int x2Minusx1 = mouseX-centerPacmanX;
  int y2Minusy1 = mouseY-centerPacmanY;
  float distanceFromPacman = sqrt (x2Minusx1*x2Minusx1+y2Minusy1*y2Minusy1) - sizePacman/2;
  if(foodEaten){
    int timeIntoDigestion = millis()-timeOfDinner;
    if(timeIntoDigestion < millToGulp){
      sizePoop = 0;
      float factor = (float)timeIntoDigestion/(float)millToGulp;
      positionFoodX = (int) ((float)positionFoodEntranceX*(1-factor) + (float)centerPacmanX*factor);
      positionFoodY = (int) ((float)positionFoodEntranceY*(1-factor) + (float)centerPacmanY*factor);
      angleIncreaseEatingAlpha = -anglePacmanMouthAlpha*factor;
      angleIncreaseEatingBeta = ((PI*2)-anglePacmanMouthBeta)*factor;
    }
    else if(timeIntoDigestion < millToSwallow){
      float factor = (float)(timeIntoDigestion-millToGulp)/(float)(millToSwallow-millToGulp);
      stomach.cycleAdd(deltaTime);
      positionFoodX = (int)((1-factor)*centerPacmanX+factor*stomach.getIntestinX(-1));
      if(factor > 0.2){
        food.breakInPieces();
      }
      if(factor > 0.8){
        food.dustIt();
      }
    }
    else if(timeIntoDigestion < millToIngest){
      float factor = 13*(float)(timeIntoDigestion-(millToSwallow))/(float)(millToIngest-(millToSwallow));
      int lastPosX = stomach.getIntestinX((int) (factor)-1);
      int lastPosY = stomach.getIntestinY((int) (factor)-1);
      int directionX = stomach.getIntestinX((int) (factor));
      int directionY = stomach.getIntestinY((int) (factor));
      stomach.swellIntestin((int) (factor));
      positionFoodX = (int) ((factor%1)*(float)directionX + (1-(factor%1))*(float)lastPosX);
      positionFoodY = (int) ((factor%1)*directionY + (1-(factor%1))*lastPosY);
      if(factor > 11){
        poopPosX = stomach.getIntestinX(12);
        poopPosY = stomach.getIntestinY(12);
        sizePoop += deltaTime;
      }
      food.randomMove();
    }
    else if(timeIntoDigestion < millToExpulsion){
      food = new Food(-100, -100, sizeFood);
      positionFoodX = -100;
      positionFoodY = -100;
      float factor = (float)(timeIntoDigestion-(millToIngest))/(float)(millToExpulsion-(millToIngest));
      stomach.swellIntestin(100);
      poopPosX = (int)( factor*(-sizePoop) + (1-factor)*stomach.getIntestinX(12));
    }
    else{
      foodEaten = false;
      angleIncreaseEatingAlpha = 0;
      angleIncreaseEatingBeta = 0;
      timeIntoDigestion = 0;
    }
  }
  if(foodTaken){
    if(distanceFromPacman > 0){
      positionFoodX = mouseX;
      positionFoodY = mouseY;
      float xDistFromEye = (float) (mouseX-centerEyeX);
      float yDistFromEye = (float) (mouseY-centerEyeY);
      float distFromEyelength = sqrt (xDistFromEye*xDistFromEye + yDistFromEye*yDistFromEye);
      vectorEyeX =((sizeEyeX-pupilSize/2)*distanceFromPacman*xDistFromEye/(distFromEyelength*(height)));
      vectorEyeY =((sizeEyeY-pupilSize/2)*distanceFromPacman*yDistFromEye/(distFromEyelength*(height)));
      float lengthVector = sqrt (vectorEyeX*vectorEyeX + vectorEyeY*vectorEyeY);
      vectorEyeX = vectorEyeX*((sizeEyeX-pupilSize/2)/(lengthVector*2)) - vectorEyeX;
      vectorEyeY = vectorEyeY*((sizeEyeY-pupilSize/2)/(lengthVector*2)) - vectorEyeY;
    }else  if(mouseY > mOpeningMouthUp*mouseX + cOpeningMouthUp && mouseY < mOpeningMouthDown*mouseX + cOpeningMouthDown ){
      foodEaten = true;
      foodTaken = false;
      timeOfDinner = millis();
      positionFoodEntranceX = mouseX;
      positionFoodEntranceY = mouseY;
    }else{
      foodTaken = false;
    }
  }
  //x2Minusx1 = positionFoodX-(centerPacmanX+sizePacman/2);
  //y2Minusy1 = positionFoodY-centerPacmanY;
  float distanceFromMouthMiddle = dist(positionFoodX, positionFoodY, (centerPacmanX+sizePacman/2), centerPacmanY);
  float distanceFromMouthDown = dist(positionFoodX, positionFoodY, openingMouthUpX, openingMouthUpY);
  float distanceFromMouthUp = dist(positionFoodX, positionFoodY, openingMouthDownX, openingMouthDownY);
  distanceFromMouthMiddle = min(min(distanceFromMouthDown, distanceFromMouthUp), distanceFromMouthMiddle);
  //sqrt (x2Minusx1*x2Minusx1+y2Minusy1*y2Minusy1);
  /**if(y2Minusy1 > 0){
    x2Minusx1 = positionFoodX - (int)openingMouthDownX;
    y2Minusy1 = positionFoodY - (int)openingMouthDownY;
    float distanceFromMouthDown = sqrt (x2Minusx1*x2Minusx1+y2Minusy1*y2Minusy1);
    distanceFromMouthMiddle = min(distanceFromMouthMiddle, distanceFromMouthDown);
  }else{
    x2Minusx1 = positionFoodX - (int)openingMouthUpX;
    y2Minusy1 = positionFoodY - (int)openingMouthUpY;
    float distanceFromMouthUp = sqrt (x2Minusx1*x2Minusx1+y2Minusy1*y2Minusy1);
    distanceFromMouthMiddle = min(distanceFromMouthMiddle, distanceFromMouthUp);
  }*/
  float irisOpeningFactor = 1 - (min(randomScaledDistanceForExcitation, distanceFromMouthMiddle)/randomScaledDistanceForExcitation);
  irisSizeX = 25+ 10*(irisOpeningFactor);
  irisSizeY = 10+ 25*(irisOpeningFactor);
  
  //REFRESH
  drawPacman();
  //Draw his eye
  //Create a vector whose side depends on the distance to the center of the pacman
  //but whose direction depends on the center of the eye.

  //PUPIL
  fill(color(0,0,0));
  ellipse(centerEyeX+vectorEyeX,centerEyeY+vectorEyeY, pupilSize, pupilSize);  
  //IRIS
  fill(color(255,255,255)); 
  ellipse(centerEyeX+vectorEyeX,centerEyeY+vectorEyeY, irisSizeX, irisSizeY);
  //FOOD
  food.update(positionFoodX, positionFoodY);
  //Poop
  fill(color(20,40,20)); 
  strokeWeight(0); 
  ellipse(poopPosX, poopPosY, sizePoop/15, sizePoop/15); 
  
  /**
  strokeWeight(2);
  stroke(color(255,255,255));
  line(0, cOpeningMouthUp, -cOpeningMouthUp/mOpeningMouthUp, 0);
  line(-cOpeningMouthDown/mOpeningMouthDown, 0, width, mOpeningMouthDown*width + cOpeningMouthDown);
  
  strokeWeight(10);
  point(openingMouthUpX, openingMouthUpY);
  point(openingMouthDownX, openingMouthDownY);
  **/
  
  
  lastMillCount = millis();
  
}

void drawPacman(){
  
  //The Pacman
  strokeWeight(0);
  stroke(color(0,0,0));
  fill(color(10,30,10));
  arc(centerPacmanX,centerPacmanY, sizePacman,sizePacman, anglePacmanMouthAlpha+angleIncreaseEatingAlpha, anglePacmanMouthBeta+angleIncreaseEatingBeta);
  
  strokeWeight(5);
  fill(color(255,255,255));
  ellipse(centerEyeX,centerEyeY, sizeEyeX, sizeEyeY);
  
  //INSIDE Pacman
  brain.update();
  stomach.update();
  heart.update();
}


void mousePressed(){
  if(mouseButton == RIGHT){
    if(!foodEaten && mouseX > positionFoodX-(sizeFood/2) && mouseX < positionFoodX+(sizeFood/2) && mouseY > positionFoodY-(sizeFood/2) && mouseY < positionFoodY+(sizeFood/2)){
      foodTaken = true;
    }
  }else if(!foodEaten){
    foodTaken = true;
    
  }
}

void keyPressed(){
  if(key =='d'){
    centerPacmanX++;
    centerEyeX++;
  }
  
  if(key =='a'){
    centerPacmanX--;
    centerEyeX--;
    
  }
  if(key =='w'){
    centerPacmanY--;
    centerEyeY--;
  }
  
  if(key =='s'){
    centerPacmanY++;
    centerEyeY++;
    
  }
  heart.changePosition();
  stomach.changePosition(centerPacmanX, centerPacmanY);
  brain.changePosition();
}

