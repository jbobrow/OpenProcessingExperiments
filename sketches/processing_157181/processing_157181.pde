
// Assume that it is always using javascript

// 1. Sketch > Add File > add the pictures you need
// 2. Add preload for javascript, multiple files separated by commas
/* @pjs preload="happy.png, v_happy.png, normal.png, sad.png, v_sad.png"; */
// 3. load the image into PImages (in setup)

// Also include jquery-1.11.1.min.js for changing size of the window

// environment settings
int mode = CORNER; // default mode for Processing is CORNER, CENTER  CORNERS

// number of rolls per second
int _frameRate = 5;

// predefine the palette of colours
final int _BACKGROUNDHEX = #449966; // green
final int _TITLEHEX = #ffff00; // yellow
final int _BLACKHEX = #000000; // outlines and text
final int _PLAYBUTTONHEX = #236B8E; // steel blue
final int _DIEHEX = #FFF3D6; // cream
final int _GRAPHBARHEX = #008080; // dark green

// draw only a single frame to start with
boolean running = false;
boolean redraw = true;

// Things that get drawn on the screen
TextObject title;
Graph graph;
Die die;
PlayButton playButton;
UnderlinedTextObject play100Button;
UnderlinedTextObject play1000Button;
Smiley smiley;
Average average;
AverageSmiley averageSmiley;

// how many rolls in the set
int rollMax = 100;

float _scaleFactor = 1.0;

// setup() is called once at the start
void setup()
{
  // Note: Processing requires numbers, not variables, in size(...)
  size(480, 600);
  
  
  // set the frame rate
  frameRate(_frameRate);

  // create all the screen objects and set where they appear on the screen
  title = new TextObject("Get Lucky", _scaleFactor * 50, _TITLEHEX, _scaleFactor * 120, _scaleFactor * 75);
  graph = new Graph(_scaleFactor * 165, _scaleFactor * 25, _scaleFactor * 150, _scaleFactor * 300);  
  die = new Die(_scaleFactor * 165, _scaleFactor * 325, _scaleFactor * 150, _scaleFactor * 150);
  smiley = new Smiley(_scaleFactor * 150, _scaleFactor * 350, _scaleFactor * 50, _scaleFactor * 50);
  playButton = new PlayButton(_scaleFactor * 75, _scaleFactor * 500, _scaleFactor * 75, _scaleFactor * 75);
  play100Button = new UnderlinedTextObject("100 Rolls", _scaleFactor * 24, _BLACKHEX, _scaleFactor * 170, _scaleFactor * 545);
  play1000Button = new UnderlinedTextObject("1000 Rolls", _scaleFactor * 24, _BLACKHEX, _scaleFactor * 300, _scaleFactor * 545);
  average = new Average(_scaleFactor * 32, _BLACKHEX, _scaleFactor * 360, _scaleFactor * 250);
  averageSmiley = new AverageSmiley(_scaleFactor * 375, _scaleFactor * 35, _scaleFactor * 50, _scaleFactor * 50);
  
  // apply the environment settings
  frameRate(_frameRate);

  // do not auto-advance to a new frame
  running = false;
  
  // create an offscreen graphics buffer 
  // size of the buffer, large enough to prevent scaling issues but small enough to reduce memory demands
  warmUpBuffer();
}

/*
// modifies the html document to present the app on different sizes of screens
// returns: _scaleFactor, the scale factor used for all drawing in the app
float sizeToWindow()
{
    // remove some weird element from bug in old processingjs version
    $("span").css("display", "none");
    
    // jquery content specification
    var contentElement = $("#content");
    
    // constant values desired for the app
    int unscaledCanvasWidth = 480;
    int unscaledCanvasHeight = 600;
    int unscaledPadding = 24;
    int unscaledMargin = 48;
    int border = 1;

    // calculate the width and height on the device regardless of different devices and browsers
    var _width = window.innerWidth ||
                document.documentElement.clientWidth ||
                document.body.clientWidth;
    var _height = window.innerHeight ||
                 document.documentElement.clientHeight ||
                 document.body.clientHeight;
    
    // determine the height of the info text at the bottom of the page
    float textHeight = contentElement.height() - unscaledPadding * 2;
    float textWidth = contentElement.width();
    
    // calculate the scale factor based on width or height
    float widthScaleFactor = unscaledCanvasWidth + unscaledPadding * 2;
    float heightScaleFactor = textHeight + unscaledMargin * 2 + unscaledCanvasHeight + unscaledPadding * 2;
    
    // determine whether width or height is more important in determining the size of the page
    if(_width / _height < widthScaleFactor / heightScaleFactor)
    {
       _scaleFactor = _width / widthScaleFactor;  // add in the margins and padding
    }
    else
    {
       _scaleFactor = _height / heightScaleFactor;  // add in the margins and padding
     }
    
    // TODO: account for the text in single column on narrow page
    // set the size of the app    
    size((int)(_scaleFactor * unscaledCanvasWidth), (int)(_scaleFactor * unscaledCanvasHeight));
    
    // show the canvas
    $("#canvasHider").css("margin", "auto");
    $("#canvasHider").css("display", "");
    
    // calculate the width
    float contentWidth = _scaleFactor * unscaledCanvasWidth;
    
    // set the content width, margin and padding
    contentElement.css("width", (int)(contentWidth) + "px");
    contentElement.css("margin", "auto");
    contentElement.css("padding", (int)(_scaleFactor * unscaledPadding) + "px");  
    
    // return the scale factor for future drawing
    return _scaleFactor;
}
*/

// runs in a cycle, up to frameRate
void draw() {
  
  // CONTROL //
  // prevent spurious drawing
  if (!running && !redraw) return;
  
  // nonrunning mode is set to draw only once, so if redraw was true, set it to false. if it was false, leave it false.
  redraw = false;
  
  // increment the number of throws
  graph._count++;
  
  // stop looping if we got to 100 rolls
  if (graph._count > rollMax)
  {
    running = false;
  }
  
  // DRAWING //
  // overwrite previous frame with a new background  
  background(_BACKGROUNDHEX);
  
  /// TITLE ///
  title._draw();
  
  ///DICE///
  // roll the die
  die.roll();

  // draw the die
  die._draw();
  
  /// STATISTICS ///
  graph._draw();
  average._draw();
  averageSmiley._draw();

  /// BUTTONS ///
  playButton._draw();
  play100Button._draw();
  play1000Button._draw();

}




/// DRAWING ///

// I noticed that Processingjs would lag when the method textSize is first used
// let's prevent a 2 second lag at the first frame of drawing
void warmUpBuffer()
{
  PGraphics buffer = createGraphics(150, 150);
  buffer.beginDraw();
  buffer.textSize(buffer.height/10);
  buffer.endDraw();
}

// an object with a draw method
class DrawingObject
{
   int _x, _y, _width, _height; 
   PImage _image;
   
   // constructor
   DrawingObject(int x, int y, int width, int height)
   {
     this._x = x;
     this._y = y;
     this._width = width;
     this._height = height; 
   }
   
   // To determine if the mouse is within this objects area
   boolean hitTest(int _mouseX, int _mouseY)
   { 
     // return true or false
     return _mouseX > this._x && _mouseY > this._y && _mouseX < this._x + this._width && _mouseY < this._y + this._height;
   }
   
   // drawing method
   void _draw()
   {
      image(this._image, this._x, this._y, this._width, this._height);
   }
}

// A triangular button to roll die
class PlayButton extends DrawingObject
{
  // Constructor
  PlayButton(int _x, int _y, int _width, int _height)
  {
    super(_x, _y, _width, _height);
    
    // An offscreen drawing object
    PGraphics buffer = createGraphics(this._width, this._height);
      
    // start drawing
    buffer.beginDraw();
    
    // set the color of the outline
    buffer.stroke(_BLACKHEX);
    
    // set the thickness of the outline
    buffer.strokeWeight(1);
  
    // play triangle
    buffer.fill(_PLAYBUTTONHEX); // steelblue
    buffer.triangle((int)(buffer.width/4), (int)(buffer.height/4), (int)(buffer.width/4), (int)(3*buffer.height/4), (int)(3*buffer.width/4), (int)(buffer.height/2));
    
    // end drawing
    buffer.endDraw();
  
    // set the image to the offscreen drawing
    this._image = buffer.get(0, 0, buffer.width, buffer.height);
  }
}

class Die extends DrawingObject
{
  // stores each of the images for the six sides
  PImage[] _faces = new PImage[6];
  
  // current side
  int _side = 0;
  
  // constructor
  Die(int x, int y, int width, int height)
  {
    super(x, y, width, height);
         
    // assign sections of the png to different die faces
    for(int i = 0; i < 6; i++)
    {
      _faces[i] = getDiceImage(i); 
    }
    
    // start at rolled 1
    _image = this._faces[0];
  }
  
  void roll()
  {
    // integer between 0 and 6 not including 6
    _side = int(random(0, 6));

    // add one to the statistics
    graph._graph[_side] ++;
    
    // update the current image
    _image = _faces[_side];
  }
  
  // draws the given die face
  PImage getDiceImage(int face)
  { 
    // draw into an off screen buffer
    PGraphics buffer = createGraphics(1000, 1000); 
    
    // start drawing
    buffer.beginDraw();
    
    // dice are cream colour
    buffer.fill(_DIEHEX);
    
    // TODO: black outline that scales nice with different screen sizes
    //buffer.stroke(_BLACKHEX); 
    //buffer.strokeWeight(5 * _scaleFactor);
        
    // x, y, w, h, radii of corners
    buffer.rect(0, 0, buffer.width - 1, buffer.height - 1, buffer.width/5);

    /// PIPS /// 
    // pips are black
    buffer.fill(0);
    
    // Set ellipseMode to CENTER because it's easier to align them
    buffer.ellipseMode(CENTER);  
    
    switch(face)
    {
      case 0:
        // one
        buffer.ellipse(500, 500, 200, 200);
        break;
  
      case 1:
        // two
        buffer.ellipse(200, 200, 200, 200);
        buffer.ellipse(800, 800, 200, 200);
        break;
        
      case 2:
        // three
        buffer.ellipse(200, 200, 200, 200);
        buffer.ellipse(500, 500, 200, 200);
        buffer.ellipse(800, 800, 200, 200);
        break;
        
      case 3:
        // four
        buffer.ellipse(200, 200, 200, 200);
        buffer.ellipse(800, 800, 200, 200);
        buffer.ellipse(200, 800, 200, 200);
        buffer.ellipse(800, 200, 200, 200);
        break;
        
      case 4:
        // five
        buffer.ellipse(500, 500, 200, 200);
        buffer.ellipse(200, 200, 200, 200);
        buffer.ellipse(800, 800, 200, 200);
        buffer.ellipse(200, 800, 200, 200);
        buffer.ellipse(800, 200, 200, 200);
        break;

      case 5:
        // six
        buffer.ellipse(200, 200, 200, 200);
        buffer.ellipse(800, 800, 200, 200);
        buffer.ellipse(200, 500, 200, 200);
        buffer.ellipse(800, 500, 200, 200);
        buffer.ellipse(200, 800, 200, 200);
        buffer.ellipse(800, 200, 200, 200);
        break;
    }
    
    // completed drawing
    buffer.endDraw();
    
    // return entire image that was just drawn
    return buffer.get(0, 0, buffer.width, buffer.height); 
  }    
}

// Show a smiley face
class Smiley extends DrawingObject
{ 
  // storage for six different faces
  PImage[] _smilies = new PImage[6];
  
  // constructor
  Smiley(int x, int y, int width, int height)
  {
    // call the super constructor
     super(x, y, width, height); 

     // load images from files
     // TODO: Only load faces once in the entire program instead of once for each new smiley object without exposing _smilies
     this._smilies[5] = loadImage("v_happy.png");
     this._smilies[4] = loadImage("happy.png");
     this._smilies[3] = loadImage("normal.png");
     this._smilies[2] = loadImage("normal.png");
     this._smilies[1] = loadImage("sad.png");
     this._smilies[0] = loadImage("v_sad.png");     
  }
}

// Show a smiley corresponding to the average
class AverageSmiley extends Smiley
{     
  // Constructor
  AverageSmiley(int x, int y, int width, int height)
  {
     super(x, y, width, height); 
  }
  
  // Draw method
  void _draw()
  {
    // get the average, round it and make it an integer so it can be used as an array index
    int roundedAverage = (int)Math.round(graph.getAverage());
    
    // set the average smiley face (indexed from 0 to 5)
    this._image = this._smilies[roundedAverage - 1];
    
    // call the draw function for the super class
    super._draw();
  }
}

// Depicts statistics on a graph 
class Graph extends DrawingObject
{
  // how many times the die or dice rolled
  int _count = 0;

  // graph settings to store dice rolls
  int[] _graph = new int[6];
  
  // Classes in Processingjs must have explicit declaration of the constructor
  Graph(int x, int y, int width, int height)
  {
     super(x, y, width, height);
  }
  
  // draw the graph
  void _draw()
  {
    // create an offscreen drawing object
    PGraphics buffer = createGraphics(300 * _scaleFactor, 600 * _scaleFactor);
    
    // start drawing
    buffer.beginDraw();  
  
    // outline colour
    buffer.stroke(_BLACKHEX);
    
    // thickness of the outline
    buffer.strokeWeight(2);
    
    // set the size of the text for the x-axis
    buffer.textSize((int)(50  * _scaleFactor));
    
    // easier to align text under the bars via the center
    buffer.textAlign(CENTER);
    
    // determine how high a single roll will increase the graph
    int pixelsHeightPerRoll = 1000/rollMax * _scaleFactor; // in processingjs, always explicitly cast division to int if you want int
    
    // width of each bar
    int rectWidth = (int)(buffer.width/6 - 1);
    
    // maximum height of each bar
    int barHeightMax = buffer.height*8/10;
    
    // iterate through each bar in the graph
    for(int i = 0; i < 6; i++)
    {
      // bars are green colour
      buffer.fill(_GRAPHBARHEX); // #teal (16 SVG)   from http://www.december.com/html/spec/colorhex.html
  
      // determine the height of the bar
      int rectHeight = graph._graph[i]*pixelsHeightPerRoll;
      
      // draw the rectangle in the buffer
      buffer.rect((int)(i*rectWidth), (int)(barHeightMax - rectHeight), (int)(rectWidth), (int)(rectHeight));
      
      // text is black
      buffer.fill(_BLACKHEX);
      
      // format the integer as a string
      String barNumber_str = nf((int)(i + 1), 0);
      
      // write the text
      buffer.text(barNumber_str, (int)(buffer.width/12 + i*buffer.width/6), (int)( buffer.height*9/10));
      
      // if the number is a winner, but not at the end of 100 throws
      if (i == die._side && graph._count < rollMax)
      {
        // draw smiley
        // width and height of the smiley is to be the same as the width of the bar
        buffer.image(smiley._smilies[i],(int)(die._side*rectWidth),(int)(barHeightMax - rectHeight - rectWidth), rectWidth, rectWidth);
      }
    }
    
    // Notify Processing that all drawing methods are completed
    buffer.endDraw();
    
    // draw the new image on the screen
    image(buffer.get(0, 0, buffer.width, buffer.height), this._x, this._y, this._width, this._height);
  }
  
  // returns the current average in _graph
  float getAverage()
  {
    // array length
    int len = this._graph.length;
    
    // calculate sum of array
    float sum = 0.0;
    
    // iterate through each bar on the graph
    for(int i = 0; i < len; i++)
    {
      // the value of each cell is i + 1, and the number of rolls is stored in the cell 
      sum += (i + 1) * this._graph[i];
    }
    
    // return average
    return sum / this._count;
  } 
  
  // resets the graph to all zeros
  void resetGraph()
  {
    // stop counting
    this._count = 0;
    
    // iterate through each value in the graph
    for(int i = 0; i < this._graph.length; i++)
    {
      // set each cell to zero
      this._graph[i] = 0;
    }
  }
}

// Text area showing the average of the graph
class Average extends TextObject
{
  // Constructor
  Average(int _size, int _color, int _x, int _y)
  {
    super("", _size, _color, _x, _y);
  }
  
  // Draw method
  void _draw()
  {
    // format the text to have 1 digit before the decimal, one after
    this._text = nf(graph.getAverage(), 1, 3);

    // call the draw method
    super._draw(); 
  }
}

// Shows text on screen
class TextObject extends DrawingObject
{
  // The message that is written
  String _text;
  
  // The font size
  int _size;
  
  // The colour of the text
  int _color;
  
  // Constructor
  TextObject(String _text, int _size, int _color, int _x, int _y)
  {
    super(_x, _y, 0, 0);
    
    // text-specific attributes
    this._text = _text;
    this._size = _size;
    this._color = _color;
  }
  
  // Drawing method
  void _draw()
  {
    // set the colour of the text
    fill(this._color);
    
    // set the height of the text
    textSize(this._size);

    // only need to determine the width once if it is not set
    if(this._width == 0)
    {
      // to determine width and height of the text
      this._width = (int)textWidth(this._text);
      this._height = this._size;
    }    
    
    // write the text
    text(this._text, this._x, this._y);
    
  } 
  
  // In Processing, text is aligned so that y is the baseline
  boolean hitTest(int _mouseX, int _mouseY)
  {    
    // compare the rectangle and the current mouse location 
    return _mouseX > this._x && _mouseY < this._y && _mouseX < this._x + this._width && _mouseY > this._y - this._height;
  }   
}

// text object that also has an underline
// Processingjs has no underline built in
class UnderlinedTextObject extends TextObject
{
  // Constructor
  UnderlinedTextObject(String _text, int _size, int _color, int _x, int _y)
  {
    super(_text, _size, _color, _x, _y);
  }
  
  // Draw method
  void _draw()
  {
    // draw the text
    super._draw();
    
    /// UNDERLINE ///
    // left of the text
    int x0 = this._x;
    
    // right of the text
    int x1 = this._x + this._width;
    
    // location of the underline
    int y = this._y + 2;
    
    // thickness of the line
    stroke(5); 
    
    // draw the line on the screen
    line(x0, y, x1, y);
  }
}

/// MOUSE ///

void mouseMoved()
{
  if (!running && (playButton.hitTest(mouseX, mouseY) || play100Button.hitTest(mouseX, mouseY) || play1000Button.hitTest(mouseX, mouseY)))
  {
    cursor(HAND);
  }
  else
  {
    cursor(ARROW);
  } 
}

// set what happens when the mouse is clicked
void mouseClicked() {
  // if already running, then the mouse doesn't do anything
  if (running) return; 
  
  // if the die is not already rolling in a sequence and the mouse is inside the button
  if(!running && playButton.hitTest(mouseX, mouseY))
  {
    // check if the graph is already full to the rollMax
    if(graph._count > rollMax)
    {
      // reset the graph
      graph.resetGraph();
    }
    
    // roll one time only 
    redraw = true;
  }
  else if (!running && play100Button.hitTest(mouseX, mouseY))
  {
    // set frameRate to normal
    frameRate(_frameRate);
    
    // set the total number of rolls
    rollMax = 100;
    
    // reset the graph
    graph.resetGraph();
    
    // start running
    running = true;
  }
  else if (!running && play1000Button.hitTest(mouseX, mouseY))
  {
    // set frameRate to faster so we can observe
    frameRate(_frameRate*15);
    
    // set the total number of rolls
    rollMax = 1000;
    
    // reset the graph
    graph.resetGraph();
    
    // start running
    running = true;
  }
}


