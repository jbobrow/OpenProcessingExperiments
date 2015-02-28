
/*
abstract-o-matic
August 8, 2008 - howard winston
http://www.howardwinston.com
email: info@howardwinston.com
compose an abstract composition generated randomly
needs to be enjoyed each time because it will never return again
mouse click to start over - losing the old - never to be seen again
*/

// set sizes, counts, arrays, etc.
static int defaultWidth = 900;
static int defaultHeight = 400;
	
// other sizes about the screen
int diagonalLength;
Point centerPoint;

// calculate once to avoid expensive divide instructions
int halfWidth;
int halfHeight;
int quarterWidth;
int quarterHeight;
int eighthWidth;
int eighthHeight;
int sixteenthWidth;
int sixteenthHeight;

// coordinates for translation points
int xCoord1;
int yCoord1;
int xCoord2;
int yCoord2;
int xCoord3;
int yCoord3;
int xCoord4;
int yCoord4;
int xCoord5;
int yCoord5;

PImage redImages[] = new PImage[10];
PImage orangeImages[] = new PImage[10];
PImage yellowImages[] = new PImage[10];
PImage greenImages[] = new PImage[10];
PImage blueImages[] = new PImage[10];
PImage violetImages[] = new PImage[10];
PImage whiteImages[] = new PImage[10];
PImage blackImages[] = new PImage[10];

Random random = new Random();

// color numbers
static final int RED = 1;
static final int ORANGE = 2;
static final int YELLOW = 3;
static final int GREEN = 4;
static final int BLUE = 5;
static final int VIOLET = 6;
static final int WHITE = 7;
static final int BLACK = 8;
	
// background info
int bgR;
int bgG;
int bgB;
int bgA;

// controls for controlling the number of images
int numberOfImagesToSend;
int numberOfImagesSent;

void setup() {
  size(900, 400);

  // calculate once to avoid expensive divide instructions
  halfWidth = defaultWidth/2;
  halfHeight = defaultHeight/2;
  quarterWidth = defaultWidth/4;
  quarterHeight = defaultHeight/4;
  eighthWidth = defaultWidth/8;
  eighthHeight = defaultHeight/8;
  sixteenthWidth = defaultWidth/16;
  sixteenthHeight = defaultHeight/16;
		
  // diagonal length of default screen
  diagonalLength = (int) Math.sqrt((defaultWidth * defaultWidth) + (defaultHeight * defaultHeight));
  centerPoint = new Point(halfWidth, halfHeight);
		
  numberOfImagesToSend = (random.nextInt(60) + 3); 
  bgR = (random.nextInt(125) + 125);
  bgG = (random.nextInt(125) + 125);
  bgB = (random.nextInt(125) + 125);
  bgA = 0;
  background(bgR,bgG,bgB);
		
  frameRate(36);
  loadImagesIntoArray();
		
  // calculate 5 translation points
  xCoord1 = quarterWidth;
  yCoord1 = quarterHeight;
  xCoord2 = halfWidth + quarterWidth;
  yCoord2 = quarterHeight;
  xCoord3 = halfWidth;
  yCoord3 = halfHeight;
  xCoord4 = quarterWidth;
  yCoord4 = halfHeight + quarterHeight;
  xCoord5 = halfWidth + quarterWidth;
  yCoord5 = halfHeight + quarterHeight;

}

/*
 * "paint" with images and random rectangles to create a composition
 * a png image is more likely than a rectangle but a few rectangles 
 * show up. Images are rotated at various random angles. 
 * The background color will be random each time.
 */
 
void draw() {
  if (numberOfImagesSent < numberOfImagesToSend) {
    int whichOfFive = random.nextInt(5) + 1;
    switch (whichOfFive) {
      case 1:
        pushMatrix();
        translate(xCoord1, yCoord1);
        if (random.nextInt(3) == 1) {
          createRandomRect();							
        } else {
          rotate(360*random.nextFloat());
          image(selectRandomImage(), 0, 0);
        }
        popMatrix();
        break;
      case 2:
        pushMatrix();
        translate(xCoord2, yCoord2);
        if (random.nextInt(3) == 1) {
          createRandomRect();
        } else {
          rotate(360*random.nextFloat());
          image(selectRandomImage(), 0, 0);
        }
        popMatrix();
        break;
      case 3:
        pushMatrix();
        translate(xCoord3, yCoord3);
        if (random.nextInt(3) == 1) {
          createRandomRect();
        } else {
          rotate(360*random.nextFloat());
          image(selectRandomImage(), 0, 0);
        }
        popMatrix();
        break;
      case 4:
	pushMatrix();
	translate(xCoord4, yCoord4);
	if (random.nextInt(3) == 1) {
	  createRandomRect();
	} else {
	  rotate(360*random.nextFloat());
	  image(selectRandomImage(), 0, 0);
	}
	popMatrix();
	break;
      case 5:
	pushMatrix();
	translate(xCoord5, yCoord5);
	if (random.nextInt(3) == 1) {
	  createRandomRect();
	} else {
	  rotate(360*random.nextFloat());
	  image(selectRandomImage(), 0, 0);
	}
	popMatrix();
	break;			
	}
	numberOfImagesSent = numberOfImagesSent + 1;
    }
}

void mousePressed() {
  numberOfImagesSent = 0;
  numberOfImagesToSend = (random.nextInt(60) + 3);
  bgR = (random.nextInt(125)+ 125);
  bgG = (random.nextInt(125)+ 125);
  bgB = (random.nextInt(125)+ 125);
  bgA = 0;
  background(bgR,bgG,bgB);
}

