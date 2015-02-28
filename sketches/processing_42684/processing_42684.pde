
import processing.video.*;
Capture myCapture;

PFont myFont;
PFont myFont2;

float xOne = 1;
float yOne = 1;
float x_speed = 3;
float y_speed= 2;

float xTwo = 1;
float yTwo = 1;
float x_speed2 = 1;
float y_speed2 = 5;

void setup() 
{
  size(600, 600);

  myFont = loadFont("Helvetica-48.vlw");
  myFont2 = loadFont("GujaratiMT-48.vlw");
  // The name of the capture device is dependent on
  // the cameras that are currently attached to your 
  // computer. To get a list of the 
  // choices, uncomment the following line 
  println(Capture.list());

  // To select the camera, replace "Camera Name" 
  // in the next line with one from Capture.list()
  // myCapture = new Capture(this, width, height, "Camera Name", 30);

  // This code will try to use the camera used
  myCapture = new Capture(this, 200, 150, 30);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}


void draw() {
  tint(255, 20);
  image(myCapture, xOne, yOne);
  image(myCapture, xTwo, yTwo);
  bounce();
  bounce2();
  xOne += x_speed;
  yOne += y_speed;
  xTwo += x_speed2;
  yTwo += y_speed2;
  fill (random(10,240),255);
  textFont(myFont,48);
  text(xOne, 50, 550);
  textFont(myFont2,48);
  text(xTwo, 350, 550);
}


void bounce() {
  if ((xOne >= width-myCapture.width) || (xOne <= 0)) {
    x_speed *= -1;
  }
  if ((yOne >= width-myCapture.height) || (yOne <= 0)) {
    y_speed *= -1;
  }
}

void bounce2() {
  if ((xTwo >= width-myCapture.width) || (xTwo <= 0)) {
    x_speed2 *= -1;
  }
  if ((yTwo >= width-myCapture.height) || (yTwo <= 0)) {
    y_speed2 *= -1;
  }
}


