
import hypermedia.video.*;


String alphabet = "abcdefghijklmnopqrstuvqxyz";
String [] letters = new String [100];
float [] x = new float [100];
float [] y = new float [100];
boolean [] falling = new boolean[100];
int savedTime; //this will record the time when the function was last called
int interval = 300; //how often we want to call the function in milliseconds
int bThreshold = 70;



OpenCV opencv;
int threshold = 80;

void setup () {
  smooth();
  noStroke();
  size(640,480);
  opencv = new OpenCV(this);
  opencv.capture(width,height);
  fill(0);
  savedTime = millis();
  //Turn on id you want to see a still image
  //tempImage = loadImage("Still-Participant.gif");
}

void draw () {
  opencv.read(); 
  opencv.absDiff();
  opencv.threshold(threshold);
  opencv.flip( OpenCV.FLIP_HORIZONTAL );
  opencv.convert(OpenCV.GRAY);
  background( opencv.image() );

  //Turn on id you want to see a still image
  // image(tempImage,0,0);
  //draw the catcher or temporary 'participant'

  for (int i=0; i<letters.length ; i++) {
    //moveLetter(i);
    if (falling[i]) {
        if (!checkDarkPixel(x[i],y[i])) {
          moveLetter(i);
        }
    }
  }

  for (int i=0; i<letters.length ; i++) {
    if (falling[i]) {
      drawLetter(letters[i],x[i],y[i],i);
    }
  }
  if (millis() > savedTime+interval) {
    makeLetter();
    savedTime = millis();
  }
}


void moveLetter (int tempI) {
  y[tempI]++;
  if (y[tempI] > height) {
    falling[tempI] = false;
  }
}

void drawLetter (String tempS, float tempX, float tempY, int tempI) {
  fill(0);
  text(tempS, tempX, tempY);
}


void makeLetter () {
  boolean madeLetter = false;
  int randomNumber = int(random(alphabet.length()));
  String tempChar = alphabet.substring(randomNumber,randomNumber+1);
  for (int i=0; i<letters.length ; i++) {
    if (!falling[i] && !madeLetter) {
      madeLetter = true;
      letters[i]=tempChar;
      falling[i] = true;
      x[i] = random(width);
      y[i] = 20;
      //println("Making Character: " + tempChar);
    }
  }
}

boolean checkDarkPixel (float mx, float my) {
  boolean isPixelDark = false;
  //load the pixels of the display window
  //so we can access the pixels array
  loadPixels();
  //get the location in the pixels array
  int loc = int(my*width + mx);
  if (loc > 0 && loc <pixels.length) {
    //get its brightness
    float b = brightness(pixels[loc]);
    //make a boolean variable, until we test, we will caonsider the pixel light

    //if the brightness of the pixel is less then the threshold
    //make isPixelDark true, as we now consider is dark
    if (b < bThreshold) {
      isPixelDark = true;
    }
  }

  //return the result of our test
  return isPixelDark;
}


