
/**
typedinput taken from http://wiki.processing.org/index.php/Typed_input
@author Tom Carden
*ideas
show the key value as it is being typed

How to debug this?
*/
String typedText = "Please help out by fixing this sketch if you can"; //this does not work... in fact I can't text () to work at all
String typedText = "your text here";//this works :)

 
PFont font;
 
void setup() {
  size(400, 400);
  font = createFont("Helvetica", 18);  //this works!
}
 
void draw() {
  background(255);
  fill(255,0,0);
  textFont(font,18);//this works too
  // this adds a blinking cursor after your text, at the expense of redrawing everything every frame
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), 35, 45);//the flashing works... what is the ? doing in the middle?
}
 
void keyReleased() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));//what is going on here?
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
                                                                
