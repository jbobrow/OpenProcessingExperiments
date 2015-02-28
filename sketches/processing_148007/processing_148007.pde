
/**
typedinput taken from http://wiki.processing.org/index.php/Typed_input
@author Tom Carden
*/
 
String typedText = "your text here";
 
PFont font;
 
void setup() {
  size(400, 400);
  font = createFont("Helvetica", 18);  
}
 
void draw() {
  background(255);
  fill(255,0,0);
  textFont(font,18);
  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 35, 45);
}
 
void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      // comment out the following two lines to disable line-breaks
      typedText += "\n";
      break;
    case ESC:
    case DELETE:
      break;
    default:
      typedText += key;
    }
  }
}

