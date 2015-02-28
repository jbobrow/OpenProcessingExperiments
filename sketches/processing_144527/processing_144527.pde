
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// 257/757  Spring 2014
// HW #10
// 4/14/14

// Keyboard / Mouse Controls:
// Space bar OR mouse click to start over
// Any other key to exit

// Image credit:
// chalkboard image obtained from: http://buzzagency.co.uk/home/images/blackboard.jpg

// Declare global variables
String [ ] allText;
String [ ] individualWords;
int numWords;
float [ ] wordXpos;
PFont myFont;
float lineY;
float lineX;
float yMin, yMax, xMin, xMax;
float xSpeed;
float ySpace;
int fontSz;
float armY;
float armYmax;
float armDelta;
float armRot;
float armRotMax;
float armRotMin;
float forearmLength;
float elbowX;
float elbowY;
int moveArmDirection;
PImage chalkboard;
PImage girl;
PImage upperarm;
PImage forearm;

//*******************************************
void setup(){
  size(600,400);
  
  // load all text into string array
  allText = loadStrings("writingLines.txt");
  
  // splice all text into individual words
  for(int i=0; i<allText.length; i++){
    individualWords = split(allText[i], ' ');
  }
  
  // initialize variables
  yMin = 75;
  yMax = height-50;
  xMin = 50;
  lineY = yMin;
  lineX = xMin;
  xSpeed = 2;
  ySpace = 50;
  numWords = individualWords.length;
  fontSz = 36;
  armYmax = fontSz;
  armY = -armYmax;
  armDelta = 3;
  moveArmDirection = -1;
  armRotMax = -60;
  armRotMin = -30;
  armRot = armRotMin;
  forearmLength = 75;
  
  // define x position of each word
  wordXpos = new float[numWords];
  wordXpos[0] = xMin;
  for(int i=1; i<individualWords.length; i++){
    wordXpos[i] = wordXpos[i-1] + (individualWords[i-1].length() + 1) * fontSz/3;
    
    // adjust certain words
    if(i==2){
      wordXpos[2] -= fontSz/3;
    }else if(i==4){
      wordXpos[4] -= fontSz/6;
    }else if(i==5){
      wordXpos[5] += fontSz/4.5;
    }
  }
  xMax = wordXpos[individualWords.length-1] + (individualWords[individualWords.length-1].length() * fontSz/3);
  
  // format text
  textAlign(LEFT);
  myFont = createFont("ByTheButterfly",fontSz);
  textFont(myFont);
  
  // load images
  chalkboard = loadImage("blackboard.jpg");
  girl = loadImage("girl.png");
  upperarm = loadImage("upperarm2.png");
  forearm = loadImage("forearm.png");
}

//*******************************************
void draw(){
  drawBackground();
  moveLines();
  writeLines();
  drawCharacter();
}

//*******************************************
void moveLines(){
  // animate movement of writing and character
  
  // increment x position
  lineX += xSpeed;
  
  // check x for out of bounds
  if(lineX>(width-xMin)){
    // start a new line
    lineX = xMin;
    lineY += ySpace;
    armY = -armYmax;
  }
  if(lineY>yMax){
    // start a new board
    lineY = yMin;
    lineX = xMin;
    armY = -armYmax;
  }
}

//*******************************************
void drawBackground(){
  imageMode(CORNER);
  image(chalkboard,0,0,width,height);
}

//*******************************************
void writeLines(){
  fill(255);
  
  // write all previous lines in full
  for(int i=0; i<( ( (lineY-yMin)/ySpace)); i++){
    for(int j=0; j<individualWords.length; j++){
      text(individualWords[j], wordXpos[j], (i*ySpace)+yMin);
    }
  }
  
  // write current line
  for(int i=0; i<individualWords.length; i++){
    if((wordXpos[i]) < lineX){
      text(individualWords[i], wordXpos[i], lineY);
    }
  }
  
}

//*******************************************
void drawCharacter(){
  float anchorX;
  fill(0,0,255);
  
  // figure out when to pause figure
  if(lineX<xMax){
    moveArm();
    anchorX = lineX;
  }else{
    anchorX = xMax;
  }


  // draw forearm
  imageMode(CORNER);
  pushMatrix();
    translate(anchorX, lineY+armY);
    //rotate(radians(armRotMin + armRot));
    image(forearm,0,0,forearmLength,forearmLength);
  popMatrix();
  
  // draw body
  imageMode(CENTER);
  image(girl, anchorX + 100, lineY+50, 200,200); 
  
  // draw upper arm
  // local variables
  float opp;
  float adj;
  float hyp;
  float elbowX;
  float elbowY;
  float upArmRot;
  float upArmLength;
  float extraArmRot;
  
  // calculations
  
  elbowX = anchorX + abs(sin(radians(90+armRot))*forearmLength);
  elbowY = lineY+armY + abs(cos(radians(90+armRot))*forearmLength);
  opp = abs(lineY+armY-elbowY);
  adj = abs(anchorX-elbowX);
  hyp = sqrt(sq(opp)+sq(adj));
  upArmRot = -(90-armRot);
  upArmLength = hyp;

  extraArmRot = -armY;
  upArmLength +=armY;
  
  // draw
  imageMode(CORNER);
  pushMatrix();
    translate(anchorX+65,lineY);
    rotate(radians(55+extraArmRot));
    //rotate(radians(-upArmRot));
    image(upperarm,0,0,forearmLength, upArmLength);
  popMatrix();
  // figure out elbow position
  //elbowX = anchorX + cos(
  //elbowY = (lineY+armY)-
  
}

//*******************************************
void moveArm(){
  
  // move arm
  armY += armDelta * moveArmDirection;
  
  // check for out of bounds up
  if(armY < -armYmax){
    armY = -armYmax;
    moveArmDirection *= -1;
  }
  
  // check for out of bounds down
  if(armY > 0){
    armY = 0;
    moveArmDirection *= -1;
  }
  
  // figure out arm rotation
  armRot = abs(((armY/armYmax)*armRotMax)+armRotMin);
  
}
//*******************************************
void keyPressed(){
  if(key == ' '){
    // start over
    lineY = yMin;
    lineX = xMin;
    armY = -armYmax;
    armRot = armRotMin;
  }else{
    exit();
  }
}
//*******************************************
void mousePressed(){
  // start over
    lineY = yMin;
    lineX = xMin;
    armY = -armYmax;
    armRot = armRotMin;
}


