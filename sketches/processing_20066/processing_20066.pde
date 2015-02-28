

int time = 0;

int centerPacmanX = 430;
int centerPacmanY = 430;
int sizePacman = 700;
float anglePacmanMouthAlpha = radians(25);
float anglePacmanMouthBeta = radians(340);

int sizeFood = 40;
int positionHeartX = centerPacmanX+ 30;
int positionHeartY = centerPacmanY+ 170;
int positionCenterHeartY = centerPacmanY+ 140;
int centerEyeX = centerPacmanX- 30;
int centerEyeY = centerPacmanY- 190;
int sizeEyeX = 90;
int sizeEyeY = 80;
int pupilSize = 40;
float irisSizeX = 30;
float irisSizeY = 20;
int spaceBetweenLines = 50;


//Starting Conditions
int positionFoodX = - sizeFood;
int positionFoodY = - sizeFood;
float vectorEyeX;
float vectorEyeY;
boolean foodTaken = false;
PFont font8;
PFont font11;
PFont font14;
PFont font16;
String fString = "";
int nbBackgroundStrings;
String[] backgroundStrings;
int nbBackgroundStringsVertical;
String[] backgroundStringsVertical;
 
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

void setup(){
  //Loading
  //frameRate(20);
    
  font8 = loadFont("SynchroLET-8.vlw");
  font11 = loadFont("SynchroLET-11.vlw");
  font14 = loadFont("SynchroLET-14.vlw");
  font16 = loadFont("SynchroLET-16.vlw");
  openingMouthUpX = centerPacmanX + (sizePacman/2)*cos(anglePacmanMouthAlpha);
  openingMouthUpY = centerPacmanY + (sizePacman/2)*sin(anglePacmanMouthAlpha);
  openingMouthDownX = centerPacmanX + (sizePacman/2)*cos(anglePacmanMouthBeta);
  openingMouthDownY = centerPacmanY + (sizePacman/2)*sin(anglePacmanMouthBeta);
  mOpeningMouthUp = (centerPacmanY-openingMouthUpY)/(centerPacmanX-openingMouthUpX);
  cOpeningMouthUp = centerPacmanY - mOpeningMouthUp*openingMouthUpX;
  mOpeningMouthDown = (centerPacmanY-openingMouthDownY)/(centerPacmanX-openingMouthDownX);
  cOpeningMouthDown = centerPacmanY - mOpeningMouthDown*openingMouthDownX;
 
  randomScaledDistanceForExcitation = abs(openingMouthUpY-centerPacmanY)*3;
  println(randomScaledDistanceForExcitation);
 
  
  //Set UP
  //cursor(CROSS);
  size(1200, 1200);
  smooth();
  
  nbBackgroundStrings = (int) height/spaceBetweenLines;
  backgroundStrings = new String[nbBackgroundStrings];
  for(int i = 0; i<nbBackgroundStrings; i++ ){
    backgroundStrings[i] = "";
  }
  nbBackgroundStringsVertical = (int) width/spaceBetweenLines;
  backgroundStringsVertical = new String[nbBackgroundStringsVertical];
  for(int i = 0; i<nbBackgroundStringsVertical; i++ ){
    backgroundStringsVertical[i] = "";
  }
  
  drawBackground();
  drawPacman();
  
  
  //ellipse(positionHeartX - 15, positionHeartY - 10, 50, 50);
  //ellipse(positionHeartX + 15, positionHeartY - 10, 50, 50);
  //triangle(positionHeartX + 38,positionHeartY, positionHeartX - 38, positionHeartY, positionHeartX, positionHeartY + 45);


}


void draw(){
  time++;
  drawBackground();
  
  //COMPUTATION DEPENDING ON POSITION FOOD
  int x2Minusx1 = mouseX-centerPacmanX;
  int y2Minusy1 = mouseY-centerPacmanY;
  float distanceFromPacman = sqrt (x2Minusx1*x2Minusx1+y2Minusy1*y2Minusy1) - sizePacman/2;
  
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
    }
    /**
    if(mouseY > mOpeningMouthUp*mouseX + cOpeningMouthUp ){
      println("hey");
    } if(mouseY < mOpeningMouthDown*mouseX + cOpeningMouthDown){
      println("hin");
    }**/else{
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
  strokeWeight(0);
  fill(color(20,40,20));  
  rect(positionFoodX-(sizeFood/2),positionFoodY-(sizeFood/2), sizeFood, sizeFood);
  
  /**
  strokeWeight(2);
  stroke(color(255,255,255));
  line(0, cOpeningMouthUp, -cOpeningMouthUp/mOpeningMouthUp, 0);
  line(0, cOpeningMouthDown, -cOpeningMouthDown/mOpeningMouthDown, 0);
  
  strokeWeight(10);
  point(openingMouthUpX, openingMouthUpY);
  point(openingMouthDownX, openingMouthDownY);
  **/
}

void drawPacman(){
  
  //The Pacman
  strokeWeight(0);
  fill(color(10,30,10));
  arc(centerPacmanX,centerPacmanY, sizePacman,sizePacman, anglePacmanMouthAlpha, anglePacmanMouthBeta);
  
  strokeWeight(5);
  fill(color(255,255,255));
  ellipse(centerEyeX,centerEyeY, sizeEyeX, sizeEyeY);
  
  //INSIDE Pacman
  
  //BRAIN
  stroke(color(155,155,155));
  strokeWeight(0);
  fill(color(155,155,155));
  int centerBrainX = centerPacmanX - 130;
  int centerBrainY = centerPacmanY - 270;
  ellipse(centerBrainX,centerBrainY, 40, 40);
  arc(centerBrainX,centerBrainY, 50, 50, radians(10+time), radians(40+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(70+time), radians(100+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(130+time), radians(160+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(190+time), radians(220+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(250+time), radians(280+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(310+time), radians(340+time));
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 20, 20);
  
  stroke(color(155,155,155));
  fill(color(155,155,155));
  centerBrainX = centerPacmanX - 120;
  centerBrainY = centerPacmanY - 230;
  ellipse(centerBrainX,centerBrainY, 30, 30);
  arc(centerBrainX,centerBrainY, 40, 40, radians(20-time), radians(50-time));
  arc(centerBrainX,centerBrainY, 40, 40, radians(80-time), radians(110-time));
  arc(centerBrainX,centerBrainY, 40, 40, radians(140-time), radians(170-time));
  arc(centerBrainX,centerBrainY, 40, 40, radians(200-time), radians(230-time));
  arc(centerBrainX,centerBrainY, 40, 40, radians(260-time), radians(290-time));
  arc(centerBrainX,centerBrainY, 40, 40, radians(320-time), radians(350-time));
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 20, 20);
  
  stroke(color(155,155,155));
  fill(color(155,155,155));
  centerBrainX = centerPacmanX - 70;
  centerBrainY = centerPacmanY - 290;
  ellipse(centerBrainX,centerBrainY, 50, 50);
  arc(centerBrainX,centerBrainY, 60, 60, radians(28-time), radians(70-time));
  arc(centerBrainX,centerBrainY, 60, 60, radians(100-time), radians(142-time));
  arc(centerBrainX,centerBrainY, 60, 60, radians(172-time), radians(214-time));
  arc(centerBrainX,centerBrainY, 60, 60, radians(244-time), radians(286-time));
  arc(centerBrainX,centerBrainY, 60, 60, radians(316-time), radians(358-time));
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 40, 40);
  fill(color(155,155,155));
  ellipse(centerBrainX,centerBrainY, 30, 30);
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 20, 20);
  
  stroke(color(155,155,155));
  fill(color(155,155,155));
  centerBrainX = centerPacmanX - 180;
  centerBrainY = centerPacmanY - 220;
  ellipse(centerBrainX,centerBrainY, 40, 40);
  arc(centerBrainX,centerBrainY, 50, 50, radians(5+time), radians(30+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(50+time), radians(75+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(95+time), radians(120+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(140+time), radians(165+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(185+time), radians(210+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(230+time), radians(255+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(275+time), radians(300+time));
  arc(centerBrainX,centerBrainY, 50, 50, radians(320+time), radians(345+time));
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 30, 30);
  fill(color(155,155,155));
  ellipse(centerBrainX,centerBrainY, 25, 25);
  fill(color(0,0,0));
  ellipse(centerBrainX,centerBrainY, 15, 15);
  
  
  //Stomach

  stroke(color(155,155,155));
  fill(color(155,155,155));
  
  ellipse(centerPacmanX-100,centerPacmanY, 180, 100);
  ellipse(centerPacmanX-180,centerPacmanY+10, 100, 60);
  ellipse(centerPacmanX-200,centerPacmanY+20, 90, 50);
  ellipse(centerPacmanX-240,centerPacmanY+40, 60, 50);
  ellipse(centerPacmanX-255,centerPacmanY+65, 50, 60);
  ellipse(centerPacmanX-235,centerPacmanY+95, 55, 30);
  ellipse(centerPacmanX-215,centerPacmanY+105, 60, 40);
  ellipse(centerPacmanX-195,centerPacmanY+115, 60, 40);
  ellipse(centerPacmanX-175,centerPacmanY+125, 50, 40);
  ellipse(centerPacmanX-155,centerPacmanY+145, 40, 55);
  ellipse(centerPacmanX-165,centerPacmanY+165, 40, 35);
  ellipse(centerPacmanX-185,centerPacmanY+175, 60, 30);
  ellipse(centerPacmanX-205,centerPacmanY+185, 60, 25);
  ellipse(centerPacmanX-230,centerPacmanY+190, 70, 20);


  //First Processor
  strokeWeight(5);
  stroke(color(155,155,155));
  fill(color(0,0,0));
  rect(centerPacmanX-75,centerPacmanY-45, 30, 40);
  rect(centerPacmanX-70,centerPacmanY-70, 20, 40);
  
  strokeWeight(0);
  for(int i = 0; i< 12; i++){
    triangle(centerPacmanX-(50+(i*10)),centerPacmanY+35, centerPacmanX-(40+(i*10)), centerPacmanY+35, centerPacmanX-(45+(i*10)), centerPacmanY+10);
  }
  
  //Second Processor
  strokeWeight(5);
  stroke(color(155,155,155));
  fill(color(0,0,0));
  rect(centerPacmanX-115,centerPacmanY-55, 30, 40);
  rect(centerPacmanX-110,centerPacmanY-80, 20, 40);
    
  //Third Processor
  strokeWeight(5);
  stroke(color(155,155,155));
  fill(color(0,0,0));
  rect(centerPacmanX-155,centerPacmanY-35, 30, 40);
  rect(centerPacmanX-150,centerPacmanY-60, 20, 40);
  
  
  //Heart
  
  stroke(color(155,155,155));
  fill(color(155,155,155));
  
  
  ellipse(positionHeartX,positionHeartY, 110, 110);
  
  stroke(color(0,0,0));
  fill(color(0,0,0));
  
  beginShape();
  vertex(positionHeartX, positionCenterHeartY);
  bezierVertex(positionHeartX+60, positionCenterHeartY-30, positionHeartX+35, positionCenterHeartY+35, positionHeartX+30, positionCenterHeartY+35);
  vertex(positionHeartX, positionCenterHeartY+65);
  vertex(positionHeartX-30, positionCenterHeartY+35);
  bezierVertex(positionHeartX-35, positionCenterHeartY+35, positionHeartX-60, positionCenterHeartY-30, positionHeartX, positionCenterHeartY);
  endShape(CLOSE);
}

void drawBackground(){
  background(color(0,0,0));
  //
  textFont(font14);
  fill(color(40,80,40));
  for(int i = 0; i<nbBackgroundStringsVertical; i++ ){
    textFont(font14);
    if(i % 3 == 0){
      textFont(font11);
    }
    if(i % 5 == 0){
      textFont(font8);
    }
    if(i % 11 == 0){
      textFont(font16);
    }
    fill(color(40,80,40));
    if(backgroundStringsVertical[i].length() < 200+random(1800)){
      backgroundStringsVertical[i] = "\n"+ (char) random(pmouseY) + backgroundStringsVertical[i];
    }else{
      backgroundStringsVertical[i] = "";
    }
    text(backgroundStringsVertical[i], spaceBetweenLines*i, 0);
  }
  for(int i = 0; i<nbBackgroundStrings; i++ ){
    textFont(font14);
    if(i % 3 == 0){
      textFont(font11);
    }
    if(i % 5 == 0){
      textFont(font8);
    }
    if(i % 11 == 0){
      textFont(font16);
    }
    fill(color(40,80,40));
    if(backgroundStrings[i].length() < 500+random(1800)){
      backgroundStrings[i] = ((char) random(pmouseX))+ "   " + backgroundStrings[i];
    }else{
      backgroundStrings[i] = "";
    }
    
    text(backgroundStrings[i], 0, spaceBetweenLines*i);
  }
}


void mousePressed(){
  if(mouseButton == RIGHT){
    if(mouseX > positionFoodX-(sizeFood/2) && mouseX < positionFoodX+(sizeFood/2) && mouseY > positionFoodY-(sizeFood/2) && mouseY < positionFoodY+(sizeFood/2)){
      foodTaken = true;
    }
  }else{
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
  positionHeartX = centerPacmanX+ 30;
  positionHeartY = centerPacmanY+ 170;
  positionCenterHeartY = centerPacmanY+ 140;
}

