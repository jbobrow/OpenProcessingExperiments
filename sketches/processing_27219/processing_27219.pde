
/*This code is for a simple typerwriter but also adds the capability to press
the number 1 and have the screen full of random letters and characters.*/

String text1 = " ";
PFont font;
int bfill = 150;
boolean randomizer = false;

void setup() {
  size(400, 400);
  smooth();
  font = loadFont("Arial-Black-48.vlw");
  textFont(font, 20);
}

void draw() {

  background(bfill);
  fill(255);
  text(text1, 0, 40, width, height);
  if(randomizer) {
    for(int j = 0; j < 400; j++) {
      text1 += char(int(random(18, 126)));
    }
    text(text1, 0, 40, width, height);
    text1 = " ";
  }
  
}

void keyPressed() {
  if (key == BACKSPACE) {
    if(text1.length() > 0) {
      text1 = text1.substring(0, text1.length() - 1);
    }
  } 
  else if (key == '1') {
    randomizer = true;
  }
  else {
    text1 += key;
  }
}


