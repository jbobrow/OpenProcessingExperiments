
boolean flipFlop = false;
String keyPrompt = "press any key";

int eyeBallDiam;
int pupilDown;
int pupilCloser;
int mouthDown;
int lowerJaw;
int noseFoward;
int mouthUp;
int hairMove;
int hairMovetwo;
int bubbleMoveOne;
int bubbleMoveTwo;
int bubbleMoveThree;
int bubbleMoveOneB;
int bubbleMoveTwoB;
int bubbleMoveThreeB;
int hairStroke;
int HairArray[] = new int[3];
int DonutDrop;
int DonutDropS;
int DonutSides;



void setup () {
  size(600, 600);
  background (16, 208, 232);
}

void draw () {  
  background (16, 208, 232);

  if (flipFlop == false) {
    eyeBallDiam = 60;
    pupilDown = 7;
    pupilCloser = 187;
    mouthDown = 67;
    lowerJaw = 207;
    noseFoward = 17;
    mouthUp = 207;
    hairMove = 95;
    hairMovetwo = 115;
    bubbleMoveOne = 25;
    bubbleMoveTwo = 55;
    bubbleMoveThree = 155;
    bubbleMoveOneB = 75;
    bubbleMoveTwoB = 55;
    bubbleMoveThreeB = 20;
    hairStroke = 4;
    HairArray[0] = 0;
    DonutDrop = 30;
    DonutDropS = 5;
    DonutSides = 60;
  
  }

  if  (flipFlop == true) {
    eyeBallDiam = 65;
    pupilDown = 20;
    pupilCloser = 205;
    mouthDown = 77;
    lowerJaw = 217;
    noseFoward = 30;
    mouthUp= 211;
    hairMove = 90;
    hairMovetwo = 105; 
    bubbleMoveOne = 35;
    bubbleMoveTwo = 65;
    bubbleMoveThree = 165;
    bubbleMoveOneB = 25;
    bubbleMoveTwoB = 0;
    bubbleMoveThreeB = -10;
    hairStroke = 40;
    HairArray[0] = 220;
    DonutDrop = 10;
    DonutDropS = 1;
    DonutSides = 30;
    
  } 


  translate(150, 150);
  noStroke();


  // clouds
  fill (250, 250, 250);
  ellipse (bubbleMoveOneB, 75, bubbleMoveOne, bubbleMoveOne);
  ellipse (55, 55, bubbleMoveTwo, bubbleMoveTwo);
  ellipse (20, 15, bubbleMoveThree, 115);

  //face
  fill(247, 238, 90);
  ellipse(150, 97, 127, 127);
  rect(87, 97, 127, 107);

  //neck
  fill(247, 238, 90);
  rect(87, 127, 87, 127);

  //eyes
  fill(0, 0, 0);
  ellipse(197, 140, eyeBallDiam, eyeBallDiam);

  //nose
  fill(247, 238, 90);
  rect(206, 159, 20.5, 17.5);
  ellipse(226, 167, noseFoward, 17.5);

  //eyeballback
  fill(255, 255, 255);
  ellipse(197, 140, eyeBallDiam, eyeBallDiam);

  //pupil
  fill(HairArray[0], HairArray[1], HairArray[2]);
  ellipse(pupilCloser, 140, pupilDown, pupilDown);

  //mouth
  fill(168, 105, 40);
  ellipse(197, lowerJaw, 67.5, 47.5);
  ellipse(185, 207, mouthDown, mouthDown);


  //hair
  stroke( hairStroke);
  line(83, 155, hairMove, 125);
  line(95, 125, 115, 155);
  line(103, 155, hairMovetwo, 125);
  line(115, 125, 135, 155);

  //mouthline
  stroke(hairStroke);
  line(207, mouthUp, 227, 207);

  //tophair
  noFill();
  arc(150, 45, 50, 50, PI+QUARTER_PI, TWO_PI);
  arc(150, 45, 50, 50, PI, PI+QUARTER_PI);
  arc(158, 45, 58, 50, PI+QUARTER_PI, TWO_PI);
  arc(158, 45, 58, 50, PI, PI+QUARTER_PI);

  //text 
  String s = "D'OH!";
  fill(50);
  text(s, -10, -15, 70, 80);  // Text wraps within text box

  //donut
  noStroke();
  fill (240, 175, 46);
  ellipse ( 20, 35,    DonutSides , DonutDrop );
  fill (242, 110, 218);
  ellipse ( 20, 30,    DonutSides , DonutDrop );
  fill (0, 0, 0);
  ellipse ( 20, 30, 15 , DonutDropS );
}

void keyPressed () {
  flipFlop =! flipFlop;
  keyPrompt = ("");
}



