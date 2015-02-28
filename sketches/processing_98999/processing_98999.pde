
Cockpit[] units;
PFont font;
String[] words = {"Vertigo", "strike", "y", "estas", "consectetur", "from", "a", "Lorem", "Ipsum", "passage", "and", "going", "through", "the", "cites", "ducimus", "qui", "blanditiis", "praesentium", "voluptatum", "Vertigo", "strike", "y", "estas", "consectetur", "from", "a", "Lorem", "Ipsum" };
String s = "Vertigo";
float angle = 0.0;
int opacity = 0;
int numOfWords = words.length;;
int i;
void setup() {
  size(600, 200);
  font = loadFont("Aharoni-Bold-48.vlw");
  fill(0);
  units = new Cockpit[numOfWords];
  for (i = 0; i < numOfWords; i++){
    units[i] = new Cockpit(width/2, height/2, 1600 , 27, i);
  }
  frameRate(10);
}
void draw(){
  //background(252, 161, 23);
  background(100, 100, 100);
  for(i = 0; i < numOfWords; i++){
    units[i].positionWord();
  }
}

class Cockpit{
  int    numOfWord;
  float  remainingWidth, yCenter, xCenter, speed,  myColor, xWord, yWord, wordPositionAngle , diameter, orbitingSpeed, myCurrentWidth, fontSize, speedBackUp, myFinalWidth, offset, nOffset;
  String myWord;
  
  Cockpit(int _xCenter, int _yCenter, int _myFinalWidth, int _maxSpeed, int _numOfWord){
     myFinalWidth = _myFinalWidth;
     myColor = random(45,225);
     speed = random(4,_maxSpeed);                 //FINAL SPEED SETTER
     speedBackUp = _maxSpeed;
     fontSize = 4;
     numOfWord = _numOfWord;
     myCurrentWidth = 0;
     myWord = words[numOfWord];
     calculateOffset();
  }
  
  void calculateOffset(){
     wordPositionAngle = random(0, TWO_PI);
     nOffset = random(0, 165);
     remainingWidth = myFinalWidth - nOffset;
     xCenter = width/2 + (cos(wordPositionAngle) * nOffset);
     yCenter = height/2 + (sin(wordPositionAngle) * nOffset);
  }
  
 float expandOrbit(){
      //ORBIT EXPANTION CONTROLLER
      if(myCurrentWidth > remainingWidth){
        calculateOffset();
        myCurrentWidth = 0;
        myCurrentWidth = myCurrentWidth + speed;
        fontSize = 4;
        return (myCurrentWidth - speed);
      }else {
        myCurrentWidth = myCurrentWidth + speed;
        
        return (myCurrentWidth - speed);
      }
   }
 void positionWord(){
      diameter = expandOrbit();
      diameter = diameter/2;
      xWord = xCenter + (cos(wordPositionAngle) * diameter);
      yWord = yCenter + (sin(wordPositionAngle) * diameter);
      if (fontSize < 130 ){
        fontSize = fontSize + (speed/10);
        textFont(font, fontSize);
        //fill(0, 102, 153, 255*(diameter/200));
        fill(0, 0, 0, 255*(diameter/200));
        text(myWord , xWord, yWord);
      }else{
        textFont(font, fontSize);
        //fill(0, 102, 153, 255*(diameter/200));
        fill(0, 0, 0, 255*(diameter/200));
        text(myWord , xWord, yWord);
      }
          
     return;
   
 }
   
    
    
}


