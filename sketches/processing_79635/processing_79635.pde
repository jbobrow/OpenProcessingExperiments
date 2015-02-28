
/**
 * Title: A5.2<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description: An interractive and dynamic work that takes your breath away <br>
 * Using the Layers external library, I looked at the tutorial here http://nootropicdesign.com/processing-layers/ <br>
 * and was inspired by this sketch http://nootropicdesign.com/processing-layers/LaserBurn/applet/index.html <br>
 **/

//import layers library
import com.nootropic.processing.layers.*;

// ----------------------------------------------------------------------
// GLOBAL VARIABLES
// ----------------------------------------------------------------------
Guy guy1;
AppletLayers layers;


// ----------------------------------------------------------------------
// BUILT-IN FUNCTIONS
// ----------------------------------------------------------------------
void setup() {
  size(500, 500);
  smooth();
  guy1 = new Guy(width);
  layers = new AppletLayers(this);
  BloodLayer b = new BloodLayer(this);
  TextLayer c = new TextLayer(this);
  layers.addLayer(b);
  layers.addLayer(c);
}
// paint method for Processing 1.5 or higher:
void paint(java.awt.Graphics g) {
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}
void draw() {
  //base will be the Guy Class, we don't need to create a layer for him
  guy1.display();
}
/**
 * Title:BLood Layer<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description: brush mimicking digital blood <br>
 * To achieve this, I looked at the PULSE array we had in class on nov 5th<br>
 **/

//BLOOD LAYER

class BloodLayer extends Layer {
  // ----------------------------------------------------------------------
  // GLOBAL VARIABLES
  // ----------------------------------------------------------------------
  BloodBrush[] bloodArray = new BloodBrush[1000];
  int bloodArrayIndex = 0;
  boolean beenDragged = false;
  //track how many elements to draw
  int drawIndex = 0;
  int x = mouseX;
  int y = mouseY;

  BloodLayer(PApplet parent) {
    super(parent);
  }
  // ----------------------------------------------------------------------
  // BUILT-IN FUNCTIONS
  // ----------------------------------------------------------------------

  void draw() {
    //The background clearing does not seem to be working, but
    //the blood works fine if I don't try to clear it??
    //same thing happens with the text!
    //background(0, 0);
    if (beenDragged) {
      for (int i = 0; i < bloodArrayIndex;i++) {
        //displa the contents for each element
        //display the content of the pulse array
        bloodArray[i].display();
        bloodArray[i].move();
      }
    }
  }
  // ----------------------------------------------------------------------
  // CUSTOM FUNCTIONS
  // ----------------------------------------------------------------------
  void mouseDragged() {
    beenDragged = true;
    //check  that pulseArrayIndexhas not exceeded the size of the array
    if (bloodArrayIndex < bloodArray.length) {
      //create a new pulse *and* store it in the array
      bloodArray[bloodArrayIndex] = new BloodBrush(mouseX, mouseY, 10);
      //increment the index
      bloodArrayIndex++;
    }
  }

  // ----------------------------------------------------------------------
  // CLASS 
  // ----------------------------------------------------------------------
  class BloodBrush {
    /* attributes */
    int x;    // x-coordinate of the blood
    int y;    // y-coordinate of the blood
    float brushSize = 10;  // size of eack blood drop

    /* methods */
    // constructor
    public BloodBrush(int bloodX, int bloodY, int newSize) {
      x = bloodX;
      y = bloodY;
      brushSize = newSize;
    }

    // drips the blood down
    void move() {
      y++;
    }


    // draws the blood
    void display() {
      brushSize = int(random(brushSize/5, brushSize));
      strokeWeight(brushSize);
      stroke(int(random(200, 255)), 20, 20, int(random(20, 255)));
      line(x, y, x, y+brushSize);
    }
  }
}
/**
 * Title:Guy Class<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description: Guy is a class that draws a square character for the bottom layer<br>
 **/

// ----------------------------------------------------------------------
// CLASS 
// ----------------------------------------------------------------------

class Guy {
  /* properties */
  Eye eye1;
  Eye eye2;
  Mouth mouth1;
  int x=0;         //y-coordinate(always draw from top corner of canvas)
  int y=0;        //x-coordinate(always draw from top corner of canvas)
  int guySize;  //size of the charater
  color fleshColor = color(225, 200, 180); //color of its skin
  color strokeColor = color(0, 0, 0);//color of the lines that compose him
  int strokeSize = 10;


  //constructor
  Guy(int newSize) {
    guySize = newSize;
  }

  void guyBody() {
    rectMode(CORNER);
    fill(fleshColor);
    strokeWeight(strokeSize);
    stroke(strokeColor);
    //body square, I am making sure that the stroke is consistent
    rect(x+strokeSize/2, y+strokeSize/2, guySize-strokeSize, guySize-strokeSize);

    //head and shoulder
    line(x, guySize*3/5, guySize*3/5, guySize*3/5);
    line(guySize*3/5, guySize*3/5, guySize*3/5, guySize/5);
    line(guySize*3/5, guySize/5, guySize*4/5, guySize/5);

    //arm and foot, not including fingers and toes
    line(guySize/5, guySize*3/5, guySize/5, guySize*4/5);
    line(guySize/5, guySize*4/5, guySize*4/5, guySize*4/5);
    line(guySize*4/5, guySize*4/5, guySize*4/5, guySize*2/5);

    //fingers and toes
    strokeWeight(strokeSize/2);
    //toes, vertical lines
    line (guySize/20, guySize*3/5, guySize/20, guySize*3/5+guySize/10);
    line (guySize/10, guySize*3/5, guySize/10, guySize*3/5+guySize/10);
    line (guySize/20*3, guySize*3/5, guySize/20*3, guySize*3/5+guySize/10);
    //fingers, horizontal lines
    line (guySize/5, guySize*3/5+guySize/20, guySize/5+guySize/10, guySize*3/5+guySize/20);
    line (guySize/5, guySize*3/5+guySize/10, guySize/5+guySize/10, guySize*3/5+guySize/10);
    line (guySize/5, guySize*3/5+guySize/20*3, guySize/5+guySize/10, guySize*3/5+guySize/20*3);
    //eyes
    eye1 = new Eye(guySize/10, guySize/10, guySize/5);
    eye2 = new Eye(guySize/10, guySize*3/7, guySize/10);
    eye1.display();
    eye2.display();
    mouth1 = new Mouth(guySize*2/5, guySize/10, guySize/10);
    mouth1.display();
  }
  void display() {
    guyBody();
  }
}
/**
 * Title:Guy Eye<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description: Eyeball follows the mouse <br>
 * To achieve this, I looked at the constrain example<br>
 * here: http://www.processing.org/reference/constrain_.html <br>
 **/
// ----------------------------------------------------------------------
// CLASS 
// ----------------------------------------------------------------------
class Eye {

  //properties
  int eyeSize = 100;//size of the eye
  int radius = eyeSize/5;//size of the iris
  int x;//position of the eye x
  int y;//position of the eye y



  /* methods */
  // constructor
  Eye (int newX, int newY, int newSize) {
    x = newX;
    y = newY;
    eyeSize = newSize;
    //closeEye = newEyes;
  }

  void display() {
    //boolean to see whether his eyer are closed
    boolean closeEye = false;
    if (mousePressed) {// while mouse is pressed, close eyes
      closeEye =!closeEye;
    }
    if (closeEye==true) {
      strokeWeight(5);
      stroke(0);
      fill(225, 200, 180);
      rect(x, y, eyeSize, eyeSize);
    }
    else {
      openEye();// otherwise, keep them open
    }
  }


  void openEye() {
    // set the bounds for the iris
    int innerBoundX = x+radius/2;
    int outerBoundX = x+ eyeSize-radius/2;
    int innerBoundY = y+radius/2;
    int outerBoundY = y+ eyeSize-radius/2;

    // set the position of the iris, following mouse, but constrained by bounds
    float mx = constrain(mouseX, innerBoundX, outerBoundX);
    float my = constrain(mouseY, innerBoundY, outerBoundY);

    //draw eye white
    noStroke();
    fill(255);
    rect(x, y, eyeSize, eyeSize);
    //draw iris
    fill(0);
    ellipse(mx, my, radius, radius);
  }
}
/**
 * Title:Guy Mouth<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description:mouth open or closed <br>
 **/

// ----------------------------------------------------------------------
// CLASS 
// ----------------------------------------------------------------------
class Mouth {

  //properties
  int mouthSize = 100;//size of the mouth
  int mouthWidth = mouthSize*2;
  int x;//position of the mouth x
  int y;//position of the mouth y



  /* methods */
  // constructor
  Mouth (int newX, int newY, int newSize) {
    x = newX;
    y = newY;
    mouthSize = newSize;
    //closeEye = newEyes;
  }

  void display() {
    //boolean to see whether his eyer are closed
    //used same technique as the eyes

    boolean closeMouth = false;
    if (mousePressed) {// while mouse is pressed, open mouth
      closeMouth =!closeMouth;
    }
    if (closeMouth==false) {
      strokeWeight(5);
      stroke(0);
      //draw closed mouth
      line(x+mouthSize/2, y, x, y);
      line(x, y, x, y+mouthWidth);
      line(x, y+mouthWidth, x+mouthSize/2, y+mouthWidth);
    }
    else {
      openMouth();// otherwise, draw open mouth
    }
  }


  void openMouth() {
    stroke(0);
    strokeWeight(5);
    fill(0);
    //black open mouth
    rect(x, y, mouthSize, mouthWidth);
    //draw white teeth
    fill(255);
    rect(x, y, mouthSize/2, mouthSize/2);
    rect(x, y+mouthSize, mouthSize/2, mouthSize/2);
    rect(x, y+mouthSize+mouthSize/2, mouthSize/2, mouthSize/2);
    rect(x, y+mouthSize*2, mouthSize/2, mouthSize/2);
  }
}
/**
 * Title:Text Layer<br>
 * Name: Eva Cvijanovic<br>
 * Date: Date: 12/11/18 <br>
 * Description:Text appears as the final layer once user drags mouse<br>
 **/

//TEXT LAYER

class TextLayer extends Layer {
  // to use font.. found the solution in the processing reference
  //http://www.processing.org/reference/PFont.html
  PFont font;

  TextLayer(PApplet parent) {
    super(parent);
  }

  void draw() {
    //the background clearing does not seem to be working, but I have no idea why
    background (0, 0);
    fill(0);
    smooth();
    font = loadFont("ClaireHand-Regular-48.vlw");
    textFont(font, 36);
    boolean drawNow = true;
    if (mousePressed) {// while mouse is pressed, ask question
      drawNow =!drawNow;
    }
    if (drawNow==false) {
      text("!!!what are you doing!!!", 100, 450);
    }
  }
}
