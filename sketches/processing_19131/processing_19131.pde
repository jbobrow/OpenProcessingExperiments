
char[] charArr = {'M', '6', 'M', '5', 'K', '5'};//defining the list of chars

void setup () {
  size (250, 250);
  background (30);
  smooth ();
  //defining the fonts
  PFont font;
  font = loadFont ("Arial-BoldMT-120.vlw");
  textFont (font, 48);
  frameRate (18);
};

int counter = 0;
float yPos = 0;
float y2Pos = 0;
float y3Pos = 0;
float y4Pos = 0;
float xPos = random (width);
float x2Pos = random (width);
float x3Pos = random (width);
float x4Pos = random (width);
float alphaValue = 0;
float alphaValue2 = 0;
float alphaValue3 = 0;
float alphaValue4 = 0;

    

    
  
void draw () {
  noStroke ();
  fill (30, 50);
  rect (0, 0, width, height);

  counter++;
  yPos += 5;
  y2Pos += 5;
  y3Pos += 5;
  y4Pos += 5;
  alphaValue +=10;
  alphaValue2 +=5;
  alphaValue3 +=20;
  alphaValue4 +=15;
  
  //generating the random chars
  if (counter > charArr.length-1) {
    counter = 0;
  };
  
  if (yPos > height) {
    alphaValue = 0;
    xPos = random (width);
    yPos = random(height);
  };
  if (alphaValue > 255) {
    alphaValue = 0;
    xPos = random (width);
    yPos = random(height);
  };
  fill (#FBB03B, alphaValue);
  textSize (24);
  text (charArr[counter], xPos, yPos);
  
  //generating the random chars
  if (y2Pos > height) {
    alphaValue2 = 0;
    x2Pos = random (width);
    y2Pos = random(height);
  };  
   if (alphaValue2 > 255) {
    alphaValue2 = 0;
    x2Pos = random (width);
    y2Pos = random(height);
  };
  fill (#F15A24, alphaValue2);
  textSize (24);
  text (charArr[counter], x2Pos, y2Pos);
  
  //generating the random chars
  if (y3Pos > height) {
    alphaValue3 = 0;
    x3Pos = random (width);
    y3Pos = random(height);
  };  
   if (alphaValue3 > 255) {
    alphaValue3 = 0;
    x3Pos = random (width);
    y3Pos = random(height);
  };  
  fill (#0071BC, alphaValue3);
  textSize (48);
  text (charArr[counter], x3Pos, y3Pos);
  
  //generating the random chars
  if (y4Pos > height) {
    y4Pos = random(height);
    x4Pos = random (width);
    alphaValue4 = 0;
  };  
   if (alphaValue4 > 255) {
    alphaValue4 = 0;
    x4Pos = random(width);
    y4Pos = random(height);
  };   
  fill (#8CC63F, alphaValue4);
  textSize (36);
  text (charArr[counter], x4Pos, y4Pos);
};



