
Cockpit[] units;
PFont font;
String[] words = {"i", "i", "i", "i", "i", "d", "d","d", "d", "d","i", "i", "i","i", "i", "v" ,"v", "v", "v", "v", "a", "a", "a", "a", "a", "d", "d", "d", "d", "d"};
String s = "Vertigo";
float angle = 0.0;
int opacity = 0;
int numOfWords = words.length;
int expantion = 10;
int i;
void setup() {
  size(400, 400);
  font = loadFont("Aharoni-Bold-48.vlw");
  fill(0);
  units = new Cockpit[numOfWords];
  for (i = 0; i < numOfWords; i++){
    units[i] = new Cockpit(width/2, height/2, expantion , i);
    expantion += 10;
  }
  //frameRate(16);
}
void draw(){
  background(252, 161, 23);
  for(i = 0; i < numOfWords; i++){
    units[i].shaper();
  }
  if(mousePressed){
    background(252, 161, 23);
    for(i = 0; i < numOfWords; i++){
      units[i].shaper();
    }  
    noLoop();
  }
}

class Cockpit{
  int  yCenter, xCenter, iniWidth, iniHeigth, numOfWord;
  float  speed, myCurrentWidth, myFinalWidth, myColor, xWord, yWord, wordPositionAngle, diameter, orbitingSpeed, fontSize, speedBackUp;
  String myWord;
  
  Cockpit(int _xCenter, int _yCenter, int _maxExpansion, int _numOfWord){
     xCenter = _xCenter;
     yCenter = _yCenter;
     myFinalWidth =  _maxExpansion;
     speed = myFinalWidth/300;                 //FINAL SPEED SETTER  
     myCurrentWidth = 0;
     wordPositionAngle = random(0, TWO_PI);
     wordPositionAngle = TWO_PI;
     fontSize = 4;
     myWord = words[_numOfWord];
  }
  
 void shaper(){
   if(myCurrentWidth < myFinalWidth){
     positionWord();
   }
   else{
     embraceOrbit();
   }
 }
  
 float expandOrbit(){
      //ORBIT EXPANTION CONTROLLER
      if(myCurrentWidth >= myFinalWidth){
        myCurrentWidth = myFinalWidth;
        return myCurrentWidth;
      }else {
        fontSize = fontSize + (speed/ 7);
        myCurrentWidth = myCurrentWidth + speed;
        return (myCurrentWidth - speed);
      }
 }
 void positionWord(){
    char c = myWord.charAt(0);
      wordPositionAngle = wordPositionAngle + (speed/ 10);
      diameter = expandOrbit();
      diameter = diameter/2;
      xWord = xCenter + (cos(wordPositionAngle) * diameter);
      yWord = yCenter - (sin(wordPositionAngle) * diameter);
      //textFont(font, fontSize);
      fill(0, 102, 153, 255*(diameter/100));
      //text(myWord, xWord, yWord);
     text(c, xWord, yWord);
 }
 
 void embraceOrbit(){
     char c = myWord.charAt(0);
     wordPositionAngle = wordPositionAngle + (speed/ 10);
     xWord = xCenter + (cos(wordPositionAngle) * diameter);
     yWord = yCenter - (sin(wordPositionAngle) * diameter);
     textFont(font, fontSize);
     fill(0, 102, 153, 255*(diameter/100));
     text(c, xWord, yWord);
     return;
 }  
    
    
}


