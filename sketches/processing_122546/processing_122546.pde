
// CONSTANTS
final int WIDTH=890;
final int HEIGHT=600;
final int NO_BUTTONS=5;
final int BUTTON_MARGIN=20;
final color BGCOLOUR = #333333;
final color NOT_HOVERED_TINT = #CCCCCC;
final int BUTTON_RAD=77;
final int BAR_WIDTH=35;
final int BAR_MAXHEIGHT=380;
final int BAR_MARGIN=20;
// how much darker should be the bar background, serving as range indicator - from 0 to 1
final float BAR_DIMMING=0.8;
// CALCULATED CONSTANTS
final int BUTTONS_WIDTH=(2*BUTTON_RAD+BUTTON_MARGIN)*NO_BUTTONS-BUTTON_MARGIN;
final int BUTTONS_STARTX=(WIDTH-BUTTONS_WIDTH)/2;
final int BUTTONS_STARTY=HEIGHT - BUTTON_RAD*2 - BUTTON_MARGIN - 40;
// Array assigning image files to buttons
final String [] BUTTONIMGS = {"Water.png","Plant.png","Ph.png","Light.png","Temp.png"};
// Array assigning colours to bars
final color [] BARCOLOURS = {#4f7b16, #124f68, #f79520, #0875bc, #ee3d36};
// Array assigning maximal values to bars
final int [] BARMAXVALS = {100, 450, 14, 1, 50};
// Array assigning sample values to bars
final int [] BARSAMPLE = {80, 345, 8, 1, 18};
// array of circular buttons
CButton [] buttons;
// array of bars
Bar [] bars;

void setup()
{
  // setup dimensions and background
  // (width and height have to be explicitly defined as hardcoded values for JS export to work automatically)
  size (890, 600);
  background(BGCOLOUR);
  // initialise arrays of buttons and bars
  buttons = new CButton [NO_BUTTONS];
  bars = new Bar [NO_BUTTONS];
  // populate the arrays with new buttons and bars
  for (int i=0; i< NO_BUTTONS; i++)
  {
    buttons[i]=new CButton(BUTTONIMGS[i], BUTTONS_STARTX+(BUTTON_RAD*2+BUTTON_MARGIN)*i, BUTTONS_STARTY, BUTTON_RAD);
    bars[i]=new Bar(BARCOLOURS[i], BARMAXVALS[i], BUTTONS_STARTX+(BUTTON_RAD*2+BUTTON_MARGIN)*i+(BUTTON_RAD*2-BAR_WIDTH)/2, BUTTONS_STARTY+BAR_MARGIN);
  }
  // load sample values into bars
  for (int i=0; i< NO_BUTTONS; i++)
  {
    bars[i].setVal(BARSAMPLE[i]);
  }
}

void draw()
{
  // refresh screen
  background(BGCOLOUR);
  // loop drawing buttons and bars
  for (int i=0; i < NO_BUTTONS; i++)
  {
    bars[i].display();
    buttons[i].display();
  }
}
/** Class to display a colorised bar showing
    the mapped value, together with the caption */
class Bar
{
  // current height
  int bHeight;
  // value
  int val;
  // maximal value
  int maxVal;
  // bottom-left coordinates
  int x, y;
  // colour of the value
  color bColour;
  // colour of the range
  color rangeColour;
  
  // constructor
  Bar(color inBColour, int inMaxVal,  int inX, int inY)
  {
    // store variables passed as instance variables
    bColour=inBColour;
    maxVal=inMaxVal;
    x=inX; y=inY;
    // set up the range colour as a dimmed value colour - between dark and 
    rangeColour=lerpColor(bColour, #000000, BAR_DIMMING);
  }
  
  // displays the bar
  void display()
  {
    // maps the value into gradient's pixels
    bHeight=round(map(val, 0, maxVal, BAR_MARGIN, BAR_MAXHEIGHT));
    // sets up drawing
    noStroke();
    // draws the rectangle displaying range
    fill(rangeColour);
    rect(x, y-BAR_MAXHEIGHT, BAR_WIDTH, BAR_MAXHEIGHT);
    // draws the rectangle displaying value
    fill(bColour);
    rect(x, y-bHeight, BAR_WIDTH, bHeight);
  }
  
  // sets the value the bar is supposed to display
  void setVal(int inVal)
  {
    val=inVal;
  }
}
/** Class to display an image-based circular button
    with some graphic effects and handle
    mouse-overlaps check */

class CButton
{
  // topleft corner coords
  private int x, y;
  // centre coords
  private int cx, cy;
  // button image
  private PImage img;
  // button radius
  private int r;
  // hovered boolean
  private boolean hovered=false;
  
  // constructor of a button
  CButton (String imgName, int inX, int inY, int inRadius)
  {
    // save input coordinates
    x=inX; y=inY;
    // save the radius
    r=inRadius;
    // calculate the coords of the centre
    cx=x+r; cy=y+r;
    // asynchronousely load the image from the path given
    img = requestImage(imgName);
  }
  
  // displays the button
  void display ()
  {
    // check if the image is already loaded
    if (img.width >= 0)
    {
      // check for hovering - if the distance from the centre is lower or equal the radius
      if ( pow(mouseX-cx, 2) + pow(mouseY-cy, 2) <= pow(r, 2) )
      {
        hovered=true;
        noTint();
      }
      else
      {
        hovered=false;
        tint(NOT_HOVERED_TINT);
      }
      // display the button
      image(img, x, y);
      
    }
  }
  
  // checks if the button is hovered
  boolean hover()
  {
    return hovered;
  }
}


