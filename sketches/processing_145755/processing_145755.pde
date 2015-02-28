
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

float randNum;
float randNum2;
float randNum3;
float randNum4;
float randNum5;
float randNum6;
float randNum7;
float randNum8;





void setup () {
  size(500, 500);
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


  // thought
  fill (250, 250, 250);
  ellipse (bubbleMoveOneB, 75, bubbleMoveOne, bubbleMoveOne);
  ellipse (55, 55, bubbleMoveTwo, bubbleMoveTwo);
  ellipse (randNum7, 15, bubbleMoveThree, 115);
  
  //clouds
  fill (250, 250, 250);
  ellipse (105,-75,55,55);
  ellipse (155,-75,85,55);
  ellipse (130,-95,85,55);
  ellipse (randNum8,-75,85,55);
  
  fill (250, 250, 250);
  ellipse (-15,205,55,55);
  ellipse (-25,randNum8,85,55);
  ellipse (-30,225,85,55);
  ellipse (-15,215,85,55); 
  
  fill (250, 250, 250);
  ellipse (-15,205,55,55);
  ellipse (-25,randNum8,85,55);
  ellipse (-30,225,85,55);
  ellipse (-15,randNum8,85,55);
  
  fill (250, 250, 250);
  ellipse (275,265,55,55);
  ellipse (325,245,85,55);
  ellipse (255,235,85,55);
  ellipse (randNum8 ,275,85,55);




  //face
  fill(247, 238, 90);
  ellipse(150, 97, 127, 127);
  rect(87, 97, 127, 107);

  //neck
  fill(247, 238, 90);
  rect(87, 127, 86, randNum6);

  //eyes
  fill(0, 0, 0);
  ellipse(197, randNum3, eyeBallDiam, eyeBallDiam);

  //nose
  fill(247, 238, 90);
  rect(206, 159, 20.5, 17.5);
  ellipse(226, 167, noseFoward,17.5);

  //eyeballback
  fill(255, 255, 255);
  ellipse(197, 140, eyeBallDiam, eyeBallDiam);

  //pupil
  fill(HairArray[0], HairArray[1], HairArray[2]);
  ellipse(pupilCloser, randNum, pupilDown, pupilDown);

  //mouth
  fill(168, 105, 40);
  ellipse(197, lowerJaw, 67.5, randNum2);
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
  arc(150, 45, 50, randNum4, PI+QUARTER_PI, TWO_PI);
  arc(150, 45, 50, 50, PI, PI+QUARTER_PI);
  arc(158, 45, 58, randNum5, PI+QUARTER_PI, TWO_PI);
  arc(158, 45, 58, 50, PI, PI+QUARTER_PI);

  //text 
  String s = "D'OH!";
  fill(50);
  text(s, -10, -15, 70, 80);  // Text wraps within text box

  //donut1
  noStroke();
  fill (240, 175, 46);
  ellipse ( 20, 35,    DonutSides , DonutDrop );
  fill (242, 110, 218);
  ellipse ( 20, 30,    DonutSides , DonutDrop );
  fill (0, 0, 0);
  ellipse ( 20, 30, 15 , DonutDropS );
  
  //donut2
  noStroke();
  fill (240, 175, 46);
  ellipse ( 270, 30, DonutSides , DonutDrop );
  fill (242, 110, 218);
  ellipse ( 270, 20, DonutSides , DonutDrop );
  fill (0, 0, 0);
  ellipse ( 270, 20, 20 , DonutDropS );
  
}

void keyPressed () {
  flipFlop =! flipFlop;
  keyPrompt = ("");
  randNum =  random(110,160);
  randNum2 = random(50,80); 
  randNum3 = random(600,300);
  randNum4 = random(-75,75); 
  randNum5 = random(-60,60);
  randNum6 = random(80,300); 
  randNum7 = random(10,300);
  randNum8 = random(20,300);

}



