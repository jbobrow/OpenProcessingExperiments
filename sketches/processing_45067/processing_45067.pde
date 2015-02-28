
/*
 --=[Swelling Lines Engraving]=--
 by Jonsku, November 2011
 http://j-u-t-t-u.net/
 --
 Source code licensed under Creative Commons Attribution-Share Alike 3.0.
 http://creativecommons.org/licenses/by-sa/3.0/
 --
 Inspired by a commercial for Faber Castell, this sketch
 creates an 'engraved' version of a source image using the 
 swelling line technique developed by Claude Mellan in the 17th
 century.
 This technique is based on varying the thickness of the lines to create tones.
 Press 'c' to switch between parallel lines engraving and spiral engraving.
 */
float centerX;
float centerY;

float x;
float y;

float sX;
float sY;

float lX;
float lY;

float d = 1; //distance to center

//distance increments; 
float linesInc = 5; //determines the distance between lines
float spiralsInc = 3; //determines the distance between loops


float a = 0; //angle

float offset = 0; //used to move on a sin wave

//source images for engraving
PImage spiralSketch;
PImage linesSketch;

boolean spiral; //if true, do spiral engraving

PGraphics lineEngraving;
PGraphics spiralEngraving;

void setup() {
  spiralSketch = loadImage("pear_butt.jpg");
  spiralSketch.loadPixels();
  linesSketch = loadImage("peeled_banana.jpg");    
  linesSketch.loadPixels();
  //select which image to 'engrave' first
  if(random(1)>0.5) {
    spiral = true;
  }
  else {
    spiral = false;
  }

  size(500, 600);
  smooth();
  lineEngraving = createGraphics(width, height, JAVA2D);

  spiralEngraving = createGraphics(width, height, JAVA2D);


  centerX = width/2.0;
  centerY = height/2.0;
  sX = 0;
  sY = 0;

  lX = 0;
  lY = linesInc;
}

void draw() {
  background(255);
  PGraphics gfx = g;
  //switch to the proper drawing context
  if(spiral) {
    x = sX;
    y = sY;    
    g = spiralEngraving;
    g.beginDraw();
    drawSpiral();
    g.endDraw();
    sX = x;
    sY = y;
  }
  else {
    x = lX;
    y = lY;        
    g = lineEngraving;
    g.beginDraw();
    drawLines();
    g.endDraw();
    lX = x;
    lY = y;
  }
  gfx.image(g,0,0);
  g = gfx;
}

/*
Line engraving
 */
void drawLines() {
  //End of page reached
  if(round(y) >= height) {
    return;
  }
  smooth();
  //I use the blue component of the original image pixel to determine the thickness of the line at that location
  strokeWeight(1.25+(255-(linesSketch.pixels[round(x)+round(y)*width] & 0xFF))/255.0*(linesInc-1));

  //plot the point with a small offset from the perfect vertical line to give it a more hand drawn feel
  point(x,y+( sin(offset)*(noise(x,y)*1.0) ));


  offset += random(0.6);
  x += 1;

  //end of line reached
  if(x == width) {
    y += linesInc;
    x = 0;
  }
}

/*
Spiral engraving.
 Inspired by the art works a Faber Castell commercial (http://vimeo.com/27405001)
 which is itself using the engraving technique of Claude Mellan (17th century)
 http://www.vam.ac.uk/images/image/57685-popup.html
 */
void drawSpiral() {
  //Avoid ArrayIndexOutOfBoundsException
  if(round(y)<0 || round(x)<0 || round(x)+round(y)*width >= width*height) {
    return;
  }
  smooth();  
  //I use the blue component of the original image pixel to determine the thickness of the line at that location
  strokeWeight(0.7+(255-(spiralSketch.pixels[round(x)+round(y)*width] & 0xFF))/255.0*(spiralsInc-1));

  //draw with the right thickness
  point(x,y);

  //move around the spiral
  a += TWO_PI/(TWO_PI*d);

  /*
  I add a small amount of noise and I offset the perfect spiral based on a sin function
   to give the result a more natural, hand drawn feel.
   */
  d += ( spiralsInc/(TWO_PI*d) ) + ( sin(offset)*(noise(x,y)*0.125) );
  offset += random(0.6);

  x = centerX+d*cos(a);
  y = centerY+d*sin(a);
}

void keyPressed() {
  /* 
   if(key == ' '){
   save("render.png");
   }
   */
  if(key == 'c') {
    spiral = !spiral;
  }
}


