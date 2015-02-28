
/**
 * Image button example.
 *
 * Extension and improvement of the "ImageButton" example program
 * that comes with Processing.
 * 
 * Loading images and using them to create a button with rollover
 * and pressed states.
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
 */

// Gratuitous self-promotion. :o)
final String subpixelsWebsite = "http://subpixels.com";

// Was the mouse pressed just now (not held from previoud frame)?
boolean mousePressedNow = false;

Button button;
ImageButton imageButton;

void setup() {
  size(200, 200);
  background(102, 102, 102);

  // Ordinary non-image button for visual comparison and
  // to exercise base button code
  button = new Button(10, 10, 20, 20);
  
  // Define and create image button
  PImage ib = loadImage("base.gif");
  PImage ir = loadImage("roll.gif");
  PImage id = loadImage("down.gif");
  int w = ib.width;
  int h = ib.height;
  int x = (width  - w) / 2; // Half the horizontal space
  int y = (height - h) / 2; // Half the vertical space
  imageButton = new ImageButton(x, y, w, h, ib, ir, id);
}

void draw() {
  button.update();
  imageButton.update();

  button.display();
  imageButton.display();
  
  mousePressedNow = false;
}

void mousePressed() {
  mousePressedNow = true;
}

// ==========================================================

public class Button {
  int x, y; // Top-left corner
  int w, h; // Width, height
  color basecolor = #00007F;
  color rollcolor = #7F00FF;
  color downcolor = #FFFF00;
  color currentcolor;
  boolean over = false; // Mouse over button
  boolean pressed = false; // Mouse pressed over button
  
  public Button(int ix, int iy, int iw, int ih) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
    currentcolor = basecolor;
  }
  
  void update() {
    // Is the mouse over the button now?
    over = mouseX >= x && mouseX < x + w && 
           mouseY >= y && mouseY < y + h;

    // Check for button activation (mouse released over button
    // when button in the pressed state)
    if (pressed && over && !mousePressed)
    {
      println("Button activated!");
      link(subpixelsWebsite);
    }

    // If we registered a press before and the mouse is
    // pressed now, maintain pressed;
    // if mouse is over now and mouse was pressed just now,
    // register the press
    pressed = (pressed && mousePressed) ||
              (over && mousePressedNow);

    // If the mouse is over the button and pressed, show the
    // button as down; if over but not presed, show the rollover;
    // otherwise show as normal
    currentcolor = over ? (pressed ? downcolor : rollcolor)
                        : basecolor;
  }
  
  void display() {
    pushStyle();
    fill(currentcolor);
    noStroke();
    rect(x, y, w, h);
    popStyle();
  }
}

// ==========================================================

public class ImageButton extends Button {
  PImage base;
  PImage roll;
  PImage down;
  PImage currentimage; // Reference to one of base, roll, down

  public ImageButton(int ix, int iy, int iw, int ih, PImage ibase, PImage iroll, PImage idown) {
    super(ix, iy, iw, ih);
    base = ibase;
    roll = iroll;
    down = idown;
    currentimage = base;
  }
  
  void update() {
    // Sort out the button state and check for activation
    super.update();

    // If the mouse is over the button and the button is registered
    // as pressed, show the button as down; if over but not pressed,
    // show the rollover; otherwise show as normal
    currentimage = over ? (pressed ? down : roll)
                        : base;
  }
  
  void display() {
    image(currentimage, x, y);
  }
}


