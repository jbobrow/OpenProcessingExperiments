
/*
 
 Use keys 1 and 2 to switch between the slow and blurry / fast and crisp text modes.
 Click on mouse to switch the color of the font.
 Enter key makes a sreenshot.
 
 Reference:
 
 1)
 Processing: A Programming Handbook for Visual Designers and Artists
 Pg. 330 example
 
 2)
 Strings and Drawing Text | Processing.org:
 http://processing.org/learning/text/
 
 */
 

int mode = 1;

PFont font;
String[] words = {
  "I was", "in this", "prematurely", "air-conditioned", "supermarket", " "
};

int whichWord = 0;
int density = 4;
float x = 0;
float y = 0;


void setup()
{
  size(900, 350, P3D);
  noStroke();
  background(150);
  cursor(CROSS);
  noFill();
  font = loadFont("Garamond-48.vlw");
  textFont(font);
  textAlign(CENTER);
}




void draw()
{  
  if ( mode == 1 )
  {
    float fontSz = random (90);
    float blurRate = random (2);
    frameRate(200);
    
    if (mousePressed) {
      fill (40);
    } else {
      fill (240);
    }

    pushMatrix();
    translate(0, 0, fontSz);
    textFont (font, 42);
    textAlign (CENTER);

    whichWord++;
    if (whichWord == words.length) {
      whichWord = 0;
    }
    text (words[whichWord], mouseX, mouseY);
    filter(BLUR, blurRate);
    popMatrix();
  }

  else if ( mode == 2)
  {
  float fontSz = random (250);
  float blurRate = random (2);
  frameRate(80);
  
  if (mousePressed) {
    fill (40);
  } else {
    fill (240);
  }
  translate (0, 0, fontSz);
  textFont (font, 42);
  textAlign (CENTER);

  whichWord++;
  if (whichWord == words.length) {
    whichWord = 0;
  }
  text (words[whichWord], mouseX, mouseY);
  }
}



void keyPressed()
{
  if ( key == '1' )
  {
    mode = 1;
  }
  else if ( key == '2' )
  {
    mode = 2;
  }
  else if ( key == ENTER )
  {
    saveFrame("example_####.png");
  }
}


