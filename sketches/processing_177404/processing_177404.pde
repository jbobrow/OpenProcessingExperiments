
/**
 * Processing Version : 2.2.1
 * Title : Tim
 *  
 * by Wai Lau  
 * 
 * Photo Animation in 3D.  
 *   Display an image and 3D space and swing it back and forth.
 *   Do not display the background color of the image 
 *   Display non-background pixels with heights taken from sound volume
 *   Gradually change the background color
 *   Play sound in a loop
 *   Increase resolution of the image and frame rate as mouse moves from left to right.
 *   Increase angle of oscillation as mouse moves from left to right
 */
 
import processing.opengl.*;  // Faster on graphics card which supports OGL
import ddf.minim.*;

/* Globals */
PImage img;
pixRod[] rods;          // a rod is just a long box to represent a pixel.
int nPix;               // total number of pixels in the image
int xOrig, yOrig;       // top left corner of image on screen.

float rotXMin = -PI/8.0;//min and max rotation angle of the image
float rotXMax =  PI/8.0;
float rotXCen;
float rotX    = rotXMin;
float angInc  = 0.02;   //swing angle increment

color bg = color(random(255), random(255), random(255));
float rInc = 1.0;
float gInc = 1.0;
float bInc = 1.0;

Minim minim;
AudioPlayer player;
int sInd = 0;           //index into the sound buffer


void setup() {
  noSmooth();  //try to save some cpu for 3D rendering.
  
  // Load an image
  newImg();
  
  // Load a sound file
  newSound();
  
  //Turn on the lights 
  lights();

}

void draw() {
  float r,g,b;
 
  /*change the background color by gradually incrementing the color space */
  if (red(bg) >= 255.0 || red(bg) <= 0.0) {
    rInc *= -1;
  }
  r = red(bg) + rInc;
  
  if (green(bg) >= 255.0 || green(bg) <= 0.0) {
    gInc *= -1;
  }
  g = green(bg) + gInc;
  
  if (blue(bg) >= 255.0 || blue(bg) <= 0.0) {
    bInc *= -1;
  }
  b = blue(bg) + bInc;
 
  bg = color(r,g,b); 
  background(bg); 

  
  /*Set the index into the sound buffer*/
  if ( sInd < player.bufferSize() - 1)
  { sInd++;
  } else {
    //rewind the sound file
    sInd = 0;
  }

  translate(xOrig, yOrig);
  
  //change the swing angle of the image
  rotX += angInc;
  if (rotX > rotXMax) {
     rotX = rotXMax;    
     angInc *= -1;   //reverse swing direction
  } else if ( rotX < rotXMin) {
     rotX = rotXMin;
     angInc *= -1;
  }
  rotateX(rotX);
  rotXCen = map(mouseX, 0, width, -PI/8.0, PI * 9.0/8.0);
  rotXMin = rotXCen - PI/8.0;
  rotXMax = rotXCen + PI/8.0;

  int inc = int( map(mouseX, 0, width, 16, 1) );
  int pixWidth = int( map(mouseX, 0, width, 16,1) );
  frameRate(int(map(mouseX, 0, width, 25, 5) ));

  //Update heights of all pixels
  updateAll(inc, pixWidth);  //Redraw the pixel rods when their heights change
}


/* This function loads a new image 
   and set up a 3D rod for each pixel.
*/
void newImg() {
  img = loadImage("TimSVermeer.jpg");
 
  /* Set the window to fit the image with some some space around the image. */
  size(int(img.width * 1.5), int(img.height * 3.0), OPENGL);
    
  xOrig = int(img.width * 0.25);    //top left corner to draw image
  yOrig = int(img.height * 1.5);


  // Create a "rod" for each pixel 
  rods = new pixRod[img.width * img.height];
  nPix = 0;
  for (int j=0; j < img.height; j++) {
    for (int k=0; k < img.width; k++) {
      rods[nPix] = new pixRod();
      rods[nPix].refCol = img.pixels[0];
      rods[nPix].pixCol = img.pixels[nPix];
      rods[nPix].pixWidth = 2;
      nPix+=1;
    }
  }  
  
}


/* This function loads a sound file */
void newSound() {
  minim = new Minim(this);
  
  player = minim.loadFile("water.mp3");          
  player.loop();
 
}

/* This function updates positions and colors all pixels 
   and redraw them */
void updateAll(int increment, int pWidth) {
  int iPix;

  for (int j=0; j < img.height; j+=increment) {
    iPix = j * img.width;
    for (int k=0; k < img.width; k+=increment) {

      pushMatrix();
        translate( k, j);
        rods[iPix].pixWidth = pWidth;  
        rods[iPix].draw();
       popMatrix(); 
      
      iPix+=increment;      
    }
  }  

}


/* Calculate the distance between two colors
 */
float distColor (color ref, color col) {
  
  float rf,gf,bf, r,g,b;
  
  rf = red(ref);
  gf = green(ref);
  bf = blue(ref);
  r  = red(col);
  g  = green(col);
  b  = blue(col);
  
  return abs(dist(rf,gf,bf, r,g,b));
}  

/* This class holds a pixel */
class pixRod {
  
  color pixCol, refCol;
  int pixWidth;

  void draw() {
    int pixZ;
    
    if (distColor(refCol, pixCol) > 20.0) {
      /*Use the sound volume to set the height of the pixel */
      pixZ = int( map ( player.mix.get(sInd) * 10,-1.0, 1.0, 10, 70));
     // beginShape();
      fill(pixCol);
      box(pixWidth, pixWidth, pixZ);
      //endShape();

    } 

  }
}



