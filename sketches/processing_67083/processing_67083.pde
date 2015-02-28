
PFont arial;
String msg;
Letterwise[] letters;
float x, y;

void setup() {
  size(200,200);
  arial = createFont("Arial",28,true);
  textFont(arial);
    //fill(0);
    //textSize(28);
    //textAlign(LEFT);
  msg = "this is life.";
    x = (width/2)-(textWidth(msg)/2); 
    y = 100;
    letters = new Letterwise[msg.length()];
    for (int i=0; i<msg.length(); i++) {
      letters[i] = new Letterwise(msg.charAt(i), x, y);
      x = x + textWidth(msg.charAt(i));
    }
}

void draw() {
  background(255);
  //info message:
    textSize(10);
    fill(155);
    textAlign(CENTER);
    text("press the mouse to see what life is.",width/2,height-5);
    //reseting the desired text specifications:
      fill(0);
      textSize(28);
      textAlign(LEFT);
  for (int i=0; i<msg.length(); i++) {
    if(mousePressed) letters[i].shake();
      else letters[i].noshake();
    letters[i].display();
  }
}

class Letterwise {
  char letter;
  float posX, posY;
  float homeX, homeY;

  Letterwise (char letter_, float homeX_, float homeY_ ) {
    letter = letter_ ;
    posX = homeX = homeX_ ;
    posY = homeY = homeY_ ;
  }

  void display() {
    text(letter, posX, posY);
  }
  
  void noshake() {
    posX = homeX; 
    posY = homeY;
  }
  
  void shake() {
    fill(random(127,255),random(0,127),random(80,180));
    int w = width / 100 / 2;
    int h = height / 100;
    posX = posX + random(-w,w);
    posY = posY + random(-h,h);
  }   
}
