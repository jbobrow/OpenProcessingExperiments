
// Painting is the name of the class that I
// have built.  All of my objects are going to
// be built using the Painting blueprints.
// Since I'm going to have a few of these
// things, I need to create an array 
// of Paintings.
// Remember, this stuff is pretty formulaic.
// It always goes:

// Class[] myObjects;
// myObjects=new Class[100];
// myObjects[from 0 to 99]=new Class(x,y,z);
// ...

Painting[] myPainting;

void setup() {
  size(600, 480);
  //
  // I think that the CENTER setting
  // makes it easier to manipulate
  // my objects.  YMMV.
  imageMode(CENTER);
  rectMode(CENTER);
  
  
  // Go ahead and tell Processing how many
  // objects its going to need to build
  
  myPainting=new Painting[3];
  
  // Now INSTANTIATE each object for the first time.
  // This is the part where each object
  // pops into being for the first time
  // (just in the computer's memory; 
  // we still won't be able to see them).
  // Note that I gave my paintings uniform
  // names (painting-1.jpg, painting-2.jpg)
  // so that I could automatically
  // "calculate" the name of the painting to load.
  
  for (int n=0;n<myPainting.length;n++) {
    String jpgName="painting-"+(n+1)+".jpg";
    float xStart=random(100, width-100);
    float yStart=random(100, height-100);
    myPainting[n]=new Painting(jpgName, xStart, yStart);
  }
}



void draw() {
  background(245);
  //
  // this is the easy part.
  // just cycle through the objects, one by one, and
  // have them do whatever they do.  Usually, that means
  // "display" or "move" or "tick" or "bounce" etc
  //
  
  for (int n=0;n<myPainting.length;n++) {
    myPainting[n].showArt();
    myPainting[n].moveArt();
  }
}

void mousePressed() {
  //
  // if the mouse gets pressed, then go through
  // every image object and INVERT its visibility.
  // i.e., invisible ones become visible, and vice versa.
  //
  for (int n=0;n<myPainting.length;n++) {
    if (myPainting[n].imageIsVisible==true) {
      myPainting[n].imageIsVisible=false;
    }
    else {
      myPainting[n].imageIsVisible=true;
    }
  }
}

class Painting {
  // this is where I think of all the qualities I
  // want my object to possess.
  PImage theImage; // <-- the object CONTAINS an image!
  float imageXPosition;
  float imageYPosition;
  float rotationAmount;
  float rotationSpeed;
  boolean imageIsVisible;

  Painting (String imageAddress, float x, float y) {
    // this the CONSTRUCTOR, which BUILDS the object
    // when it first comes into the world (see SETUP).
    // the first 3 lines use data we specified in setup();
    // the last three lines don't care about setup, they
    // do things their own way.  
    // NOTE that in order to build an object, EVERY
    // variable specified at the top of the class
    // MUST be initialized.  I.e., even though 
    // rotationAmount = 0 (below), I still have to say
    // "rotationAmount=0;" or I'll get an error.
    theImage=loadImage(imageAddress);
    imageXPosition=x;
    imageYPosition=y;
    rotationAmount=0;
    rotationSpeed=radians(random(-1,1));
    imageIsVisible=true;
  }

  void showArt() {
    // check our local variable "imageIsVisible"...
    // if it is set to True, then go to work:
    if (imageIsVisible==true) {
      // since we're manipulating a few different things
      // in space, it is almost always easiest to start
      // by pushing the Matrix();
      pushMatrix();
      // now move us over to the image's X and Y position;
      translate(imageXPosition,imageYPosition);
      // and rotate the required amount.
      rotate(rotationAmount);
      // Since we already "translated" to the imageX,Y position,
      // I just put the image at 0,0;
      // the 200,200 refers to the x and y size of the
      // image (I have to shrink them b/c they are
      // too big to fit in the window).
      image(theImage, 0, 0, 200, 200);
      //Pop!  now 0,0 is back up in the upperlefthand
      //corner, instead of at imageXPosition,imageYPosition.
      popMatrix();
    }
    else {
      // ok.  So the image is set to be invisible?
      // then do all the same stuff, but draw
      // a rectangle instead of a painting.
      pushMatrix();
      translate(imageXPosition,imageYPosition);
      rotate(rotationAmount);
      noFill();
      rect(0,0,200,200);
      popMatrix();
    }
  }
  
  void moveArt() {
    // move it randomly along x and y axes (just a bit)
    imageXPosition=imageXPosition+random(-2,2);
    imageYPosition=imageYPosition+random(-2,2);
    // spin it around (just a bit)
    rotationAmount=rotationAmount+rotationSpeed;
  }
  
}



