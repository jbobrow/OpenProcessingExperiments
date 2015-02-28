
boolean flipFlop = false;
String keyPrompt = "press any key";
//arrays
float eyeBallDiamLeft[] = {20, 40};
float eyeBallDiamRight[] = {20, 40};
float pupilLeft[] = {5,10};
float pupilRight[] = {5,10};
float mouthWidth[] = {10,110};
float mouthCover[] = {10,110};
float bodyColor[] = {0, 255, 0, 255, 0, 255};
float noseColor[] = {0, 255, 0, 255, 0, 255};
float antennaColor[] = {0, 255, 0, 255, 0, 255};
float headWidth[] = {100, 300};
float bodyWidth[] = {200, 400};

//default
float _eyeBallDiamLeft = 65;
float _eyeBallDiamRight = 50;
float _pupilLeft = 35;
float _pupilRight = 20;
float _mouthWidth = 90;
float _mouthCover = 60;
float _bodyColorA = 100;
float _bodyColorB = 100;
float _bodyColorC = 200;
float _noseColorA = 100;
float _noseColorB = 100;
float _noseColorC = 150;
float _antennaColorA = 0;
float _antennaColorB = 178;
float _antennaColorC = 201;
float _headWidth = 150;
float _bodyWidth = 200;

void setup(){
  size(300, 300);
  background(100, 300, 150);
  textSize(12);
}

void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}


void keyPressed(){
  _eyeBallDiamLeft = random(eyeBallDiamLeft[0], eyeBallDiamLeft[1]);
  _eyeBallDiamRight = random(eyeBallDiamRight[0], eyeBallDiamRight[1]);
  _pupilLeft = random(pupilLeft[0], pupilLeft[1]);
  _pupilRight = random(pupilRight[0], pupilRight[1]);
  _mouthWidth = random(mouthWidth[0], mouthWidth[1]);
  _mouthCover = random(mouthCover[0], mouthCover[1]);
  _bodyColorA = random(bodyColor[0], bodyColor[1]);
  _bodyColorB = random(bodyColor[2], bodyColor[3]);
  _bodyColorC = random(bodyColor[4], bodyColor[5]);
  _noseColorA= random(noseColor[0], noseColor[1]);
  _noseColorB= random(noseColor[2], noseColor[3]);
  _noseColorC= random(noseColor[4], noseColor[5]);
  _antennaColorA = random(antennaColor[0], antennaColor[1]);
  _antennaColorB = random(antennaColor[2], antennaColor[3]);
  _antennaColorC = random(antennaColor[4], antennaColor[5]);
  _headWidth = random(headWidth[0], headWidth[1]);
  _bodyWidth = random(bodyWidth[0], bodyWidth[1]);
  
  keyPrompt = ("");
}


void makeFace(){
  background(100,300,150);
  noStroke();
  rectMode(CENTER);
  translate(150,150);
  
//body
fill(_bodyColorA, _bodyColorB, _bodyColorC);
ellipse(0, 200, _bodyWidth, 200);


//hair
stroke(_antennaColorA, _antennaColorB, _antennaColorC);
strokeWeight(10);
line(0, -130, 0, -100);
fill(0, 178, 201);
ellipse(0, -100, 10, 10);
ellipse(0, -130, 10, 10);
fill(255);
ellipse(3, -130, 3, 3);


//head
rectMode(CENTER);
fill(_bodyColorA, _bodyColorB, _bodyColorC);
noStroke();
rect(0, 0, _headWidth, 200, 100);
ellipse(0, 90, 70, 40);


//eyes
fill(255);
ellipse(-25, -50, _eyeBallDiamLeft, _eyeBallDiamLeft);
ellipse(25, -50, _eyeBallDiamRight, _eyeBallDiamRight);
fill(0);
ellipse(-25, -50, _pupilLeft, _pupilLeft);
ellipse(25, -50, _pupilRight, _pupilRight);


//nose
fill(_noseColorA, _noseColorB, _noseColorC);
ellipse(0, 0, 50, 30);
fill(0);
ellipse(-10, 0, 5, 5);
ellipse(10, 0, 5, 5);


//mouth
fill(0);
ellipse(0, 50, _mouthWidth, 45);
fill(_bodyColorA, _bodyColorB, _bodyColorC);
ellipse(0, 30, _mouthCover, 30);
}


