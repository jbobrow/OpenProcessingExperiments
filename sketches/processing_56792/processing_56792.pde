
int smallPoint = 2;
int largePoint;
int top, left;

float R, G, B;                           //  ----- I create 3 variables. primitive data type : float.
float cOff = 0.0;
float wOff = 0.0;                        //  ----- Two more float than I create and I initialize.
int w = 25;                              //  ----- another primitive value for the rectangle size. An integer type.

color pix = color (0, 0, 0);

void setup() {

  size(800, 800);                        //  ----- change the size of your screen
  smooth();                              //  ----- anti aliazing for the graphics
  ellipseMode(CENTER);                      //  ----- x and y, are now in the center of each rectangle
  noStroke();                            //  ----- no outline for the shapes
  background(255);                       //  ----- I paint my background in ... white

  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - width) / 2;
  top = (height - height) / 2;

  R = 0;                                 //  ----- Initialization of my R variable
  G = 0;                                 //  ----- Initialization of my G variable
  B = 0;                                 //  ----- Initialization of my B variable





  for (int i = w/2; i < width; i = i + 30) {
    for (int j = w/2; j < height; j = j + 30) {
      //  ----- Double loop to draw a lot of shapes with a few lines of code.

      cOff += 0.1;                       //  ----- this value increases by 0.1 for each sequence into the loop
      wOff += 0.02;                      //  ----- this one increases by 0.02 for each sequence into the loop

      float n = noise(cOff) * 255;       //  ----- calculation of the noise parameter for each sequence into the loop. I multiply by 255 because noise gives number between 0 and 1, and I need to map this value from 0 to 255, for the colors. 
      float n_w = noise(wOff) * w;
      R = 0;
      G = n;
      B = n;
      fill(R, G, B);                     //  ----- my color is changing for each sequence into the loop, so for each rectangle  
      //rotate(TWO_PI * j);
      ellipse(j, i, w, w);               //  ----- I draw a rectangle for each sequence into the loop.
    }
  }
  
 
}


void draw() { 
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(width));
  int y = int(random(height));
  color pix = get(x, y);
  fill(pix, 128);
  ellipse(left + x, top + y, pointillize, pointillize);
}


