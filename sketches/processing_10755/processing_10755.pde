
/**
 * Image button example 02.
 *
 * Extension and improvement of the "ImageButton" example program
 * that comes with Processing.
 * 
 * Loading images and using them to create a button with rollover
 * and pressed states. Also doing something when the button is activated.
 *
 * 2010-07-01 Thu - subpixel - http://subpixels.com
 * - Merge Button.overRect(), pressed(), ImageButton.update()
 *   and over() into Button.update()
 * - Corrected hit detection errors (change "<=" to "<" x2)
 * - Modify behaviour to only register "pressed" if mouse over
 *   button when mouse clicked (uses new program variable
 *   "mousePressedNow", set in mousePressed() event handler and
 *   reset at the end of the main draw() method)
 * - Include code to indicate when button activated (must have
 *   been pressed and have mouse released whilst over button)
 * - Replace verbose if() statements with ternary operators
 *   (variable for intended assignment only appears once instead
 *    of once per condition branch)
 * - In setup(): set w,h before x,y and use in calc for x,y
 * - Rename b,r,d to ib,ir,id to make parameter list to
 *   ImageButton() less mysterious.
 * - Rename Button.highlightcolor to rollcolor; add downcolor
 * - Implement Button(x,y,w,h) constructor, update() and draw()
 * - Call super() constructor in ImageButton constructor
 * - Rename class ImageButtons to ImageButton; rename example from
 *   ImageButton.pde to ImageButtonExample.pde to avoid conflict
 *   with class ImageButton
 *
 * 2010-07-01 Thu - v02 subpixel - http://subpixels.com
 * - Devised a way to do something useful when a button is clicked: pass an
 *   object implementing the IActivate interface to the button's constructor,
 *   as well as a parameter object (can be null) to allow a sinngle method to
 *   handle multiple buttons.
 * - Code split into separate .java files (I was having problems getting the
 *   code to compile, I think due to my use of the IActivate interface).
 */

public class ImageButtonExample02
  extends PApplet
  implements IActivate {

  // Gratuitous self-promotion. :o)
  Linker linker;
  final String subpixelsWebsite = "http://subpixels.com/";
  final String processingStuff = "http://subpixels.com/blog/category/computing/programming/processing";
  
  // Was the mouse pressed just now (not held from previoud frame)?
  boolean mousePressedNow = false;
  
  Button button1, button2, button3;
  ImageButton imageButton;
  
  int backgroundColor = 0xFF666666;
  
  void setup() {
    size(200, 200);
    
    Button.init(this);
    Linker.init(this);
    
    linker = new Linker(subpixelsWebsite);
  
    // Ordinary non-image button for visual comparison and
    // to exercise base button code
    button1 = new Button(10, 10, 20, 20, linker, null);
    button2 = new Button(40, 10, 20, 20, linker, processingStuff);
    
    // Define and create image button
    PImage ib = loadImage("base.gif");
    PImage ir = loadImage("roll.gif");
    PImage id = loadImage("down.gif");
    int w = ib.width;
    int h = ib.height;
    int x = (width  - w) / 2; // Half the horizontal space
    int y = (height - h) / 2; // Half the vertical space
    imageButton = new ImageButton(x, y, w, h, this, null,
                                  ib, ir, id);

    // Button to reset the background color
    button3 = new Button(width - 30, height - 30, 20, 20, this, backgroundColor);
  }
  
  void draw() {
    button1.update(mousePressedNow);
    button2.update(mousePressedNow);
    button3.update(mousePressedNow);
    imageButton.update(mousePressedNow);
  
    background(backgroundColor);
    button1.display();
    button2.display();
    button3.display();
    imageButton.display();
    
    mousePressedNow = false;
  }
  
  void mousePressed() {
    mousePressedNow = true;
  }
  
  // Callback method for imageButton activation
  public void activate(Object parameter) {
    println("Main program: activate(" + parameter + ")");
    if (parameter instanceof Integer)
      backgroundColor = (Integer)parameter;
    else
      // Random background color
      backgroundColor = 0xFF000000 | (int)random(0x1000000);
  }
}


