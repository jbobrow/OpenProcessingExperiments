
// Create a friend for Gunilla. Gunilla is lonely, and needs a friend.
//This was needed in order to make it work in javascript:
/* @pjs preload="gunilla.jpg"; */


// Global variables
color strokeColor = color (30, 100, 20, 200);
color fillColor = color (20, 80, 10, 240);
float xPos[];
float yPos[];
float xmirrorpos[];
float ymirrorpos[];
float centerX;
float centerY;
float startX;
float startY;
ArrayList<Person> people;
int theIndex;

PImage bg;    //Background image



void setup() {
  size(1024, 765);
  // Set background image
  bg = loadImage("gunilla.jpg");
  theIndex=1;

  // Set up the array with drawn coordinates
  xPos = new float[500];
  yPos = new float[500];
  // These are the mirrored coordinates
  xmirrorpos = new float[500];
  ymirrorpos = new float[100];
  stroke(200, 200, 200);
  strokeWeight(4);
  people = new ArrayList<Person>();
}

void draw() {
  background(bg);
  // loop through all the persons in the people object array and draw them on screen
  for (int i = people.size()-1; i >= 0; i--) {
    Person someGuy = people.get(i);
    // Bounce around
    someGuy.update();
    // draw on screen 
    someGuy.display();
  }
  // Draw the current shape, with its mirror vertices 
  stroke(strokeColor);
  for (int i = 1; i < theIndex; i++ ) {
    line(xPos[i-1], yPos[i-1], xPos[i], yPos[i]);
    line(xmirrorpos[i-1], yPos[i-1], xmirrorpos[i], yPos[i]);
  }
}

void mouseDragged() {
  
  // Add the mouse posititon to the array of vertices
  xPos[theIndex]=mouseX;
  yPos[theIndex]=mouseY;
  xmirrorpos[theIndex]=centerX-(mouseX-centerX);
  ellipse (xPos[theIndex], yPos[theIndex], 10, 10);
  theIndex++;
  // We dont want to overflow the Array
  if (theIndex>499) {
    theIndex=499;
  }
}

void mousePressed() {
  // Start drawing shape
  theIndex=0;
  centerX=mouseX;
  centerY=mouseY;
  xPos[theIndex]=mouseX;
  yPos[theIndex]=mouseY;
  xmirrorpos[theIndex]=centerX;
  theIndex++;
  startX=mouseX;
  startY=mouseY;
}

void mouseReleased() {
  
  xPos[theIndex]=centerX;
  yPos[theIndex]=mouseY;
  xmirrorpos[theIndex]=centerX;
  // Ceate a new person with the current shape . The array is global, so we're off easy here I guess...
  people.add(new Person(mouseX, mouseY));
}
void keyReleased() {

  if (key == 's' || key == 'S') {
    saveFrame("screenshot.png");
  }

  switch(key) {
  case '1' : 
    strokeColor = color(30, 100, 20, 200);
    fillColor = color(30, 100, 20, 200);
    break;
  case '2' : 
    strokeColor = color (30, 22, 100, 200);
    fillColor = color(20, 12, 90, 200);
    break;
  case '3' : 
    strokeColor = color (200, 20, 20, 200);
    fillColor = color(180, 10, 10, 200);
    break;
  case '4' : 
    strokeColor = color (60, 250, 20, 200);
    fillColor = color(50, 240, 10, 200);
    break;
  }
}
class Person {
  // The 'Person' class
  // This is initialised as soon as the user releases the mouse button.
  
  // Properties
  float pxPos, pyPos ;
  float xspeed, yspeed;
  int myVertices;
  int id;
  int size;
  float shapeX[];
  float shapeY[];
  float myWidth;
  float myHeight;
  float offsetX;
  float offsetY;
  float eyecenter;
  float eyesize;
  float middle;

  color myStrokeColor = color (20, 59, 10, 90);
  color myFillColor;
  
  // These are the two constructor methods
  Person() {
     // if no coordinates are passed - we choose random ones.
    pxPos=int(random(10, width-10));
    pyPos=int(random(10, height-10));
    initPerson();
  }
  Person(float x, float y) {
    // set the object start location 
    pxPos = x;
    pyPos = y;
    initPerson();
  }

  // common constructor method
  void initPerson() {
    // each person will carry hirs own array of vertices. 
    // The location on the screen is 
    shapeX = new float[theIndex*2];
    shapeY = new float[theIndex*2];
    size=int (random(10, 60));
    xspeed=random(-1, 1);
    yspeed=random(-1, 1);
    offsetX=centerX;
    offsetY=centerY;
    myStrokeColor=strokeColor;
    myFillColor = fillColor;
    myWidth=1;
    
    // copy the vertices from the global array to the object.
    for (int i = 1; i < theIndex-1; i++ ) {
      shapeX[i]=offsetX-xPos[i];
      shapeY[i]=yPos[i]-offsetY;
      int reverseindex = theIndex+theIndex-i-3;
      shapeX[reverseindex]=offsetX-xmirrorpos[i];
      shapeY[reverseindex]=yPos[i]-offsetY;
      print ("X="+shapeX[i]);
      if (shapeX[i]<myWidth) {
        print("new width:"+shapeX[i]);
        myWidth=shapeX[i];
      }
      if (shapeY[i]>myHeight) {
        myHeight=shapeY[i];
      }
    }
    myWidth=-myWidth;
    eyecenter = myHeight /4;
    eyesize = myWidth/4;
    myVertices=theIndex*2-3;
    for (int i = 1; i < myVertices; i++ ) {
      shapeY[i]=shapeY[i] -myHeight;
    }
    theIndex=1;
  }

  void update() 
  // Bounce around....
  {  
    if (pxPos<1) {
      xspeed = 2;
    }
    if (pxPos+myWidth>width) {
      xspeed = -2;
    }
    if ( pyPos-myHeight<1) {
      yspeed = 2;
    }
    if (pyPos>height) {
      yspeed = -2;
    }
    pxPos=pxPos + xspeed;
    pyPos=pyPos + yspeed;
  }

  void travel() {
    //xspeed=random(-0.5, 0.5);
    //yspeed=random(-0.5, 0.5);
  }
  void display() {
 
    // draw the shape on screen
    fill(myFillColor);
    stroke(myStrokeColor);
    beginShape();
    for (int i = 1; i < myVertices-1; i++ ) {
      vertex(pxPos+shapeX[i], pyPos+shapeY[i]);
    }
    endShape(CLOSE);
    
    // draw the eyes :)
    stroke(255, 255, 255, 200);
    fill(0, 0, 0, 200);
    ellipse(pxPos -10 -eyesize, pyPos-myHeight+eyecenter, eyesize, eyesize);
    ellipse(pxPos +10 +eyesize, pyPos-myHeight+eyecenter, eyesize, eyesize);
  }
}



