
boolean[] downKeys = new boolean[256];
int displayMode = 1; //0 no niceties, 1 default, 2 - no charges drawn, 3 - gunship mode, 4 - equipotentials drawn, 5 - field dirn flipbook (res>5)


//setup values for nice field/potential backgrounds
int defaultResolution = 4;
int defaultEPResolution = 2;
int slowFactor = 1; //set to 1 for 'reasonably fast' computer, 2 for slower machines
int resolution = defaultResolution;
int divisionsX;
int divisionsY;
ChargeBox boxArray[][];

//set some physical constants here
float balloonMass = 10;
float balloonDefaultWidth = 20;
int chargeMass = 1;
float fieldConstantRadial = 0.40;   //1 is strong enough to provoke very strong repulsion during rapid fire. 0.5 is good.
float fieldConstantUniform = 4000.00;  //4000 works pretty well, 7000 is a bit strong!

//declare windows and arenas
Arena mainArena;
Windough arenaWindough;
Windough scoreWindough;
Windough equipmentWindough;

//declare charge counting variables
int totalNeg;
int totalPos;
int totalCharges = 0; //variable to store the total NUMBER of movable charges


int chargeDiff;
int chargeDiffVert;

float voltageUseful;
float voltageVertical;
float eFieldX;
float eFieldY;
float eFieldUniformX;
float eFieldUniformY;

color posM_col = color(255, 80, 180, 255);
color negM_col = color(0, 255, 255, 255);
color posF_col = color(255,0,0,255);
color negF_col = color(0,0,255,255);



//idea from Brad: as a launch option - clump several charges

Cannon jamesCannon;
int shotCounter; //'spacer' to prevent too rapid a firing rate.
int shotDelay; 
float aimPointX;
float aimPointY;
float aimPointMagSq;

float ejectionThreshold = 170; 
int ejectionMax = 3;
float ejectionDamping = 0.3;
float capacitance = 100;
int numBalloons = 7;

Plate plate_L;
Plate plate_R;
Plate plate_T;
Plate plate_B;
Plate plateArray[] = new Plate[4];
int plateSquareWidth = 5;


Balloon balloonList[];
ArrayList chargeList;

PFont strad48;
PFont strad16;

void setup() {
  size(800,800);
  frameRate(24);
  shotDelay = 5;
  mainArena = new Arena(50,50,400,400,100);

  
  divisionsX = mainArena.arenaWidth/resolution;
  divisionsY = mainArena.arenaHeight/resolution;
  boxArray = new ChargeBox[divisionsX][divisionsY];
  


  balloonList = new Balloon[numBalloons];
  for (int i = 0; i < balloonList.length; i++) {
    balloonList[i] = new Balloon(random(mainArena.arenaWidth),random(mainArena.arenaHeight),5, balloonMass);
  }
  
  chargeList = new ArrayList();

  plate_L = new Plate(-25,0,25,mainArena.arenaHeight,100,100,100,100,0);
  plate_R = new Plate(mainArena.arenaWidth,0,25,mainArena.arenaHeight,100,100,100,100,1);
  plate_T = new Plate(0,-25, mainArena.arenaWidth,25,0,10,0,10,0);
  plate_B = new Plate(0,mainArena.arenaHeight, mainArena.arenaWidth,25,0,10,0,10,0);
  plateArray[0] = plate_L;
  plateArray[1] = plate_R;
  plateArray[2] = plate_T;
  plateArray[3] = plate_B;

  jamesCannon = new Cannon();
    
  for (int i = 0; i < plateArray.length; i++) {
    totalCharges = totalCharges + plateArray[i].charges;
  }
  

  
  strad48 = loadFont("Amstrad-CPC464-48.vlw");
  strad16 = loadFont("Amstrad-CPC464-16.vlw");


  
  
  
  initialiseScores();

  
  arenaWindough = new Windough(480,480,450,450,color(0,0,0),color(posM_col));
  scoreWindough = new Windough(280,480,250,450,color(0,0,0),color(negM_col));
  equipmentWindough = new Windough(50,100,20,70,color(255,255,0),color(0,0,0));

}

void draw() {
  pushMatrix();
  translate(50,50);
//UPDATES
  
  for(int i = 0; i < divisionsX; i++){
    for(int j = 0; j <divisionsY; j++ ){
      boxArray[i][j] = new ChargeBox(resolution*i, resolution*j);
    }
  }
  
  //update the electric field due to the plates
  
  chargeDiff = plate_R.charge - plate_L.charge;
  chargeDiffVert = plate_B.charge - plate_T.charge;
  voltageUseful = 1.*round(1000*chargeDiff/capacitance)/1000;
  voltageVertical = 1.*chargeDiffVert/capacitance;
    
  eFieldUniformX = voltageUseful/(plate_R.xPos - (plate_L.xPos + plate_L.plateWidth));

  eFieldUniformY = voltageVertical/(plate_B.yPos - (plate_T.yPos + plate_T.plateHeight));
  
  
  //determine accelerations of every object
  chargeAccn(); 
  balloonAccn();
  
   if(chargeList.size() != 0){ //if there are any charges in the arena
    for (int i = 0; i < chargeList.size(); i++) { //update all charges
      Charge charge = (Charge) chargeList.get(i);
      charge.move(); //move charges
    }
  }
  
  if(balloonList.length != 0){
   for (int i = 0; i < balloonList.length; i++) { //update all balloons
       balloonList[i].move();
   }
  }
   plateCollisionCheck();
   chargeCollisionCheck(); //check if charge has collided with a plate or balloon

  
  //DISPLAY THINGS

  background(0);
  
  
  //basic visual parameters
  
  if(displayMode == 3){    
    posM_col = color(255);
    negM_col = color(1,1,1,200);
    posF_col = color(200);
    negF_col = color(50,50,50,200);
   } else {
    posM_col = color(255, 80, 180, 255);
    negM_col = color(0, 255, 255, 255);
    posF_col = color(255,0,0,255);
    negF_col = color(0,0,255,255);
  }
  
  pushMatrix();
    translate(-plate_L.plateWidth -arenaWindough.borderWidth,-plate_T.plateHeight -arenaWindough.borderWidth);
    arenaWindough.display();
    displayInstructions();
    
    translate(arenaWindough.outWidth + 20, 0);
    scoreWindough.display();
    displayScores();
    displayScience();
  popMatrix();
  fill(255);
  cursor(CROSS);
  

  
  //display neat potential background
  
    if(displayMode != 5||displayMode != 0){  
    for (int i = 0; i <divisionsX; i++){
    for (int j = 0; j <divisionsY; j++){
    boxArray[i][j].updatePotential();
    boxArray[i][j].display();
    }
  } 
  }
  
    if(displayMode == 5 || displayMode ==6){  
    for (int i = 0; i <divisionsX; i++){
    for (int j = 0; j <divisionsY; j++){
    boxArray[i][j].updateField();
    boxArray[i][j].displayField();
    }
  } 
  }
      
  //display charges
    if(displayMode != 2 && displayMode != 3){
    for(int i = 0; i < chargeList.size(); i++) {
    Charge charge = (Charge) chargeList.get(i);
    charge.display();
    }
    }

  
  //display balloons
  if(displayMode != 2 && displayMode !=3){
  for (int i = 0; i < balloonList.length; i++) { //update all balloons
        balloonList[i].display();
  }   
  }

  
  //display something about the voltage
  int dropShadowOffset = 3;
    textFont(strad48);
  textAlign(CENTER);
  
  if(voltageUseful < 0){
    fill(1,1,1,50);
    text(str(1.*voltageUseful),dropShadowOffset + mainArena.arenaWidth/2,dropShadowOffset + mainArena.arenaHeight/2);
  } else
  if(chargeDiff > 0){
    fill(1,1,1,50);
    text("+"+str((voltageUseful)),dropShadowOffset + mainArena.arenaWidth/2, dropShadowOffset + mainArena.arenaHeight/2);
  } else {
    fill(1,1,1,50);
    text("0.00",dropShadowOffset + mainArena.arenaWidth/2, dropShadowOffset + mainArena.arenaHeight/2);
  }
  
  if(voltageUseful > targetVoltage - tolerance*targetVoltage && 
  voltageUseful < targetVoltage + tolerance*targetVoltage){
    float increment = (1/frameRate);
    //println(increment);
    timeAtTarget = 1.*round(100*(timeAtTarget + increment))/100;
    if(timeAtTarget > highTimeAtTarget){
      highTimeAtTarget = timeAtTarget;
    }
    fill(0,255,0);
  }else{
    timeAtTarget = 0;
    fill(255);
  }
  
  if(voltageUseful < 0){
    text(str(1.*voltageUseful),mainArena.arenaWidth/2, mainArena.arenaHeight/2);
  } else
  if(chargeDiff > 0){
    text("+"+str((voltageUseful)),mainArena.arenaWidth/2, mainArena.arenaHeight/2);
  } else {
    text("0.00",mainArena.arenaWidth/2, mainArena.arenaHeight/2);
  }


//CANNON-RELATED
  
  //increment shot timer (keeps firing rate manageable)
  shotCounter++;
  if(shotCounter > 2*shotDelay){
    shotCounter = 0;
  }
  
  //update number of charges on each plate, display accordingly
  for (int i = 0; i < plateArray.length; i++) { //update charge and related numbers on all wall
    plateArray[i].update();
    plateArray[i].display();
  }
  

  //change cannon mode between positive, negative    
  if(downKeys[97] || downKeys[65] && jamesCannon.mode != 1){
     jamesCannon.setMode(1);
   } else
   if(downKeys[100] || downKeys[68] && jamesCannon.mode != -1){
      jamesCannon.setMode(-1);
   }
//define and constrain 'aimPoint' for cannon display and shot trajectory
 aimPointX = (jamesCannon.xPos + 0.5*jamesCannon.cannonWidth  + mainArena.xPos - mouseX)/(5 - 4*(abs(jamesCannon.xPos + 0.5*jamesCannon.cannonWidth +mainArena.xPos-mouseX)/mainArena.arenaWidth));
 aimPointY = (jamesCannon.yPos + mainArena.yPos - mouseY)/(5 - 4*(abs(jamesCannon.yPos + mainArena.yPos - mouseY)/mainArena.arenaHeight));
 aimPointX = constrain(aimPointX, -200, 200);
 aimPointY = constrain(aimPointY, -200, 200);

 aimPointMagSq = sq(aimPointX) + sq(aimPointY);
 shotEnergy = (1.*round(1000*(0.5*chargeMass*aimPointMagSq/4000))/1000);

  //update cannon position and display
  jamesCannon.move();
  jamesCannon.display();

  //fire cannon if certain conditions are met
  if(downKeys[32]){

      if(jamesCannon.mode == -1 && plate_R.numNeg_M > 0 && chargeList.size() < 20 && shotCounter > shotDelay){
      Charge freshCharge = new Charge(mainArena.arenaWidth - 2, jamesCannon.yPos, jamesCannon.mode,-aimPointX,-aimPointY, chargeMass,true);
      chargeList.add(freshCharge);
      plate_R.numNeg_M--;
      shotCounter = 0;
      }
      if(jamesCannon.mode == 1 && plate_R.numPos_M > 0 && chargeList.size() < 20 && shotCounter > shotDelay){
      Charge freshCharge = new Charge(mainArena.arenaWidth -  2, jamesCannon.yPos, jamesCannon.mode,-aimPointX,-aimPointY, chargeMass,true);
      chargeList.add(freshCharge);
      plate_R.numPos_M--;
      shotCounter = 0;
      }
    }
    

    //myWindough.display();
    popMatrix();
    updateParams();
    updateScores();
      writeScores();
    changeDisplay();
}

void changeDisplay() {
     if(downKeys[91] && slowFactor == 1){
        slowFactor = 2;
        resolution = resolution*slowFactor;
    }
        if(downKeys[93] && slowFactor == 2){
        resolution = resolution/slowFactor;
        slowFactor = 1;

    }
   if(downKeys[48]){
      displayMode = 0;
      resolution = defaultResolution*slowFactor;
    }
    if(downKeys[49]){
      displayMode = 1;
      resolution = defaultResolution*slowFactor;
    }
    if(downKeys[50]){
      displayMode = 2;
      resolution = defaultResolution*slowFactor;
    }
    if(downKeys[51]){
      displayMode = 3;
      resolution = defaultResolution*slowFactor;
    }
    if(downKeys[52]){
      displayMode = 4;
      resolution = defaultEPResolution*slowFactor;
    }
    if(downKeys[53]){
      displayMode = 5;
      resolution = 10*slowFactor;
    }
    if(downKeys[54]){
      displayMode = 6;
      resolution = 10*slowFactor;
    }
  divisionsX = mainArena.arenaWidth/resolution;
  divisionsY = mainArena.arenaHeight/resolution;
  boxArray = new ChargeBox[divisionsX][divisionsY];
}

void updateParams(){
  if(downKeys[59]&& ejectionThreshold > 1){
      ejectionThreshold -= 10;
    }
    if(downKeys[39]){
      ejectionThreshold += 10;
    }
    if(downKeys[44] && capacitance > 10){
      capacitance-= 10;
    }
    if(downKeys[46]){
      capacitance+=10;
    }
    if(downKeys[114]||downKeys[82]){
      score = 0;
      highScore = 0;
      currentStreak = 0;
      highShotTime = 0;
      bestStreak = 0;
      timeAtTarget = 0;
      highTimeAtTarget = 0;
      writeScores();
    }
}

void displayInstructions(){
pushMatrix();
      translate(0,arenaWindough.outWidth + 40);
      textFont(strad16);
      textAlign(LEFT);
       fill(255,255,0);
       text("GAME CONTROLS",0,0);
       translate(0,20);
       fill(255);
       text("Aim/shoot: mouse/spacebar",0,0);
       translate(0,20);
       text("Gun movement up/down: W/S",0,0);
       translate(0,20);
       text("Shot type +ve/-ve: A/D",0,0);
       translate(0,30);
       fill(255,255,0);
       text("CONFIGURATION",0,0);
       translate(0,20);
       fill(255);
       text("Display mode: 0-6",0,0);
       translate(0,20);
       text("Resolution low/high: [/]",0,0);
        translate(0,20);
       text("Scatter up/down: '/;",0,0);
       translate(0,20);
       text("Capacitance up/down: >/<",0,0);
       translate(0,20);
       text("Reset score: R",0,0);
       
       
    popMatrix();
}

void keyPressed() {
 if (key<256) {
   downKeys[key] = true;
   for(int i = 0; i< downKeys.length; i++){
     if(downKeys[i]){
       //println(i);
     }
   }
     
 }
}

void keyReleased() {
 if (key<256) {
   downKeys[key] = false;  
 }
 
}








class Arena {
  float capacitance;
  int arenaWidth;
  int arenaHeight;
  int xPos;
  int yPos;
  
  Arena(int tempXPos, int tempYPos, int tempArenaWidth, int tempArenaHeight, float tempCapacitance){
    
    capacitance = tempCapacitance;
    arenaWidth = tempArenaWidth;
    arenaHeight = tempArenaHeight;
    xPos = tempXPos;
    yPos = tempYPos;
    
  }
 //SETTERS
  void set_Capacitance(float tempCapacitance){
    capacitance = tempCapacitance;
  }
  
}
class Balloon {
  int sign = 0;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float xAccn;
  float yAccn;
  float xUniformAccn;
  float yUniformAccn;
  float drift;
  float balloonWidth;
  float mass;
  
  
  Balloon(float tempXPos, float tempYPos, float tempDrift, float tempMass){
    balloonWidth = balloonDefaultWidth;
    xPos = tempXPos;
    yPos = tempYPos;
    drift = tempDrift;
    mass = tempMass;
  }
  

  
  void move() {


    xSpeed = xSpeed  + xAccn;
    ySpeed = ySpeed  + yAccn;
    
    
    xPos = xPos + xSpeed+ random(-drift,drift);
    yPos = yPos + ySpeed+ random(-drift,drift);
    
    xPos = constrain(xPos, -1, plate_R.xPos + 1);
    yPos = constrain(yPos, -1, plate_B.yPos + 1);
    
   
    
  }
  

  void display() {
    noStroke();
    
    if(sign < 0) {
      fill(negM_col);
    } else if(sign > 0) {
      fill(posM_col);
    } else {
      fill(255);
    }
    rectMode(CENTER);
    rect(xPos, yPos, balloonWidth, balloonWidth);   
  }
  


}

class Cannon {

int mode = 0;
float lowerLimit;
float upperLimit;
float cannonWidth;
float xPos;
float yPos;
float ySpeed;
float speedLimit;

Cannon() {
  cannonWidth = plate_R.plateWidth;
  lowerLimit = plate_R.yPos + plate_R.plateHeight - 0.5*cannonWidth;
  upperLimit = plate_R.yPos + 0.5*cannonWidth;
  speedLimit = 3;
  ySpeed = 0;
  yPos = (lowerLimit + upperLimit)/2;
  xPos = plate_R.xPos + plate_R.plateWidth/2;
}

void setMode(int tempMode){
  mode = tempMode;
}

void move(){
    if(downKeys[119] || downKeys[87] && ySpeed > -1*speedLimit){
      ySpeed = ySpeed - 0.3;    
    }
    if(downKeys[115]||downKeys[83] && ySpeed < speedLimit){
      ySpeed = ySpeed + 0.3;
    }
    yPos = yPos + ySpeed;
    if(yPos >= lowerLimit && ySpeed > 0){
      yPos = lowerLimit;
      ySpeed = -1*ySpeed;
    };
    if(yPos <= upperLimit && ySpeed < 0){
      yPos = upperLimit;
      ySpeed = -1*ySpeed;
    };
  ySpeed = 0.9*ySpeed;
}

  
void display() {
  float angle;
  noStroke();
  if(mode == 1){
    fill(posF_col);
  } else if(mode == -1) {
    fill(negF_col);
  } else {
    fill(255);
  }
  
  angle = atan((aimPointY)/(aimPointX));
  rectMode(CENTER);
  rect(xPos, yPos, cannonWidth,cannonWidth);
  
  pushMatrix();

  translate(xPos,yPos);
  rotate(angle);

   if(mode == 1){
    fill(posM_col);
    stroke(posF_col);
  } else if(mode == -1) {
    fill(negM_col);
    stroke(negF_col);
  } else {
    fill(160);
  }
  ellipseMode(CENTER);
  ellipse(-cannonWidth/2 + 5,0,5,5);
  popMatrix();

  }

}

class Charge {
  int sign;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;
  float xAccn;
  float yAccn;
  float xUniformAccn;
  float yUniformAccn;
  int mass;
  boolean player;
  int timer;
  float timerS;
  
  int trailLength = 5;
  float xPosArray[];
  float yPosArray[];
  
  Charge(float tempXPos, float tempYPos, int tempSign, float tempXSpeed, float tempYSpeed, int tempMass, boolean tempPlayer){
    
    sign = tempSign;
    xPos = tempXPos;
    yPos = tempYPos;
    xSpeed = tempXSpeed;
    ySpeed = tempYSpeed;
    mass = tempMass;
    player = tempPlayer;
    timer = 0;
    timerS = 0;
  
    xPosArray = new float[trailLength];
    yPosArray = new float[trailLength];  
    
    for(int i = 0; i < xPosArray.length; i++){ 
      xPosArray[i] = 0;
      yPosArray[i] = 0;
    }
  }
  
  void move() {
    xSpeed = xSpeed + xAccn;
    ySpeed = ySpeed + yAccn;
    
    if(xSpeed > 40||ySpeed > 40){
      xSpeed = 40;
      ySpeed = 40;
    }
    
    for(int i = xPosArray.length; i > 1; i--){
      xPosArray[i-1] = xPosArray[i-2];
      yPosArray[i-1] = yPosArray[i-2];
    }
    
    xPos = 1.*xPos + xSpeed;    
    yPos = 1.*yPos + ySpeed;
    xPos = constrain(xPos, -1, plate_R.xPos + 1);
    yPos = constrain(yPos, -1, plate_B.yPos + 1);
    

    
    if(xPos < plate_L.xPos + plate_L.plateWidth || xPos > mainArena.arenaWidth){
      if(yPos < plate_T.yPos + plate_T.plateHeight){
        yPos = 0;
      }
      if(yPos > mainArena.arenaHeight){
        yPos = mainArena.arenaHeight;
      }
    
    }

    xPosArray[0] = xPos;
    yPosArray[0] = yPos;
    
    if(player){
    timer ++;
    timerS = 1.*round(100*timer/frameRate)/100;
    }

    
  }
  
  void display() {
    color chargeCol;
    color posCol = color(255,80,120,255);
    color negCol = color(0,255,255,255);
    color alphaInc = color(0,0,0,255/(1.*trailLength));
    noStroke();
    if(sign < 0) {
      chargeCol = negM_col;
    } else if(sign > 0) {
      chargeCol = posM_col;
    } else {
      chargeCol = color(0,0,0,0);
    }
    rectMode(CENTER);
    for(int i = 0; i < xPosArray.length; i++){
    fill(chargeCol - i*alphaInc);
    rect(xPosArray[i], yPosArray[i], 5, 5); 
    }  
  }  
}

void plateCollisionCheck() {
    for(int i = 0; i < balloonList.length; i++){
      Balloon thisBalloon = balloonList[i];   
      for(int j=0; j < plateArray.length; j++){//check if balloon has collided with any plate
        if(thisBalloon.xPos > plateArray[j].xPos - thisBalloon.balloonWidth/2 && 
        thisBalloon.xPos < plateArray[j].xPos + plateArray[j].plateWidth + thisBalloon.balloonWidth/2 && 
        thisBalloon.yPos > plateArray[j].yPos - thisBalloon.balloonWidth/2 && 
        thisBalloon.yPos < plateArray[j].yPos + plateArray[j].plateHeight + thisBalloon.balloonWidth/2){
        thisBalloon.xSpeed = 0;
        thisBalloon.ySpeed = 0; 
        thisBalloon.xPos = constrain(thisBalloon.xPos, thisBalloon.balloonWidth + 1, plate_R.xPos - thisBalloon.balloonWidth - 1);
        thisBalloon.yPos = constrain(thisBalloon.yPos, thisBalloon.balloonWidth + 1, plate_B.yPos - thisBalloon.balloonWidth - 1); 

      if(thisBalloon.sign == 1 && plateArray[j].charge <= 0){ //if balloon is positive, and plate is not positive, dump positive charge on plate
            thisBalloon.sign--;
            thisBalloon.mass--;
            plateArray[j].numPos_M++;
            thisBalloon.xPos = random(3*thisBalloon.balloonWidth,mainArena.arenaWidth - 3*thisBalloon.balloonWidth);
            thisBalloon.yPos = random(3*thisBalloon.balloonWidth,mainArena.arenaHeight - 3*thisBalloon.balloonWidth);
          } else
      if(thisBalloon.sign == -1 && plateArray[j].charge >= 0){ //if balloon is negative, and plate is not negative, dump negative charge on plate
          thisBalloon.sign++;
          thisBalloon.mass--;
          plateArray[j].numNeg_M++;
            thisBalloon.xPos = random(3*thisBalloon.balloonWidth,mainArena.arenaWidth - 3*thisBalloon.balloonWidth);
            thisBalloon.yPos = random(3*thisBalloon.balloonWidth,mainArena.arenaHeight - 3*thisBalloon.balloonWidth);
          

      } else 
        if(thisBalloon.sign == 0) { //if balloon is neutral...  
          if(plateArray[j].charge > 1 && plateArray[j].numPos_M > 0){//...and plate is positively charged and some of that charge is moveable, pickup charge
          thisBalloon.sign++;
          plateArray[j].numPos_M--;
          thisBalloon.mass++;
        } else
          if(plateArray[j].charge < -1 && plateArray[j].numNeg_M > 0){//...and plate is negatively charged and some of that charge is moveable, pickup charge
          thisBalloon.sign--;
          plateArray[j].numNeg_M--;
          thisBalloon.mass++;
          }      
      } 

    }    
   } 
  }
}


void chargeCollisionCheck(){
  for(int i=0; i < chargeList.size(); i++){
    Charge thisCharge = (Charge) chargeList.get(i);
    float kineticEnergy = 0.5*thisCharge.mass*(sq(thisCharge.xSpeed) + sq(thisCharge.ySpeed));
        for(int j = 0; j < plateArray.length; j++){
          if(thisCharge.xPos >= plateArray[j].xPos && 
             thisCharge.xPos <= plateArray[j].xPos + plateArray[j].plateWidth && 
             thisCharge.yPos >= plateArray[j].yPos && 
             thisCharge.yPos <= plateArray[j].yPos + plateArray[j].plateHeight){

             
             
             if(kineticEnergy > ejectionThreshold){
               int numPos_Moved;
               int numNeg_Moved;
               if(plateArray[j].numPos_M > 0){
                numPos_Moved = ceil(random(1, plateArray[j].numPos_M)%ejectionMax);
               } else {
                numPos_Moved = 0;
               }
               if(plateArray[j].numNeg_M > 0){
                numNeg_Moved = ceil(random(1, plateArray[j].numNeg_M)%(ejectionMax-numPos_Moved));
               } else {
                numNeg_Moved = 0;
               }
                float energyShare = kineticEnergy/(1.*numNeg_Moved + numPos_Moved);
                  for(int k = 0; k < numPos_Moved; k++){
                    float newXSpeed;
                    float newYSpeed;
                     if(plateArray[j] == plate_T || plateArray[j] == plate_B){
                        newXSpeed = ejectionDamping*(thisCharge.xSpeed/abs(thisCharge.xSpeed))*random(-0.5*sqrt(2*thisCharge.mass*(energyShare)), sqrt(2*thisCharge.mass*(energyShare)));
                     } else {
                        newXSpeed = -1*ejectionDamping*(thisCharge.xSpeed/abs(thisCharge.xSpeed))*random(-0.5*sqrt(2*thisCharge.mass*(energyShare)), sqrt(2*thisCharge.mass*(energyShare)));
                     }
                     if(plateArray[j] == plate_R || plateArray[j] == plate_L){
                       newYSpeed = ejectionDamping*(thisCharge.ySpeed/abs(thisCharge.ySpeed))*sqrt(2*thisCharge.mass*(energyShare) - 0.5*thisCharge.mass*sq(newXSpeed));
                     } else {
                       newYSpeed = -1*ejectionDamping*(thisCharge.ySpeed/abs(thisCharge.ySpeed))*sqrt(2*thisCharge.mass*(energyShare) - 0.5*thisCharge.mass*sq(newXSpeed));
                     }
                     Charge freshCharge = new Charge(thisCharge.xPos + newXSpeed, thisCharge.yPos + newYSpeed, 1,newXSpeed,newYSpeed, chargeMass, false);
                     chargeList.add(freshCharge);
                     plateArray[j].numPos_M--;
                   }
                   for(int m = 0; m < numNeg_Moved; m++){ //if a collision happens with enough energy, eject moveable charges!
                    float newXSpeed;
                    float newYSpeed;
                     if(plateArray[j] == plate_T || plateArray[j] == plate_B){
                      newXSpeed = ejectionDamping*(thisCharge.xSpeed/abs(thisCharge.xSpeed))*random(-0.2*sqrt(2*chargeMass*(energyShare)), sqrt(2*chargeMass*(energyShare)));
                    } else {
                      newXSpeed = -1*ejectionDamping*(thisCharge.xSpeed/abs(thisCharge.xSpeed))*random(-0.2*sqrt(2*chargeMass*(energyShare)), sqrt(2*chargeMass*(energyShare)));
                    }
                    if(plateArray[j] == plate_R || plateArray[j] == plate_L){
                     newYSpeed = ejectionDamping*(thisCharge.ySpeed/abs(thisCharge.ySpeed))*sqrt(2*chargeMass*(energyShare) - 0.5*thisCharge.mass*sq(newXSpeed));
                    } else {
                     newYSpeed = -1*ejectionDamping*(thisCharge.ySpeed/abs(thisCharge.ySpeed))*sqrt(2*chargeMass*(energyShare) - 0.5*thisCharge.mass*sq(newXSpeed));
                    }

                    Charge freshCharge = new Charge(thisCharge.xPos + newXSpeed, thisCharge.yPos + newYSpeed, -1,newXSpeed,newYSpeed, chargeMass, false);
                    chargeList.add(freshCharge);
                    plateArray[j].numNeg_M--;
                  
                } 

             }

           if(thisCharge.sign == -1){
             plateArray[j].numNeg_M++;
           } else
           if(thisCharge.sign == 1){
             plateArray[j].numPos_M++;
           }
           if(thisCharge.player){
             if(j == 0 && kineticEnergy < ejectionThreshold){
               score = score + bonusMultiplier*difficultyMultiplier*1;
               currentStreak++;
             } else {
               currentStreak = 0;
             }
           }
           if(thisCharge.timerS > highShotTime){
             highShotTime = thisCharge.timerS;
           }
           chargeList.remove(i);
           break;
          } 
       } 
    } 
  

        for(int j=0; j < balloonList.length;j++){
           if(chargeList.size() > 0){
              for(int i = 0; i < chargeList.size(); i++){
        Charge thisCharge = (Charge) chargeList.get(i);
          Balloon thisBalloon = balloonList[j];
            if(thisCharge.xPos < thisBalloon.xPos + 0.5*thisBalloon.balloonWidth &&
               thisCharge.xPos > thisBalloon.xPos - 0.5*thisBalloon.balloonWidth &&
               thisCharge.yPos < thisBalloon.yPos + 0.5*thisBalloon.balloonWidth &&
               thisCharge.yPos > thisBalloon.yPos - 0.5*thisBalloon.balloonWidth){

               if(thisBalloon.sign == 0){
                 if(thisCharge.sign == -1){
                   thisBalloon.sign --;
                   thisBalloon.mass++;
                 } else 
                 if(thisCharge.sign == 1){
                   thisBalloon.sign ++;
                   thisBalloon.mass++;
                 }
               if(thisCharge.player){
                 currentStreak = 0;
               }
             if(thisCharge.timerS > highShotTime){
             highShotTime = thisCharge.timerS;
           }
               chargeList.remove(i);
             }
           }
         }
      }
}
}



                
              

/*

at the press of a button, set the displayMode


each mode is an array like this

MODE = [displayNumber, 
        resolution
        displayCharges (0,1), 
        displayBalloons (0,1),
        displayPlateCharges (0,1),
        posM_col,
        posF_col,
        negM_col,
        negF_col,
        potential or field display (P,F),
        equipotentials (0,1);
        
        P/F amplification,
        chargeDisplaySize,
        chargeTrailLength]
        

so for instance,

displayMode 1 = [1,resolution,1,1,1,color(whatever),color(255,0,0),color(0,255,255),color(0,0,255),P,0,0.7,5,5];
displayMode 2 = [2,resolution,1,1,1,color(whatever),color(255,0,0),color(0,255,255),color(0,0,255),P,0,1,0,0];
displayMode 3 = [3,resolution,1,1,1,color(255),color(200,200,200,125),color(0),color(50,50,50,125),P,0,1,5,0];
displayMode 4 = [4,resolution,1,1,1,color(whatever),color(255,0,0),color(0,255,255),color(0,0,255),P,1,0.7,5,0];
displayMode 5 = [4,10,1,1,1,color(whatever),color(255,0,0),color(0,255,255),color(0,0,255),F,0,1,5,0];


*/
//boxsize = arenasize/resolution
//trouble is if arenasize/reso isn't an integer.
//if boxsize - round(floor(boxsize)) !=0
// make arenasize fit an integer number of boxes?
//pick next suitable resolution that will fit.


class ChargeBox {
  
  int xPos;
  int yPos;
  float eField[];
  float V;
  //float eMagnitude;
  //float eDirection;
  
  
  ChargeBox(int tempXPos, int tempYPos){
    xPos = tempXPos;
    yPos = tempYPos;

    
    
  }
  
  
  void updateField(){
    eFieldX = 0;
    eFieldY = 0;
    

    
   eFieldX = eFieldX + eFieldUniformX;
   eFieldY = eFieldY + eFieldUniformY;
    
    
   for(int i = 0; i < chargeList.size(); i++){
        Charge thisCharge = (Charge) chargeList.get(i);
        float xDisp = thisCharge.xPos - xPos;
        float yDisp = thisCharge.yPos - yPos;
        if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/radiusSq;
        float yCompSq = sq(yDisp)/radiusSq;
        float eFieldChargeX = (xDisp/abs(xDisp))*fieldConstantRadial*thisCharge.sign*sqrt(xCompSq)/(radiusSq);
        float eFieldChargeY = (yDisp/abs(yDisp))*fieldConstantRadial*thisCharge.sign*sqrt(yCompSq)/(radiusSq);
        eFieldX = eFieldX + eFieldChargeX;
        eFieldY = eFieldY + eFieldChargeY;
      }
   for(int i = 0; i < balloonList.length; i++){
        Balloon thisBalloon = balloonList[i];
        float xDisp = thisBalloon.xPos - xPos;
        float yDisp = thisBalloon.yPos - yPos;
        if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/radiusSq;
        float yCompSq = sq(yDisp)/radiusSq;
        float eFieldBalloonX = (xDisp/abs(xDisp))*fieldConstantRadial*thisBalloon.sign*sqrt(xCompSq)/(radiusSq);
        float eFieldBalloonY = (yDisp/abs(yDisp))*fieldConstantRadial*thisBalloon.sign*sqrt(yCompSq)/(radiusSq);
        eFieldX = eFieldX + eFieldBalloonX;
        eFieldY = eFieldY + eFieldBalloonY;
        
      }

  }
  
  void displayField(){
    float lineX;
    float lineY;
    float angle;
    angle = atan(eFieldY/eFieldX);
    if(eFieldY > 0 && eFieldX < 0){
      angle = angle + PI;
    }
    if(eFieldX > 0 && eFieldY < 0){
      angle = angle;
    }
    if(eFieldX < 0 && eFieldY < 0){
      angle = angle + PI;
    }
    if(eFieldX > 0 && eFieldY > 0){
      angle = angle;
    }
    pushMatrix();
    translate(xPos + 0.5*resolution,yPos + 0.5*resolution);
    noStroke();
    if(displayMode == 5){
    fill(255*200*sqrt((sq(eFieldX)+ sq(eFieldY))));
    rectMode(CENTER);
    rect(0,0,resolution,resolution);
    }
    //println(sqrt(sq(eFieldX)+ sq(eFieldY)));

    rotate(angle);
    fill(255);
    ellipseMode(CENTER);
    triangle(-0.4*resolution,0,-0.2*resolution,0.2*resolution,-0.2*resolution,-0.2*resolution);
    stroke(255);
    strokeWeight(1);
    line(-0.4*resolution, 0,0.4*resolution,0);
    popMatrix();
    
    
  }

 void updatePotential(){
   V = 0;
   if(chargeList.size() != 0){
   for(int i = 0; i < chargeList.size(); i++){
      Charge thisCharge = (Charge) chargeList.get(i);
      float xDisp = thisCharge.xPos - xPos;
      float yDisp = thisCharge.yPos - yPos;
      if(abs(xDisp) < 0.1){
        xDisp = 0.1;
       }
       if(abs(yDisp) < 0.1){
         yDisp = 0.1;
       }
      float radiusSq = sq(xDisp) + sq(yDisp);
      float xCompSq = sq(xDisp)/radiusSq;
      float yCompSq = sq(yDisp)/radiusSq;
      float ePotential = fieldConstantRadial*thisCharge.sign/(sqrt(radiusSq));
      
      V = V + 1000*ePotential;  
      }
      }
      
   if(balloonList.length != 0){
   for(int i = 0; i < balloonList.length; i++){
        Balloon thisBalloon = balloonList[i];
        float xDisp = thisBalloon.xPos - xPos;
        float yDisp = thisBalloon.yPos - yPos;
        if(abs(xDisp) < 0.1){
          xDisp = 0.1;
         }
        if(abs(yDisp) < 0.1){
         yDisp = 0.1;
        }
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/radiusSq;
        float yCompSq = sq(yDisp)/radiusSq;
        float ePotential = fieldConstantRadial*thisBalloon.sign/(sqrt(radiusSq));
        
        V = V + 2000*ePotential;
      }
   }
     V = V + 50*((xPos*voltageUseful/mainArena.arenaWidth)) + 50*((yPos*voltageVertical/mainArena.arenaHeight));
  }  
  void display(){

    float adjV =  (4*V + 125);
    pushMatrix();
    translate(xPos,yPos);
    noStroke();
    rectMode(CORNER);
    if(displayMode == 1 || displayMode == 6){
    fill(0.7*adjV,0,0.7*(255-adjV));
    rect(0,0,resolution,resolution);

   }else
    if(displayMode == 2){
    fill(adjV,0,(255-adjV));
    rect(0,0,resolution,resolution);
    } else 
    if(displayMode == 3){
    fill(0.5*adjV);
    rect(0,0,resolution,resolution);
    } else
    if(displayMode == 4){
     if(adjV > 4&& adjV < 6||
       adjV > 19&& adjV < 21 ||
       adjV > 39&& adjV < 41 ||
       adjV > 59&& adjV < 61 ||
       adjV > 79&& adjV < 81||
       adjV > 99&& adjV < 101||
       adjV > 119&& adjV < 121||
       adjV > 139&& adjV < 141||
       adjV > 159&& adjV < 161||
       adjV > 179&& adjV < 181||
       adjV > 199&& adjV < 201||
       adjV > 219&& adjV < 221||
       adjV > 239&& adjV < 241||
       adjV > 249&& adjV < 251){

    fill(adjV,0,255-adjV);
    rect(0,0,resolution,resolution);

    }
    }
  popMatrix();
  }
  
  }


class Plate {
  int numPos_M;
  int numPos_F;
  int numNeg_M; 
  int numNeg_F;
  
  int xPos;
  int yPos;
  int plateWidth;
  int plateHeight;
  
  int control;
  
  int charge;
  int charges;
  int numNeg;
  int numPos;
  
  int squaresWide;
  int squaresHigh;
  int squaresNeg_M;
  int squaresNeg_F;
  int squaresPos_M;
  int squaresPos_F;
  int fixedArray[][];
  
  float posFactor;
  
  Plate(int tempXPos, int tempYPos, int tempWidth, int tempHeight, int tempNumPos_M, int tempNumPos_F, int tempNumNeg_M, int tempNumNeg_F, int tempControl) {
    numPos_M = tempNumPos_M;
    numPos_F = tempNumPos_F; 
    numNeg_M = tempNumNeg_M; 
    numNeg_F = tempNumNeg_F;
    
    xPos = tempXPos;
    yPos = tempYPos;
    plateWidth = tempWidth;
    plateHeight = tempHeight;
    
    numPos = numPos_M + numPos_F;
    numNeg = numNeg_M + numNeg_F;
    charge = numPos - numNeg;
    charges = numPos + numNeg; 
    
    squaresWide = round(1.*plateWidth/plateSquareWidth);
    squaresHigh = round(1.*plateHeight/plateSquareWidth);
     
    squaresNeg_F = numNeg_F; //record numbers of fixed charges
    squaresPos_F = numPos_F;
    
    control = tempControl;
    
    fixedArray = new int[squaresWide][squaresHigh];
    
    buildArray();


  }
  
  
  void update() { //update values related to fixed and movable charges
    numPos = numPos_M + numPos_F;
    numNeg = numNeg_M + numNeg_F;
    charge = numPos - numNeg;
    charges = numPos + numNeg;


    
    posFactor = 0.5 + 0.5*(1.*charge/(totalCharges)); 
    

  
  
  }
  
  void display() { //draw the plate, colour according to charge
  
      
  
    noStroke();
    rectMode(CORNER);
    rect(xPos,yPos,plateWidth,plateHeight);
    
    refreshCharges(); 
    displayCharges();
    
    
}

void buildArray(){
  for(int i = 0; i < squaresWide; i++){
    for(int j = 0; j < squaresHigh; j++){
      fixedArray[i][j] = 0;
    }    
  }
  
  for (int i = 0; i < numNeg_F + numPos_F; i++){
    int coord1 = round(random(squaresWide-1));
    int coord2 = round(random(squaresHigh-1));
    if(fixedArray[coord1][coord2] == 0){
      if(squaresNeg_F > 0){
        fixedArray[coord1][coord2] = -1;
        squaresNeg_F--;
      } else 
      if(squaresPos_F > 0){
        fixedArray[coord1][coord2] = 1;
        squaresPos_F--; 
       } 
     }
  }
}

   
 void refreshCharges(){
    squaresNeg_M = numNeg_M;
    squaresPos_M = numPos_M;
    
     for(int i = 0; i < squaresWide; i++){
      for(int j = 0; j < squaresHigh; j++){
        if(abs(fixedArray[i][j]) > 1){
          fixedArray[i][j] = 0;
        }
      }
    }
   
    for(int i = 0; i < numNeg_M + numPos_M; i++){
      int coord1 = round(random(squaresWide-1));
      int coord2 = round(random(squaresHigh-1));
      if(fixedArray[coord1][coord2] == 0){
        if(squaresNeg_M > 0){
          fixedArray[coord1][coord2] = -2;
          squaresNeg_M--;
        } else 
        if(squaresPos_M > 0){
          fixedArray[coord1][coord2] = 2;
          squaresPos_M--; 
        } 
      }

   }
 }
 
 void displayCharges() {
   for(int i = 0; i < plateWidth/5 ; i++){
      for(int j = 0; j < plateHeight/5; j++){
 
        if(fixedArray[i][j] == 1){
          fill(posF_col);
        } else
        if(fixedArray[i][j] == -1){
          fill(negF_col);
        } else
        if(fixedArray[i][j] == 2){
          fill(posM_col);
        } else
        if(fixedArray[i][j] == -2){
          fill(negM_col);
        } else {
          color minceMeat =  color(posFactor*255, 0,(1-posFactor)*255);
          fill(minceMeat);
          
        }
        rect(xPos + 5*i, yPos + 5*j, 5, 5);
      }
    }
  }
}
void chargeAccn(){
  for(int i = 0; i < chargeList.size(); i++){
  Charge thisCharge = (Charge) chargeList.get(i);
  thisCharge.xAccn = -1*fieldConstantUniform*thisCharge.sign*eFieldUniformX/thisCharge.mass;
  thisCharge.yAccn = -1*fieldConstantUniform*thisCharge.sign*eFieldUniformY/thisCharge.mass;
  if(chargeList.size() > 1){
    for(int j = 0; j < chargeList.size(); j++){//accn on one charge from others
    if(i != j) {
      Charge thatCharge = (Charge) chargeList.get(j);
      float xDisp = thisCharge.xPos - thatCharge.xPos;
      float yDisp = thisCharge.yPos - thatCharge.yPos;
if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/sq(xDisp)+sq(yDisp);
        float yCompSq = sq(yDisp)/sq(xDisp)+sq(yDisp);
        thisCharge.xAccn = thisCharge.xAccn + (xDisp/abs(xDisp))*fieldConstantRadial*thisCharge.sign*thatCharge.sign*sqrt(xCompSq)/(sqrt(radiusSq)*thisCharge.mass);
        thisCharge.yAccn = thisCharge.yAccn + (yDisp/abs(yDisp))*fieldConstantRadial*thisCharge.sign*thatCharge.sign*sqrt(yCompSq)/(sqrt(radiusSq)*thisCharge.mass);
    }
    }
    if(balloonList.length !=0){
    for(int k = 0; k < balloonList.length; k ++){
      Balloon thatBalloon = balloonList[k];
      float xDisp = thisCharge.xPos - thatBalloon.xPos;
      float yDisp = thisCharge.yPos - thatBalloon.yPos;
      if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }  
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/radiusSq;
        float yCompSq = sq(yDisp)/radiusSq;
        thisCharge.xAccn = thisCharge.xAccn + fieldConstantRadial*thisCharge.sign*thatBalloon.sign*(xDisp/abs(xDisp))*sqrt(xCompSq)/(sqrt(radiusSq)*thisCharge.mass);
        thisCharge.yAccn = thisCharge.yAccn + fieldConstantRadial*thisCharge.sign*thatBalloon.sign*(yDisp/abs(yDisp))*sqrt(yCompSq)/(sqrt(radiusSq)*thisCharge.mass);
    
    }
    }
  }
}
}
void balloonAccn(){
if(balloonList.length != 0){
for(int i = 0; i < balloonList.length; i++){
      Balloon thisBalloon = balloonList[i];
      thisBalloon.xAccn = (-1*fieldConstantUniform*eFieldUniformX*thisBalloon.sign)/thisBalloon.mass;
      thisBalloon.yAccn = (-1*fieldConstantUniform*eFieldUniformY*thisBalloon.sign)/thisBalloon.mass;
for(int j = 0; j < balloonList.length; j ++){
  if(i != j){
      Balloon thatBalloon = balloonList[j];
      float xDisp = thisBalloon.xPos - thatBalloon.xPos;
      float yDisp = thisBalloon.yPos - thatBalloon.yPos;
      if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }
        float radiusSq = sq(xDisp) + sq(yDisp);
        float xCompSq = sq(xDisp)/radiusSq;
        float yCompSq = sq(yDisp)/radiusSq;
        thisBalloon.xAccn = thisBalloon.xAccn + fieldConstantRadial*thisBalloon.sign*thatBalloon.sign*(xDisp/abs(xDisp))*sqrt(xCompSq)/(sqrt(radiusSq)*thisBalloon.mass);
        thisBalloon.yAccn = thisBalloon.yAccn + fieldConstantRadial*thisBalloon.sign*thatBalloon.sign*(yDisp/abs(yDisp))*sqrt(yCompSq)/(sqrt(radiusSq)*thisBalloon.mass);
  }
  for(int k = 0; k < chargeList.size(); k ++){
    Charge thatCharge = (Charge) chargeList.get(k);
    float xDisp = thisBalloon.xPos - thatCharge.xPos;
    float yDisp = thisBalloon.yPos - thatCharge.yPos;
    if(abs(xDisp) < 0.1){
          xDisp = 0.1;
        }
        if(abs(yDisp) < 0.1){
          yDisp = 0.1;
        }
      float radiusSq = sq(xDisp) + sq(yDisp);
      float xCompSq = sq(xDisp)/radiusSq;
      float yCompSq = sq(yDisp)/radiusSq;
      thisBalloon.xAccn = thisBalloon.xAccn + fieldConstantRadial*thisBalloon.sign*thatCharge.sign*(xDisp/abs(xDisp))*sqrt(xCompSq)/(sqrt(radiusSq)*thisBalloon.mass);
      thisBalloon.yAccn = thisBalloon.yAccn + fieldConstantRadial*thisBalloon.sign*thatCharge.sign*(yDisp/abs(yDisp))*sqrt(yCompSq)/(sqrt(radiusSq)*thisBalloon.mass);  
   }
  }
}
}
}
//code for determining, maintaining, displaying sciency numbers

void displayScience(){

textFont(strad16);
textAlign(LEFT);
 fill(255);
 pushMatrix();
 translate(20,scoreWindough.outHeight + 40);
 text("capacitance:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(1.*round(capacitance*1.6*1000)/1000)+ "x10^-19 F",0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
 text("scatter:",0,0);
 translate((scoreWindough.inWidth - 20),20);
 textAlign(RIGHT);
 text(str(1.*(round(ejectionThreshold*1000)/1000)/4000)+ " eV",0,0);
 textAlign(LEFT);
  translate(-1*(scoreWindough.inWidth - 20),20);
  fill(posM_col);
 text("+ve ions:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 fill(255);
 text(str(plate_R.numPos_M)+ " moveable",0,0);
 textAlign(LEFT);
  translate(-1*(scoreWindough.inWidth - 20),20);
    fill(negM_col);
 text("-ve ions:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 fill(255);
 textAlign(RIGHT);
 text(str(plate_R.numNeg_M)+ " moveable",0,0);
popMatrix();

}
//code for determining scores, displaying.

int score;
float[] scoreArray;
int highScore;
int bonusMultiplier;
int difficultyMultiplier;
float highShotTime;
float highVoltage;
int highSustain;
float shotEnergy;
int currentStreak;
int bestStreak;
float targetVoltage = 0.25;
float tolerance = 0.05; //percent
float timeAtTarget;
float highTimeAtTarget;

void initialiseScores(){
score = 0;
bonusMultiplier = 1;
difficultyMultiplier = round(floor((170/ejectionThreshold)*(numBalloons/4)));
shotEnergy = 0.00;
timeAtTarget = 0;
String[] scoreString = loadStrings("data/skoors.txt");
scoreArray = float(split(scoreString[0], ','));
highScore = round(scoreArray[0]);
highShotTime = round(scoreArray[1]);
highVoltage = scoreArray[2];
highSustain = round(scoreArray[3]);
bestStreak = round(scoreArray[4]);
highTimeAtTarget = round(scoreArray[5]);
}

void writeScores(){
String scoresForWriting = str(highScore) +", "+ str(highShotTime) +", "+ str(highVoltage) +", "+ str(highSustain) +", "+ str(bestStreak) +", "+ str(highTimeAtTarget) +";";
String[] scoreList = split(scoresForWriting,';');
saveStrings("data/skoors.txt", scoreList);
}



void displayScores(){
textFont(strad16);
textAlign(LEFT);
 fill(255);
 pushMatrix();
 //SCORE
 translate(20,scoreWindough.borderWidth + 20);
 text("Score:",0,0);
 translate(scoreWindough.inWidth - 20,50);
 textAlign(RIGHT);
 textFont(strad48);
 text(str(score),0,0);
 textFont(strad16);
 //BONUSES
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
 text("bonus: x"+str(bonusMultiplier),0,0);
 translate(0,20);
 text("difficulty: x"+str(difficultyMultiplier),0,0);
 //STREAKS
 translate(0,30);
 fill(255,255,0);
 text("Streak:",0,0);
 translate(scoreWindough.inWidth - 20,15);
 textAlign(RIGHT);
 text(str(currentStreak),0,0);
 textAlign(LEFT);
 fill(255);
 translate(-1*(scoreWindough.inWidth - 20),15);
 text("Best streak:",0,0);
 translate(scoreWindough.inWidth - 20,15);
 textAlign(RIGHT);
 text(str(bestStreak),0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),15);
 fill(255,255,0);
 text("Target:",0,0);
 translate(scoreWindough.inWidth - 20,10);
 textAlign(RIGHT);
 text(str(targetVoltage)+" V",0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
 fill(255);
 text("Time at target:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(timeAtTarget) +" s",0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
 text("-------------",0,0);
 translate(0,20);
 text("High Score:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(highScore),0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
  text("Longest shot:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(highShotTime) +" s",0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),20);
 text("Longest time:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(highTimeAtTarget) +" s",0,0);
 textAlign(LEFT);
 translate(-1*(scoreWindough.inWidth - 20),15);
 text("-------------",0,0);
 translate(0,15);
 fill(0,255,0);
 text("Shot Energy:",0,0);
 translate(scoreWindough.inWidth - 20,20);
 textAlign(RIGHT);
 text(str(shotEnergy)+ " eV",0,0);
 textAlign(LEFT);
 fill(255);
 popMatrix();

}

void updateScores(){
  difficultyMultiplier = round(floor((170/ejectionThreshold)*(capacitance/100)*(numBalloons/4)));
  
  
  if(score > highScore){
    highScore = score;
  }
  if(currentStreak > bestStreak){
    bestStreak = currentStreak;
  }
  
  if(currentStreak == 3){
    bonusMultiplier = 2;
  }
  if(currentStreak == 6){
    bonusMultiplier = 3;
  }
  if(currentStreak == 10){
    bonusMultiplier = 4;
  }
  if(currentStreak == 15){
    bonusMultiplier = 5;
  }
  if(currentStreak == 21){
    bonusMultiplier = 10;
  }
    if(currentStreak == 0){
    bonusMultiplier = 1;
  }
  
}
class Windough {
  
  int outWidth;
  int outHeight;
  int inWidth;
  int inHeight;
  int borderWidth;
  
  color windowColour;
  color borderColour;
  
  //Constructor
  
  Windough(int tempOutWidth, int tempOutHeight, int tempInWidth, int tempInHeight, color tempWindowColour, color tempBorderColour){
    outWidth = tempOutWidth;
    outHeight = tempOutHeight;
    inWidth = tempInWidth;
    inHeight = tempInHeight;
  
    windowColour = tempWindowColour;
    borderColour = tempBorderColour; 
    borderWidth = (outWidth - inWidth)/2;
  }
  
  
  void display(){
    noStroke();
    fill(borderColour);
    rectMode(CORNER);
    rect(0,0, outWidth, outHeight);
    
    fill(windowColour);
    rectMode(CENTER);
    rect(outWidth/2, outHeight/2, inWidth, inHeight);
  
  }
  
}


