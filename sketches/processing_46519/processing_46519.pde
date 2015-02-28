
/********************************
*
* 2011
*
* www.contrechoc.com
*
* illustration of getting images on a circle and rotating the images
*
* feel free to eloborate, copy, modify!
*
* move mouse!
*
*********************************/

PImage myClockImage;
PImage myHand1Image;
PImage myHand2Image;

PImage timeFreakImage;

void setup() {
  size(600, 600);
  fill ( 255, 255, 0);

  myClockImage = loadImage ("clock.png"); 
  myHand1Image = loadImage ("handB.png"); 
  myHand2Image = loadImage ("handBB.png"); 
  timeFreakImage = loadImage ("time_freak.png"); 
  smooth();
}


void draw() {
  background(0);
  image(timeFreakImage, width/2 - timeFreakImage.width/2, height/2  - timeFreakImage.height/2);

  float myRadius = 240;
  for ( int i = 0; i < 360 ; i+=20 ) {
    float angle = float(i)/360.0 * 2 * PI   ;
    float x = width/2 + myRadius * sin ( angle );
    float y = height/2 + myRadius * cos ( angle );
    // ellipse(x, y, 20, 20);
    float widthClock = 70;
    image(myClockImage, x - widthClock/2, y - widthClock/2, widthClock, widthClock  );
    pushMatrix();
    translate(x, y);
    rotate ( -angle + float(mouseX) /50.0 );
    translate( -5, -30 + 4);
    image(myHand1Image, 0, 0, 10, 30 );
    popMatrix();

    pushMatrix();
    translate(x, y);
    rotate ( -angle + float(mouseY) /50.0 );
    translate( -5, -45 + 4);
    image(myHand2Image, 0, 0, 10, 45 );
    popMatrix();
  }
}


