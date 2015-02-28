
/*

 Bezier Stalk Grid
 dave@mezzoblue.com
 July 2009
 
*/


// set up some environment variables
int canvasWidth = 800;
int canvasHeight = 500;

PGraphics buffer;
PImage paletteSource;
color[] palette;
int paletteCount = 8;

// set up some operating variables
float drawingScale = 6;
float multiplier = 500;

float seedX = 0;
float seedY = 1;
float seedZ = 2;

float offsetY = 0;


Strand[] points;
int numPoints = 3600;



void setup() {
  smooth();
  frameRate(30);
  size(canvasWidth, canvasHeight, P3D);


  // Create an off-screen buffer.
  buffer = createGraphics(800, 500, JAVA2D);
  loadPalette(paletteCount);

  background(palette[0]);

  points = new Strand[numPoints];
  setCoordinates();

};





void draw() {
  // fill the background 
  background(palette[0]);


  // move the sketch to the center of the canvas, compensate for the multiplier offset
  translate(canvasWidth / 2, canvasHeight / 2  + offsetY, 0 / multiplier);

  // rotate the canvas based on mouse x, y position
  rotateX((float) mouseY / 150);
  rotateZ((float) mouseX / 150);

  // adjust the scale based on keyboard input (a, z)
  scale(drawingScale);

  // animate each Strand
  for (int i = 0; i < numPoints; i++) {
    points[i].jiggle(i);
    points[i].render(i);
  };
  
};





// populate random coordinates
void setCoordinates() {

  // set the x, y coordinates to the square of the number of points
  for (int i = 0; i < sqrt(numPoints); i++) {
    for (int j = 0; j < sqrt(numPoints); j++) {

      // create a single temp Strand object
      Strand obj = new Strand();
  
      // set the temp object's x,y,z coordinates
      obj.X = (0 - sqrt(numPoints) / 2) + i * multiplier / 500;
      obj.Y = (0 - sqrt(numPoints) / 2) + j * multiplier / 500;
      obj.Z = 0;

      obj.endX = random(0, multiplier / (multiplier / 5));
      obj.endY = random(0, multiplier / (multiplier / 5));
      obj.endZ = random(0, multiplier / (multiplier / 5));
      
      obj.seedX = i;
      obj.seedY = j;
      obj.seedZ = i + j;
  
  
      int paletteValue = int(random(1, paletteCount));
  
      obj.R = red(palette[paletteValue]);
      obj.G = green(palette[paletteValue]);
      obj.B = blue(palette[paletteValue]);
      obj.Alpha = int(random(0, 128));
  
      // add the temp object to the list array
      points[int(i * sqrt(numPoints) + j)] = obj;
    
    };
  };
};

