
int numFrames = 3;
int frame = 0;
PImage[] images = new PImage[numFrames];
PImage img;
float _distanceToBottom = 100;
float _xMiddleDistance = 0;
int _currentChar = 500;
PFont _myFont =  createFont("", 110, true);
float _fontSize = 110;
float _color1, _color2, _color3;

void setup() 
{
  
  size(800, 606);
  frameRate(2000);


for (int i = 0; i < Cloud.length; i++ ) {
    Cloud[i] = new Cloud(random(width), random(height), random(0, 3));
  }
}

Cloud[] Cloud = new Cloud[3];

void draw() {
  PImage img;
  img = loadImage("sky.jpg");
  background(img);
  frame = (frame +3);
  if (frame>=numFrames){
    frame=3;

}

  if (mousePressed == false)
    for (int i = 0; i < Cloud.length; i++ ) { 
      Cloud[i].swimfast();
      Cloud[i].killerfish();
      Cloud[i].display();
    } 
  else {      
    for (int i = 0; i < Cloud.length; i++ ) { 
      Cloud[i].swim();
      Cloud[i].display();
    }
  }
}


class Cloud {   

  float xpos;
  float ypos;
  float xspeed; 

  Cloud(float tempx, float tempy, float tempspeed) {
    
    println("a Cloud has been created");


    xpos = tempx;  
    ypos = tempy;
    xspeed = tempspeed;
  }

  void display() {
    PImage Cloud;
    Cloud = loadImage("cloud1.png");
    image(Cloud, xpos, ypos);
  }

  void swim() {             
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

  void swimfast() {             
    xpos = xpos + 25*xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

  

void killerfish() {
    PImage killerfish;


    imageMode(CENTER);
}
}

void keyReleased() {
  placeChar(key);
}

void placeChar(char character) {
  fill(255, 60);
  rect(0, 0, width, height);

  char char1 = Character.toLowerCase(character);


  float x1, y, x2, halfwidth;
  if (_distanceToBottom > (height-(height/4))) {
    _distanceToBottom = 50;
  }
  y = random(_distanceToBottom+20, _distanceToBottom+100);
  _distanceToBottom = y;
  halfwidth = width/2;


  if (_currentChar == 0) {
    textFont(_myFont, random(_fontSize-20, _fontSize+20));
    _xMiddleDistance = random(0, halfwidth-(halfwidth/4));
    _color1 = (0);
    _color2 = (0);
    _color3 = (0);
  }
  else {
    _xMiddleDistance += random(-125, 75);
  }


  if (Character.isWhitespace(character) || _currentChar > 5) {
    _currentChar = 0;
  }
  else {
    _currentChar++;
  }

  x1 = halfwidth - _xMiddleDistance;
  x2 = halfwidth + _xMiddleDistance;

  fill(_color1, _color2, _color3);
  text(char1, x1, y, 0);
}

