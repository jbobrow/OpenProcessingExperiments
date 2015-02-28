
//based on information found @ http://processing.org/tutorials/text/

PFont f;
String m = "Messages didn't load.";
String UIMessage = "(change message with arrow keys.)";

String[] quotes = new String[4];
int mNum = 0; 

void setup() {
  size(480, 200);
  f = createFont("Georgia", 20, true);
  quotes[0] = "tHE first character";
  quotes[1] = "is always white";
  quotes[2] = "and taller than the rest";
  quotes[3] = "to make things look pretty";
}

void draw() { 
  drawBackground();
  m = quotes[mNum];
  writeQuote(m, 50, height/2);
  writeUINote(UIMessage, (width/2), ((height/2)+(height/4)));
}

void drawBackground() {
  background(204);
  textFont(f);
}

void writeQuote(String message, int myStartX, int myStartY) {
  int x = myStartX;
  for (int i = 0; i < message.length(); i++) {
    if (i == 0) {
      fill(255);
      textSize(42); 
      message = message.toUpperCase();
      text(message.charAt(i), x, myStartY);
      // textWidth() spaces the characters out properly.
      x += textWidth(message.charAt(i));
    }
    else {
      fill(100);
      textSize(18);
      message = message.toLowerCase();
      text(message.charAt(i), x, myStartY);
      // textWidth() spaces the characters out properly.
      x += textWidth(message.charAt(i));
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT | keyCode == UP) {
    mNum ++;
  } 
  if (keyCode == LEFT | keyCode == DOWN) {
    mNum --;
  }
  
  if (mNum < 0) {
    mNum = quotes.size()-1;
  }
  
  if (mNum > (quotes.size()-1)) {
    mNum = 0;
  }
}

void writeUINote(String message, int myStartX, int myStartY) {
  textFont(f,12);                 
  fill(100);                       
  text(message,myStartX,myStartY);
}


