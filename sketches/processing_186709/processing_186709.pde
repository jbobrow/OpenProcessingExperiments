


int pixelsPerInch=10;
int interOccular = 500;
int eyeRad = 465/2;//46.5inch diam
int eyeMinorRad = 235/2;//23.5 inches diam
int rotationHeading = 0;
int rotationAltitude = 0;
// int pupilR =0;
// int pupilThetaDegrees = 0;
int pupilGutter= 145 -eyeMinorRad; //gutter carriage to edge is 15 and 14.5  floor to 14.5
float zoom = 1.75;


//ControlP5 cp5;
boolean mouse = true;
boolean bounce= false;
boolean OSC;
boolean eyesConected = true; //checked later on

void setup() {
  size( 500, 500, P3D);
//  initFirmata();
//  initControlPanel();
  frameRate(24);
  smooth();
}

void draw() {
  background(60);
  camera(-width*zoom, -height*zoom, height*zoom, width, height, 0, 0, 1, 0);
  noStroke();
  pushMatrix();
  //translate(width/2, height/2, zoom);//centers the rotation and the draw surface in the upper middle of the screen
  rotateY(radians(rotationHeading));
  rotateX(radians(rotationAltitude));
  drawGumball();
  PVector origin = new PVector(0, 0, 0);
  PVector gap = new PVector(interOccular/2, 0, 0);
  PVector origin1, origin2;
  origin1 = origin.get();
  origin2 = origin.get();
  origin1.add(gap);
  origin2.sub(gap);
  findGazeDrawEye(origin1, planarMouse());
  findGazeDrawEye(origin2,planarMouse());
  planarMouse();
  popMatrix();
  camera();

}

void sinuasoidalBounce() {
  float sinuasoid = sin(radians(frameCount%360));
  //  int discreteRotaryGoal  = int(map(sinuasoid, -1, 1, 0, 16));
  // constrain(sinuasoid,-1,1);
  int pupilR= int(map(sinuasoid, -1, 1, -255, 255));
   int pupilThetaDegrees = int(map(sinuasoid, -1, 1, 0, 360));
  moveEye(pupilThetaDegrees, pupilR);

}

void moveEye(int thetaGoal, int pupilRGoal) {
  boolean debug = false;
  //Moves the physical eye to the coord specified.
  //TODO consider feedback upon goal reach
  //TODO figure out a left eye right eye solution or move them in tandem
  //Rotation: 0 to 360 CCW with zero at 3:00. 
  //linear: 0 to 360 with 180 being home

    int pupilRArduino = int(map(pupilRGoal, -255, 255, 0, 360));
    pupilRArduino=constrain(pupilRArduino, 0, 360);
  // pupilRArduino = 360;
  int discreteRotaryGoal = (int(map(thetaGoal, 0, 360, 0, 16)));
  discreteRotaryGoal = (discreteRotaryGoal+6)%16;
  if (debug) {
    print("pupilRArduino: ", pupilRArduino);
    print("\tthetaGoal: ", thetaGoal);
    println("\tdiscreteRotaryGoal: ", discreteRotaryGoal);
  }

}


void drawGumball() {
  int lineLength = 100;
  //draws a trident of colored lines to help with axis ID
  strokeWeight(1);
  strokeCap(ROUND);
  stroke(255, 0, 0); //x is red
  line(0, 0, lineLength, 0);
  stroke(0, 255, 0);//y is green
  line(0, 0, 0, lineLength);
  stroke(0, 0, 255);//z is blue
  line(0, 0, 0, 0, 0, lineLength);
}



void findGazeDrawEye(PVector origin, PVector target) {
  //determines, based on the location of the eye annd the location of the thing to be looked t
  //the proper render/command to display/run the eye to
  boolean debug = true;
  strokeWeight(1);
  strokeCap(ROUND);
  stroke(0, 255, 0); //x is red
  PVector eyeNormal = new PVector(0, 0, 1);
  if (debug)line(origin.x, origin.y, origin.z, origin.x, origin.y, origin.z+400);
  stroke(255, 0, 0); //x is red
  if (debug)line(origin.x, origin.y, origin.z, target.x, target.y, target.z);
  PVector gazeVector = target.get();
  gazeVector.sub(origin);
  float gazeTheta = PVector.angleBetween(eyeNormal, gazeVector);
  if (gazeVector.x < 0) {
    gazeTheta = -gazeTheta;
  }
  // println("gazeTheta: "+degrees(gazeTheta));
  int pupilR = int(tan(gazeTheta)*255);
  // print("\tpupilR:\t"+pupilR);
  int thetaGoal = 0;

  eyeModel(origin, pupilR, thetaGoal); 
  moveEye(thetaGoal, pupilR);
}

PVector planarMouse() {
  //returns a target that is on the screen
  noCursor();
  noStroke();
  fill(255, 44);
  // controllerOrigin
  // rect(width, width-100, 0, 400);
  pushMatrix();
  rotateX(radians(90));
  int planeWidth = interOccular*2;
  int planeDepth = planeWidth*2;
  translate(-planeWidth/2, eyeRad*3, 0);
  // rect(0, 0, planeWidth, planeDepth);
  stroke(33);
  strokeWeight(1);
  int stripePitch = 99;
  for (int xStripe = 0; xStripe <= planeWidth/stripePitch; ++xStripe) {
    line(xStripe*stripePitch, 0, xStripe*stripePitch, planeDepth);
  }
  for (int yStripe = 0; yStripe <= planeDepth/stripePitch; ++yStripe) {
    line(0, yStripe*stripePitch, planeWidth, yStripe*stripePitch);
  }
  popMatrix();
  stroke(255, 0, 255);//white
  strokeWeight(40);
  strokeCap(ROUND);
  PVector target = new PVector(map(mouseX, 0, width, -planeWidth, planeWidth), 0, map(mouseY, 0, height, 0, planeDepth*1));
  point(target.x, target.y-20, target.z);//whte dot behind eye   
  noStroke();
  return target;
}

void eyeModel(PVector origin, int pupilR, int pupilTheta) {
  // Displays a visual model of the eye with the specified params

  int xCen = int(origin.x);
  int yCen = int(origin.y);
  int zCen = int(origin.z);
  int bigRad =eyeRad ;//46.5inch diam
  int smallRad = eyeMinorRad;//23.5 inches diam ////delete
  int trueMaximum = bigRad-smallRad-pupilGutter;
  float gutterLossCoeff = eyeRad/trueMaximum;
  int max255 = int(gutterLossCoeff*255);
  pupilR = constrain(pupilR, -max255, max255); //can travel backwards, meaning not truly polar coords
  pupilTheta = constrain(pupilTheta, 0, 360);//Angular position of the pupil, CCW degrees from 3 o'clock

  int pupilRPixels = int(map(pupilR, -255, 255, -eyeRad, eyeRad));
  pupilRPixels = constrain(pupilRPixels, -trueMaximum, trueMaximum);
  //whte dot behind eye 
  stroke(255);//white
  strokeWeight(10);
  strokeCap(ROUND);
  //point(xCen, yCen, zCen);//whte dot behind eye   
  noStroke();
  //EYEBALL
  pushMatrix();
  translate(0, 0, bigRad);
  float pupilThetaRadians=radians(pupilTheta);
  fill(211);//White of entire eye
  ellipse(xCen, yCen, 2*bigRad, 2*bigRad);//White of eye
  fill(222);//White of traversable eye area
  translate(0, 0, 1);//shift 1 px forward to avoid self intercection
  ellipse(xCen, yCen, 2*(bigRad-pupilGutter), 2*(bigRad-pupilGutter));//White of eye, travelable zone
  fill(45);//Pupil Black
  translate(0, 0, 1);//shift 1 px forward to avoid self intercection
  ellipse(xCen + pupilRPixels*cos(pupilThetaRadians), yCen-pupilRPixels*sin(pupilThetaRadians), 2*smallRad, 2*smallRad);
  translate(0, 0, 1);//shift 1 px forward to avoid self intercection
  noFill();
  stroke(255);//HILIGHT WHITE
  strokeWeight(bigRad/10);
  strokeCap(SQUARE);//For the hilight
  float hightlightRad = 1.4;
  arc(xCen, yCen, hightlightRad*bigRad, hightlightRad*bigRad, radians(207), radians(223));
  arc(xCen, yCen, hightlightRad*bigRad, hightlightRad*bigRad, radians(228), radians(239));
  noStroke();
  popMatrix();
}

