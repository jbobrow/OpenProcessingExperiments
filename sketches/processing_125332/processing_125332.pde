
/*****************************************************
/*  Introduction to Computational Arts
/*  Final Project
/*  December 2013
/*****************************************************/

/*****************************************************
/*  Imports
/*****************************************************/
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

/*****************************************************
/*  Variables
/*****************************************************/
Minim minim, minim2;                           /*  Sound stuff   */
AudioOutput out;                               /*  A generated note determined by the area of the canvas covered */
Oscil wave;
float amp = 0.02f;                             /*  The amplitude of the continuous note  */
float freq = 440;                              /*  The frequency of the continuous note.  */
AudioPlayer down, up, newBG, error;            /*  The sounds played on starting the two types of trail or a new background or an error*/
float ampFactor = 1.2;                         /*  The factor by which the volume can be altered.  */
int nOfImages = 9;                             /*  The number of images loaded  */
int nOfImagesEff = nOfImages;                  /*  The number of trails active  */
int maxImages = nOfImages * 3;                 /*  An arbitrary limit to the maximum number of trails possible  */
PImage[] images = new PImage[maxImages];       /*  The images used by the active trails  */
int height = 600, width = 800;                 /*  Dimensions of the canvas  */
int frameRate = 10;                            /*  Number of frames per second  */
int maxFrameRate= 16, minFrameRate = 4;        /*  Maximum & minimum frame rate allowed.  */
int deltaFrameRate = 3;                        /*  Change in frame rate when user increases or decreases it  */
int imageWidth = 50, imageHeight = 50;         /*  Dimensions of each image  */
int[] x = new int[maxImages];                  /*  The position of each image on the canvas  */
int[] y = new int[maxImages];
int r, g, b;                                   /*  The red, green & blue components of a colour  */
PImage imageBG, newImage;                      /*  Working variables for a new image trail and an image of the canvas background colour  */
color colourUnderMouse, colourBG, colourBG2;   /*  Looking at the colour of the background and the canvas under the mouse  */
int nChanged;                                  /*  The trail number for a new trail  */
int areaBG;                                    /*  The area of the canvas (pixels) still the background colour  */
int time;                                      /*  Measure of time in arbitrary units  */
int timeSample = 5;                            /*  Interval at which the area is analysed  */
Boolean stopped = false;                       /*  Has the motion been paused?   */

/*****************************************************
/*  One-off set-up
/*****************************************************/
void setup() {

  /*  Set the number of frames to be drawn per second.  */
  frameRate(frameRate);

  /*  Use a randomly generated colour for the canvas background.  */
  r = int(random(255));
  g=int(random(255));
  b=int(random(255));
  background(r, g, b);
  size(width, height);

  /*  Create an image of the background colour.  */
  imageBG = createImage(imageWidth, imageHeight, 1);
  for (int i = 0; i < imageBG.pixels.length; i++) {
    imageBG.pixels[i] = color(r, g, b);
  }
  colourBG  = imageBG.pixels[0];

  /*  Load an image of each type and assign it a random initial position on the screen.  */
  for (int i = 0; i < nOfImages; i++) {
    String a2 = '0'+str(i+1);
    a2 = str(a2.charAt(a2.length() - 2)) + str(a2.charAt(a2.length() - 1));
    images[i] = loadImage("I" + a2 + ".png");
    y[i] = int(random(0, height - imageHeight)); 
    x[i] = int(random(0, width - imageWidth));
  }

  /*  Load the sounds to be played on creating a new trail or changing the background or user error.  */
  minim2 = new Minim(this);
  down = minim2.loadFile("Down.wav");
  up = minim2.loadFile("Up.wav");
  newBG = minim2.loadFile("New.wav");
  error = minim2.loadFile("Error.wav");

  /*  Play a continuous sound whose frequency reflects the area of the canvas still covered by the background.  */
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil(freq, amp, Waves.QUARTERPULSE );
  wave.patch(out);
}

/*****************************************************
/*  Draw the canvas
/*****************************************************/
void draw() {
  
  /*  For each active trail...  */
  for (int i = 0; i < nOfImagesEff; i++) {

    /*  ...unless newly started, move it by a random amount.  */
    if (i != nChanged) {
      x[i]+=int(random(-40, 40));
      y[i]+=int(random(-40, 40));
    }
    else {
      nChanged = -1;
    }

    /*  If the trail is of the background, draw it. The colour of the background seems to change one drawn (tint?) - this is
     a fudge to keep track of the two different colours.  */
    if (images[i] == imageBG) {
      tint(255, 255);
      image(images[i], x[i], y[i], imageWidth, imageHeight);
      if (colourBG2 == 0) {
        loadPixels();
        color c= get(x[i], y[i]);
        if (c != 0) colourBG2  = c;
      }
    }

    /*  If the trail is of an image, change its tint randomly - gives some sort of depth to the trail. 
     Also, for the same reason, make images higher on the canvas more transparent. */
    else {
      tint(int(random(20, 255)), 20+int(float(y[i])/float(height) * float(255-20)));
      image(images[i], x[i], y[i], imageWidth, imageHeight);
    }
  }

  /*  Periodically measure the area (pixels) covered by background.  */
  time++;
  if (time % timeSample == 0) {
    areaBG = 0;
    loadPixels();
    for (int p= 0; p<pixels.length; p+=1) {
      if (pixels[p] == colourBG || pixels[p] == colourBG2) {
        areaBG++;
      }
    }

    /*  A continuous tone plays whose frequency reflects the area of the canvas still covered by the background colour. */
    freq = map( areaBG, 0, pixels.length, 20, 770 );
    wave.setFrequency(freq);
  }

  /*  If the background has been almost completely covered, less than one image's worth of background left....  */
  if (time % timeSample == 0 && time > timeSample && areaBG < imageWidth * imageHeight) {

    /*  Generate a new background colour.... */

    r = int(random(255));
    g=int(random(255));
    b=int(random(255));

    /*  Start a new trail in the middle of the canvas of that colour.  */
    imageBG = createImage(imageWidth, imageHeight, 1);
    for (int i = 0; i < imageBG.pixels.length; i++) {
      imageBG.pixels[i] = color(r, g, b);
    }
    colourBG  = imageBG.pixels[0];
    colourBG2 = 0;

    nChanged = 0;
    if (nOfImagesEff < maxImages) {
      nOfImagesEff +=1;
      nChanged= nOfImagesEff-1;
    }

    /*  Position the new trail in the centre of the canvas.  */
    images[nChanged]=imageBG;
    x[nChanged]=width/2 - imageWidth/2;
    y[nChanged]=height/2 - imageHeight/2;

    /*  Sound the new background sound.  */
    newBG.play();
    newBG.rewind();
  }
}


/*****************************************************
/*  Process keyboard entry
/*****************************************************/
void keyPressed() {

  /*  Process keyboard entry.  */
  switch (Character.toUpperCase(key)) {
    /*  On 0, toggle between stopping & starting the movement. */
  case '0': 
    if (!stopped) {
      wave.setAmplitude(0);
      noLoop();
    }
    else {
      wave.setAmplitude(amp);
      loop();
    }
    stopped = !stopped;
    break;

    /*  On p or P, save the screen to a file P<time>.png in the project folder.*/
  case 'P':
    saveFrame("P" + str(time) + ".png");
    break;

    /* On +, increase the volume. */
  case '+':
    amp*=ampFactor;
    wave.setAmplitude(amp);
    break;

    /* On -, decrease the volume. */
  case '-':
    amp/=ampFactor;
    wave.setAmplitude(amp);
    break;

    /* On >, increase the frame rate. */
  case '>':
    if (frameRate + deltaFrameRate > maxFrameRate) {
      error.play();
      error.rewind();
    } 
    else frameRate(frameRate+=deltaFrameRate);
    break;

    /* On <, decrease the frame rate. */
  case  '<':
    if (frameRate - deltaFrameRate < minFrameRate) {
      error.play();
      error.rewind();
    } 
    else frameRate(frameRate-=deltaFrameRate);
    break;
  }
}

/*****************************************************
/*  Process mouse click
/*****************************************************/
void mousePressed() {
  
  /*  On R-click, exit.  */

  if (mouseButton == RIGHT) exit();

  /*  On L-click, start a new trail.  */

  if (mouseButton == LEFT && !stopped) {
    loadPixels();
    colourUnderMouse = get(mouseX, mouseY);

    /*  If the mouse is over the background, start a new trail with a random image.  */
    if ((colourUnderMouse == colourBG) || (colourUnderMouse == colourBG2)) {
      newImage = images[int(random(nOfImages))];
      down.play();
      down.rewind();
    }
    /*  If the mouse is NOT over the background, start a new trail of the background.  */
    else {
      newImage = imageBG;
      up.play();
      up.rewind();
    }

    /*  Limit the number of trails that can be active at once.  */
    nChanged = 0;
    if (nOfImagesEff < maxImages) {
      nOfImagesEff +=1;
      nChanged= nOfImagesEff-1;
    }

    /*  Position the new trail under the mouse.  */
    images[nChanged]=newImage;
    x[nChanged]=mouseX - imageWidth/2;
    y[nChanged]=mouseY - imageHeight/2;
  }
}


