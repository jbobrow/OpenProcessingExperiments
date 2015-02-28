
/**
"Fill 'er up!"  Created by Todd Spencer  tspencer@uat.edu  CC-BY-NC-SA 2009
*/

float x; 
float y; 
int numVertices=1;
float numRings=8;
int circleSize=20;
float middleSpace=0.6;
float scaledMouseX = 0;
float scaledMouseY =0;
int redFill = 100;
int blueFill = 100;
int greenFill = 100;
int alphaFill = 150;
int redColorChangeRate = 13;
int blueColorChangeRate = 14;
int greenColorChangeRate = 15;
int alphaColorChangeRate = 1;
int timer = 1000;
float blackCounterHit = 0;
float blackCounterMiss = 0;
float blackCountHit = 0;
float blackCountMiss = 0;
float percentBlackHit = 1.0;
float percentBlackMiss = 1.0;
float percentColoredHit = 0.0;
float percentColoredMiss = 0.0;
String title = "Fill 'er up!";
int boundingBoxWidth = 150;
int boundingBoxHeight = 150;
PImage testBox;
PImage missBox;
int missBoxStrokeWeight = 10;
color currentHitColor = #000000;
color currentMissColor = #000000;
color black = #000000;
float levelScore = 0;
int oldTotalScore=0;
int totalScore = 0;
float titlePosition = 32;
int missBoxOffset = 15;
color scoreColor = #F0F0F0;
float scaledLevelScore;
boolean completed = false;
boolean level = false;
boolean intro = true;
boolean submitScore = false;
boolean submitScoreOver = false;
boolean keepPlaying = false;
boolean keepPlayingOver = false;
boolean scoreSubmitted = false;
boolean gameOver = false;
int levelNumber = 1;
PFont titleFont;
PFont subFont;

void setup(){
  size(300,300); 
  imageMode(CENTER);
  background(0); 
  stroke(0); 
  titleFont = loadFont("BookAntiqua-Bold-32.vlw");
  textFont(titleFont); 
  subFont = loadFont("BookAntiqua-18.vlw");
  textFont(subFont);
  scoreColor = color(0, scaledLevelScore, 0);

}
/*void levelComplete(){
 if(mousePressed){
 completed=true;
 }
 }
 */
void intro(){
  completed = false;
  level = false;
  submitScore = false;
  submitScoreOver = false;
  keepPlaying = false;
  keepPlayingOver = false;
  scoreSubmitted = false;
  gameOver=false;
  background(0);
  scoreColor = color(0, 0, 0);
  hitBoxes1();
  fill(255);
  textAlign(CENTER);
  textFont(titleFont); 
  text("Fill 'er up!", width/2, 64);
  fill(255, 0, 0);
  text("X", width/PI,height/2);
  textFont(subFont); 
  fill(255);
  text("Click the red X to begin!\nStay inside the lines!\nWhen you finish, click!", width/2, height-52);
  intro=true;
}

void mousePressed(){
  if (submitScoreOver){
    submitScore=true;
  }
  if (keepPlayingOver){
    keepPlaying = true;
    //println("inside loop");
    //completed=false;
    level=true;
  }
  if(!completed && !intro && level){
    //println("inside noloop");
    level = false;
    keepPlaying=false;
    completed=true;
  } 
  if(scoreSubmitted){
    intro=true;
  }
  if (intro && !scoreSubmitted){
    intro=false;
    background(0);
   // println("inside intro click");
    level=true;
  }
  if(gameOver){
    totalScore=0;
    levelScore=0;
    oldTotalScore=0;
    timer=1000;
    intro=true; 
    loop();
  }
}

void scaleMouse(){
  scaledMouseX = map(mouseX, 0, width, 0, 2*PI);
  scaledMouseY = map(mouseY, 0, height, 0, 2*PI);
}

void headers(){
  fill(0);
  noStroke();
  rectMode(CORNER);
  rect(0,0,width,46);
  fill(255);
  textAlign(RIGHT);
  textFont(titleFont); 
  text(totalScore, width, 32);
  if(completed){

    fill(0, 255, 0);
    stroke(255);
    strokeWeight(1);
    rectMode(CORNER);
    rect(0, 0, 70,45);
    fill(0);
    textFont(subFont);
    textAlign(CENTER);
    text("Submit\nScore", 35,18);
    fill(255, 0, 0);
    stroke(255);
    strokeWeight(1);
    rect(70, 0, 70,45);
    fill(0);
    text("Keep\nPlaying", 105,18);
    if (mouseX>0&&mouseX<70&&mouseY>0&&mouseY<45){
      submitScoreOver = true;
    }
    else{
      submitScoreOver=false;
    }
    if (mouseX>70&&mouseX<140&&mouseY>0&&mouseY<45){
      keepPlayingOver = true;
    }
    else{
      keepPlayingOver=false; 
    }
    // println("keepPlayingOver = "+ keepPlayingOver);
    //println("submitScoreOver = "+ submitScoreOver);
  }
}
void resetScore(){
  levelScore=0;
  submitScore=false;
  oldTotalScore = totalScore;
}
void submitScore(){
  scoreSubmitted = true;
  if (totalScore >= oldTotalScore+levelScore){
    println("gooo");
    completed=false;
    resetScore();
  }
  else if (oldTotalScore+levelScore-totalScore>20){
    totalScore+=7;
    scoreCounter();
  }
  else if(oldTotalScore+levelScore-totalScore<20){
    totalScore+=1;
    scoreCounter(); 

  }

}

void scoring(){
  timer -= 1;
  if (timer<0){
    timer=0; 
  }
  fill(0);
  stroke(0);
  quad(0,height-40,width,height-40,width,height,0,height);
  levelScore = int(timer*percentColoredHit*percentBlackMiss);
  // totalScore+=levelScore;
  fill(255);
  textAlign(CENTER);
  textFont(subFont); 
  int hitDisplayIndex = 4;
  int missDisplayIndex = 4;
  if (str(percentColoredHit).length()<4){
    hitDisplayIndex = str(percentColoredHit).length();
  }
  if (str(percentBlackMiss).length()<4){
    missDisplayIndex = str(percentBlackMiss).length();
  }
  text("Score: "+ timer + 
    " x " + str(percentColoredHit).substring(0,hitDisplayIndex) + 
    " x " + str(percentBlackMiss).substring(0,missDisplayIndex) + 
    " = " + str(levelScore), width/2, height*.95);

  scaledLevelScore = map(levelScore,0,1000,0,255);
  scoreColor = color(0, scaledLevelScore, 0);

}

void scoreCounter(){
  background(0);
  fill(255);
  textFont(titleFont);
  textAlign(CENTER);
  text(totalScore, width/2,height/2);
}

void colorShift(){
  if (redFill > 255 || redFill < 25){
    redColorChangeRate *= -1; 
  }
  if (greenFill > 255 || greenFill < 100){
    greenColorChangeRate *= -1; 
  }
  if (blueFill > 255 || blueFill < 25){
    blueColorChangeRate *= -1; 
  }
  if (alphaFill > 255 || alphaFill < 150){
    alphaColorChangeRate *= -1; 
  }
  alphaFill +=alphaColorChangeRate;
  redFill += redColorChangeRate;
  greenFill += greenColorChangeRate;
  blueFill += alphaColorChangeRate;

  // println(redColorChangeRate + " redFill "+ redFill);
}
void hitBoxes1(){
  noFill();
  stroke(255);
  strokeWeight(1);
  rectMode(CENTER);
  rect (width/2, height/2, boundingBoxWidth, boundingBoxHeight); 
  testBox = get(width/2 - boundingBoxWidth/2, height/2-boundingBoxHeight/2, boundingBoxWidth, boundingBoxHeight);
  testBox.loadPixels();
  for (int i = 0; i< boundingBoxWidth*boundingBoxHeight; i++){
    currentHitColor = testBox.pixels[i];
    // print(i + "  ");
    if (currentHitColor==black){
      blackCounterHit += 1;
    }
  }
  stroke(scoreColor);
  strokeWeight(missBoxStrokeWeight);
  rect (width/2, height/2, boundingBoxWidth+2*missBoxOffset+missBoxStrokeWeight, boundingBoxHeight+2*missBoxOffset+missBoxStrokeWeight);
  missBox = get(width/2 - boundingBoxWidth/2-missBoxOffset, height/2-boundingBoxHeight/2-missBoxOffset, boundingBoxWidth+2*missBoxOffset, boundingBoxHeight+2*missBoxOffset);
  missBox.loadPixels();
  for (int j = 0; j<(boundingBoxWidth+2*missBoxOffset)*(boundingBoxHeight+2*missBoxOffset); j++){
    //this previous line is not accurate -- 
    //adding 30 to boundingBoxWidth and -Height causes arrayOutOfBoundsException on next line
    currentMissColor = missBox.pixels[j];
    // print(i + "  ");

    if (currentMissColor==black 
      && (j<(boundingBoxWidth+2*missBoxOffset)*missBoxOffset || j>(boundingBoxWidth+2*missBoxOffset)*(missBoxOffset+boundingBoxHeight))){
      blackCounterMiss += 1;
    }
    if (currentMissColor==black
      && (j%(boundingBoxWidth+2*missBoxOffset)<missBoxOffset || j%(boundingBoxWidth+2*missBoxOffset)>boundingBoxWidth+missBoxOffset)){
      blackCounterMiss+=1;
    }

  }
  blackCountHit = blackCounterHit;
  blackCounterHit = 0;
  percentBlackHit = blackCountHit/(boundingBoxWidth*boundingBoxHeight);
  percentColoredHit = 1.0-percentBlackHit;
  if(percentColoredHit == 1.0){
    percentColoredHit = 6.0; 
  }

  blackCountMiss = blackCounterMiss;
  blackCounterMiss = 0;
  percentBlackMiss = blackCountMiss/9806;
  //this last number is arbitrary -- used for testing -- 
  //need to calculate actual number of miss area pixels
}
void wand(){
  for(int i=0;i<numVertices;i++){ 
    x=50*cos(i*TWO_PI/numVertices+scaledMouseX); 
    y=50*sin(i*TWO_PI/numVertices+scaledMouseY); 
    fill(redFill,blueFill,greenFill,alphaFill); 
    noStroke();
    for(float j=numRings;j>0; j--){
      rect(width/2+x*(j/numRings+middleSpace), height/2+y*(j/numRings+middleSpace), circleSize, circleSize);
    }
  }
}

void draw(){ 
/*
  println("completed = "+ completed + 
    ";  level = " + level + 
    "; oldTotalScore = " + oldTotalScore + 
    "; totalScore = " + totalScore +
    "; levelScore = " + levelScore);
  
  */
  smooth();
  fill(0);
  stroke(0);
  rect(0,0,width,45);
  if (intro){
    intro();
  }

  //noCursor();
  if (level){
    println("insideLevel");
    completed=false;
    intro=false; 
    scoreSubmitted=false;
    colorShift();
    scaleMouse();
    headers();
    scoring();
    wand();
  }
  else if (completed){
    level=false;
    headers();
    if (submitScore){
      submitScore();
    //  println("inside draw-submitScore");
    }
    else if (keepPlaying){
   //   println("inside draw-keepPlaying");
      level=true; 
    }
  }
  if (level && levelNumber == 1){
    hitBoxes1();
  }
  if(timer==0){
    background(0);
    fill(255);
    text("You can do better than that!\nYour score is", width/2, height/2-60);
    textFont(titleFont);
    text(totalScore, width/2, height/2);
    textFont(subFont);
    textAlign(CENTER);
    text("Fill 'er up!\nCreated by Todd Spencer\ntspencer@uat.edu", width/2, height-50);
    gameOver = true;
    noLoop();
  }

  /*
  println("currentHitColor: "+hex(currentHitColor) + " black: "+ 
   hex(black)+" blackCountHit  = "+ blackCountHit + " percentBlackHit = " + percentBlackHit +
   "blackCountHit = " + blackCountHit);
   println("currentMissColor: "+hex(currentMissColor) + " black: "+ 
   hex(black)+" mouseX " + mouseX + " percentBlackMiss = " + percentBlackMiss+
   " blackCountMiss = " + blackCountMiss);
   */

} 




















