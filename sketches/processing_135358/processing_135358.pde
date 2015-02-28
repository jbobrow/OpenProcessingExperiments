
float _randomFaceSize[] = { 200, 300 }; //sets a range between 200-300
float _randomPupilSize[] = { 25, 50}; //sets a range between 25-50
float _randomLipColor[] = { 1 , 255 };//sets a range between 1-255
float _headWidth = 200; //start of the program it will be 200
float _headHeight = 200;
float _pupilArea = 40;
float _lipColorR = 249;
float _lipColorG = 64;  //set the RGB for the starting color
float _lipColorB = 91;

void setup()  // function that setups program
{
    size(300, 300); // size of window
    background(177,219,76); // color of the window
}

void draw()
{
  translate(150,150);
  makeFace();
  smooth();
}

void keyPressed()
{
    _headWidth  = random(_randomFaceSize[0], _randomFaceSize[1]);
    _headHeight = random(_randomFaceSize[0], _randomFaceSize[1]);
    _pupilArea  = random(_randomPupilSize[0], _randomPupilSize[1]);
    _lipColorR  = random(_randomLipColor[0], _randomLipColor[1]);    // set all variables to random value from the arrays
    _lipColorG  = random(_randomLipColor[0], _randomLipColor[1]);
    _lipColorB  = random(_randomLipColor[0], _randomLipColor[1]);
}

void makeFace()
{
  background(177,219,76);
  noStroke();
  
  fill(255);
  ellipse(0, 0, _headWidth, _headHeight);
  noStroke();
   
   
  //greeneyes
  noStroke();
  fill(66,195,255);
  ellipse(55,-55,65,65);
   
   
  //greeneyes
  noStroke();
  fill(66,195,255);
  ellipse(-55,-55,65,65);
   
  //blackeye
  noStroke();
  fill(0);
  ellipse( -55, -50, _pupilArea, _pupilArea);
  //whitecircleeye
  noStroke();
  fill(255);
  ellipse(-55,-50,10,10);
  //blackeye
  noStroke();
  fill(0);
  ellipse( 55, -50, _pupilArea, _pupilArea);
  //whitecircleeye
  noStroke();
  fill(255);
  ellipse(55,-50,10,10);
  //cheeckL
  noStroke();
  fill(255,218,253);
  ellipse(-55,13,55,55);
   
  //cheeckR
  fill(255,218,253);
  ellipse(55,13,55,55);
   
  //chin
  fill(255);
  ellipse(0,100,70,85);
   
   
   
  //hatcircle
  noStroke();
  fill(249,35,101);
  ellipse(-2,-130,40,40);
  //greeneyes
   
  //mouth-green
  noStroke();
  fill( _lipColorR, _lipColorG, _lipColorB);
  ellipse(0,90,75,50);
   
  noStroke();
  fill(255,255,255);
  ellipse(0,90,75,10);
  //eyelashes-right
  rectMode(CENTER);
  fill(20,300,40);
  noStroke();
  fill(0);
  rect(80,-85,3,20);
  rect(70,-87.5,3,20);
  rect(60,-89,3,20);
  rect(50,-91,3,20);
  rect(40,-87.5,3,20);
  //eyelashes-left
  rect(-80,-85,3,20);
  rect(-70,-87.5,3,20);
  rect(-60,-89,3,20);
  rect(-50,-91,3,20);
  rect(-40,-87.5,3,20);
   
   // nose
  noStroke();
  fill(255);
   
  //hat
  fill(249,35,101);
  triangle(0,-130,-120,-95,120,-95);
   // nose
  noStroke();
  fill(255);
  fill(0);
   triangle(0,-15, -15, 55, 15, 55);
}


