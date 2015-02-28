
/**
ControlP5 bitFont.
this example shows you how to load your own pixel fonts into controlP5. Each letter is 
separated by a red dot at the top of the source bit-font image. How a bit-font is created 
and has to be formatted, see the examples fonts inside the data folder of this sketch.
The following characters are supported (the first character is a SPACE). 
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
 
Example sketch ControlLabelExtended shows you how to use PFont instead of a bitfont.
by andreas schlegel, 2009
****************message to coders************
Let's start building education applications! 
The world needs more educational applications! Take a look at Kahn Academy and see which apps
could be copied in Processing.

We can build stand alone educational applications that can run in browsers with no Internet. 


*/

/*******************import**********************/
import controlP5.*;

/*******************variables**********************/
ControlP5 controlP5;
controlP5.Label label;
Textfield myTextfield;
int myBitFontIndex;

/*******************initialization**********************/
void setup() {
  size(800,300);
  controlP5 = new ControlP5(this);
  label = new controlP5.Label(this, "ControlP5 library from Andreas Schegel.", 200,160);//
  //why is the above text being cut off?!
  //Label(processing.core.PApplet theApplet, java.lang.String theText, int theWidth, int theHeight)
  label.position.x = 100;
  label.position.y = 100;
  label.toUpperCase(false);
  // load a new font and apply it to the newly created label.
  int myBitFontIndex = label.bitFontRenderer.addBitFont(loadImage("myFontA.gif"));
  label.setFont(myBitFontIndex);

  // apply the newly loaded bit font to the below textfield.
  myTextfield = controlP5.addTextfield("textinput",300,160,200,60);//this is where you type the words
  //Textfield(ControlP5 theControlP5, ControllerGroup theParent, java.lang.String theName, 
  //java.lang.String theDefaultValue, int theX, int theY, int theWidth, int theHeight)
  myTextfield.setFocus(true);
  myTextfield.valueLabel().setFont(myBitFontIndex);
  myTextfield.valueLabel().style().marginTop = -2;
}
/*******************draw**********************/
void draw() {
  background(0);
  label.draw(this);
}
/*******************text input**********************/
void textinput(String theValue) {
  label.set(theValue);
}

/*******************mouse pressed**********************/
void mousePressed() {
  // change the font of our label when the mouse is pressed.
  if(label.getFont() == ControlP5.standard56) {
    label.setFont(ControlP5.standard58);
  } 
  else {
    label.setFont(ControlP5.standard56);
  }
}


