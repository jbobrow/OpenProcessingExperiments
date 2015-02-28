
/*
* A merge of:
* http://www.openprocessing.org/sketch/71097 and
* http://www.openprocessing.org/sketch/15161
* 2013 fe
*/




PImage reference;
int SPEED = 0;
int TESTS = 10;
//the percent that colours must have in common to link together
float ACCURACY = 85;
float DISTANCE = 300;
//stops from getting stuck on a single colour
int MAXTRIES = 1000;
 
int locTest;
color colTest;
int xTest;
int yTest;
float testTot;
 
color col;
int loc;
int x;
int y;
 
int count = 0;
int tries = 0;
boolean newPix = true;


///-----------------------
Line ln;
Line lns[];
int LANDSCAPE;
 
String words[] = {
 "Kompetenz ist ...................", 
 "die Faehigkeit ...................", 
 "von Zellen, ...................", 
 "frei im ...................", 
 "umgebenen Medium ...................", 
 "vorhandene DNA ...................", 
 "aufzunehmen und damit ...................", 
 "Voraussetzung fuer die ...................", 
 "Transformierbarkeit ...................", 
 "von Bakterien.", 
 "", 
 "iCompetence", 
};
///-----------------------
 
void setup(){
  reference = loadImage("data/icColors.png");
  //size(reference.width,reference.height,P3D);
  size(756,628,P3D);
  background(0); 
  strokeWeight(1);
  
///-----------------------
   //size(600, 350, P3D);
 
   
  // Array of line objects
  lns = new Line[12];
 
  // Load the font from the sketch's data directory
  textFont(loadFont("Univers-66.vlw"), 1.0);
 
  // White type
  fill(255);
 
  // Creating the line objects
  for(int i = 0; i < 12; i++) {
    // For every line in the array, create a Line object to animate
    // i * 70 is the spacing
    ln = new Line(words[i], 0, i * 70);
    lns[i] = ln;
  }
   
  hint(DISABLE_DEPTH_MASK);
///-----------------------
}
 
 
void draw(){ 
   
  if(DISTANCE > 35) DISTANCE -= .1;
  if(SPEED < 8000) SPEED ++;
   
  for(int i = 0; i < SPEED; i++){
     
    if(newPix || tries > MAXTRIES){
      newPix = false;
      tries = 0;
      //choose a random pixel to test for
      locTest = int(random(reference.pixels.length));
      //grab its colour/position
      colTest  = reference.pixels[locTest ];
      xTest  = locTest  % reference.width;
      yTest  = locTest / reference.width;   
       
      //generates the value for that colour
      float rV = colTest >> 16 & 0xFF;
      float gV = colTest >> 8 & 0xFF;
      float bV = colTest & 0xFF;
      testTot = rV + gV + bV;
    }
         
    //choose a random pixel
    loc = int(random(reference.pixels.length));
    col = reference.pixels[loc];
     
    //test   
    if(colorTest(col)){     
      x = loc % reference.width;
      y = loc/ reference.width;
      if(dist(xTest,yTest,x,y) <= DISTANCE){
        stroke(colTest,40);
        //enable to make spiderweb like drawings
        //stroke(brightness(col),50);
        line(xTest,yTest,x,y);
        count++;
      }
    }
 
    //resets counter
    if(count > TESTS){
      newPix = true;
      count = 0;
    }
    tries++;
  }
    
///----------------------
  //background(0);
   
  translate(-200, -50, -450);
  rotateY(0.3);
 
  // Now animate every line object & draw it...
  for(int i = 0; i < 12; i++) {
    float f1 = sin((i + 1.0) * (millis() / 10000.0) * TWO_PI);
    float f2 = sin((8.0 - i) * (millis() / 10000.0) * TWO_PI);
    Line line = lns[i];
    pushMatrix();
    translate(0.0, line.yPosition, 0.0);
    for(int j = 0; j < line.myLetters.length; j++) {
      if(j != 0) {
        translate(textWidth(line.myLetters[j - 1].myChar) * 75, 0.0, 0.0);
      }
      rotateY(f1 * 0.005 * f2);
      pushMatrix();
      scale(75.0);
      text(line.myLetters[j].myChar, 0.0, 0.0);
      popMatrix();
    }
    popMatrix();
  }
///-----------------------

    
    
}
 
//tests colour similarities
boolean colorTest(color _col){
   
  float rV = _col >> 16 & 0xFF;
  float gV = _col >> 8 & 0xFF;
  float bV = _col & 0xFF; 
  float tot = rV + gV + bV;
  
 //check similarity
 float perc = (testTot/tot) *100;
  
 if(perc >= ACCURACY ){
   return true;
 }else return false;
}

class Letter
{
  char myChar;
  float x;
  float y;
   
  Letter(char c, float f, float f1)
  {
    myChar = c;
    x = f;
    y = f1;
  }
}
class Line
{
  String myString;
  int xPosition;
  int yPosition;
  int highlightNum;
  float speed;
  float curlInX;
  Letter myLetters[];
   
  Line(String s, int i, int j)
  {
    myString = s;
    xPosition = i;
    yPosition = j;
    myLetters = new Letter[s.length()];
    float f1 = 0.0;
    for(int k = 0; k < s.length(); k++)
    {
      char c = s.charAt(k);
      f1 += textWidth(c);
      Letter letter = new Letter(c, f1, 0.0);
      myLetters[k] = letter;
    }
 
    curlInX = 0.1;
  }
}
class Word
{
  String myName;
  int x;
   
  Word(String s)
  {
    myName = s;
  }
}



