
/*
Aris Bezas

Create Class that will create object with charactreristics:
 - visualize a letter or a word
 - speed and direction (http://processing.org/learning/topics/bounce.html)
 - color
 */
 
PFont font;
KinoumeniLexi lexi[];

String lexeis[];


int numLexeis = 2000;

void setup() {
  size(600,600);
  font = loadFont("Serif-48.vlw");
  textFont(font,16);
  smooth();
  
  
  String characters = "*)&^@!)*&#!)*@&#%!)*&@#%";
  
  lexi = new KinoumeniLexi[numLexeis];
  
//  lexeis[0] ="melina";
//  lexeis[1] ="szkdjfhg";  
  
  for (int i = 0; i < numLexeis; i++)  {
    lexi[i] = new KinoumeniLexi(random(10), random(10), characters.charAt(int(random(10))));
    //lexi[i] = new KinoumeniLexi(random(10), random(10), lexeis[i]);
  }
 
}

void draw() {
  background(0);
  for (int i = 0; i < numLexeis; i++)  {
    lexi[i].draw();
  }
}

class KinoumeniLexi {
  float xpos, ypos;
  float xspeed = 12.8;  // Speed of the shape
  float yspeed = 12.2;  // Speed of the shape

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  
  char word;


  KinoumeniLexi(float xSpeedVar, float ySpeedVar, char wordVar) {
    xspeed = xSpeedVar;
    yspeed = ySpeedVar;
    word = wordVar;
  }

  void draw() {
    // Update the position of the shape
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );

    // Test to see if the shape exceeds the boundaries of the screen
    // If it does, reverse its direction by multiplying by -1
    if (xpos > width || xpos < 0) {
      xdirection *= -1;
    }
    if (ypos > height || ypos < 0) {
      ydirection *= -1;
    }


    text(word, xpos, ypos);
  }
}


