
float _distanceToBottom = 100;
float _xMiddleDistance = 0;
int _currentChar = 0;
PFont _myFont =  createFont("",120,true);
float _fontSize = 120;
float _color1, _color2, _color3;

void setup() {
  size(800, 600);
  background(255);
  textAlign(CENTER);
  textFont(_myFont,_fontSize);

}

void draw() { 
}

void keyReleased(){
  placeChar(key);
}

void placeChar(char character){
  fill(255,60);
  rect(0, 0, width, height);

  char char1 = Character.toLowerCase(character);
  char char2 = rot13(char1);

  float x1, y, x2, halfwidth;
  if (_distanceToBottom > (height-(height/4))){
    _distanceToBottom = 100;
  }
  y = random(_distanceToBottom+20, _distanceToBottom+100);
  _distanceToBottom = y;
  halfwidth = width/2;


  if (_currentChar == 0){
    textFont(_myFont, random(_fontSize-20, _fontSize+20));
    _xMiddleDistance = random(0, halfwidth-(halfwidth/4));
    _color1 = random(255);
    _color2 = random(255);
    _color3 = random(255);
  }
  else{
    _xMiddleDistance += random(-125,75);

  }


  if (Character.isWhitespace(character) || _currentChar > 6){
    _currentChar = 0;
  }
  else{
    _currentChar++;
  }

  x1 = halfwidth - _xMiddleDistance;
  x2 = halfwidth + _xMiddleDistance;

  fill(_color1, _color2, _color3);
  text(char1, x1, y, 0);
  text(char2, x2, y, 0);

}

char rot13(char inputkey){
  char c = inputkey;
  if       (c >= 'a' && c <= 'm') c += 13;
  else if  (c >= 'n' && c <= 'z') c -= 13;
  return c;
}

