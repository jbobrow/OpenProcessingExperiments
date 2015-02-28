
/*

 Artistic Statement
 
 "Floating Images" displays miniature portraits taken from 
 famous works of art. Up to a total of eight images are 
 presented within floating ellipses of changing colors. 
 They float slowly across the screen, periodically changing
 speed and direction, and bouncing off the edges of the screen. 
 
 All images are from public-domain images on Wikipedia, edited in GIMP.

 The opening screen provides the user with instructions.

 Images are added by click-release of the mouse, and images
 in display may be removed by click-release of the mouse over
 the images. The complete set of images with descriptive
 information may be seen by 'I' or 'i' keystroke, for info.
 The same descriptive information is also displayed whenever
 an image is added or removed from the display.

*/

// declare global arrays for images used in this project

// number of images (various arrays sized on this)
int imageCount = 8;
//  class for managing images while script runs
FloatingImage[] images = new FloatingImage[imageCount];
//  array of image file names
String[] fileNames = new String[imageCount];
//  array for storing images when loaded from files
PImage[] imageArray = new PImage[imageCount];
//  array of descriptions of images
String[] imageInfo = new String[imageCount];

//  delta values used for calculating speed and 
//  direction of image floating motion
float delta_x;
float delta_y;
//  dictionary of float fields in the FloatingImage class
FloatDict imageData;
// buffer around each image for ellipse
//  and for bounce-wrap calculations
float buffer = 18;
//  delay interval for changing direction of motions
//  with FloatingImage.moveImage()
int  motionDelay = 300;  // every 300 frames, about 5 seconds
//  delay interval for changing color of ellipse
//  with FloatingImage.changeColor()
int colorDelay = 60;  // every 60 frames, about 1 second 

//  controls for display of messages to user
int messageDelay = 180;  // frames for display, about 3 seconds
int messageCount = 1;    // reset after message displayed
String message = "";     // message stored here

//  flag to display info screen with description of images
boolean infoFlag = false;

//  start-up instruction message to user
String[] introMessage = {
  "FLOATING IMAGES",
  "miniature portraits from famous works of art",
  "(edited from public-domain images on Wikipedia)",
  "",
  "Click and release mouse on this screen or over",
  "empty background to add an image.",
  "",
  "When images are floating, click and release mouse",
  "over a displayed image to remove it.",
  "",
  "Use delete or backspace to re-start Floating Images.",
  "Use 's' or 'S' key to save screen shot.",
  "",
  "Use 'i' or 'I' key to see art work sources."
};


void setup() {
  size (1000,700);

  // import images and load instances of class FloatingImage
  //   file names of images to be loaded
  //   and descriptions of images
  fileNames[0] = "oval-munch.jpg";
  imageInfo[0] = "Edvard Munch\nMadonna\n1892-95";
  fileNames[1] = "oval-klimt.jpg";
  imageInfo[1] = "Gustav Klimt\nJudith and the Head of Holofernes\n1901";
  fileNames[2] = "oval-bot-venus.jpg";
  imageInfo[2] = "Sandro Botticelli\nThe Birth of Venus\n1486";
  fileNames[3] = "oval-bot-primavera.jpg";
  imageInfo[3] = "Sandro Botticelli\nPrimavera (Allegory of Spring)\nca. 1482";
  fileNames[4] = "oval-manet.jpg";
  imageInfo[4] = "Edouard Manet\nOlympia\n1863";
  fileNames[5] = "oval-renoir.jpg";
  imageInfo[5] = "Pierre-Auguste Renoir\nGirl Braiding Her Hair\n1885";
  fileNames[6] = "oval-rembrandt.jpg";
  imageInfo[6] = "Rembrant\nThe Girl in a Picture Frame\n1641";
  fileNames[7] = "oval-da-vinci.jpg";
  imageInfo[7] = "Leonardo da Vinci\nVirgin of the Rocks\n1483-1486 (Lourve version)";

  // float data used in instances of class FloatingImage  
  imageData = new FloatDict();

  //  create new instance of FloatingImage class for each image
  for (int i = 0; i < imageCount; i++) {

    //  load each image
    imageArray[i] = loadImage(fileNames[i]);
    //  reduce size of loaded image by half
    imageArray[i].resize(imageArray[i].width/2, imageArray[i].height/2);

    //  imageData is data set for each class instance
    imageData.set("display",0);  // initially, do not display image

    //  delta values used for controlling speed and direction of 
    //  floating image motion
    delta_x = random(-1,2);
    delta_y = random(-2,1);
    //  avoid problem that results if delta values are zero
    if (delta_x == 0) delta_x = 0.1;
    if (delta_y == 0) delta_y = 0.1;
    imageData.set("delta x", delta_x);
    imageData.set("delta y", delta_y);

    //  coordinates for display of images
    //  initial dummy values not used for display
    //  these will be set by mouse-click/release that
    //  causes initial display, and will be changed by
    //  delta values in images.displayImage() on each draw() iteration
    imageData.set("x", width/2 + buffer);
    imageData.set("y", height/2 + buffer);

    //  image width and height, properties of actual image
    imageData.set("w",imageArray[i].width);
    imageData.set("h",imageArray[i].height);

    //  create new instance of class
    images[i] = new FloatingImage(imageArray[i], imageInfo[i], imageData);
  }
}

void draw() {
  background (#199FA2);
  
  //  display images designated to be displayed
  //  and if none designated for display, change noImages to false
  boolean noImages = true;
  for (int i = 0; i < images.length; i++) {
    if (images[i].display == 1) {
      noImages = false;
      //  display this image
      images[i].displayImage();
      //  then move it before next draw() loop
      images[i].moveImage();
      //  and change ellipse color
      images[i].changeColor();
    }
  }

  //  image info request has been received by keystroke 'i' or 'I'
  if (infoFlag) showImageInfo();

  //  for intro message, whenever no images displayed
  //  but only when not showing image info message
  else if (noImages == true) {
    textAlign(CENTER);
    textSize(32);
    for (int i = 0; i < introMessage.length; i += 1) {
      text (introMessage[i], width/2, 100+(i*40));
    }
  }

  //  for other screen messages
  else if (messageCount > 0) {
    if (messageCount < messageDelay) {
      messageCount += 1;
      textAlign(CENTER);
      textSize(32);
      text (message, width/2,40);
    }
    else messageCount = 0;
  }
}

void mouseReleased() {
  /*
    when mouse clicked and released over empty background:
    another image is added to display at point of 
    mouse release if there is an unused image to add

    if released over existing image, remove that image
  */

  //  turn off flag that displays image info
  infoFlag = false;

  //  was relase over image, or empty background
  int zone = identifyZone (mouseX, mouseY);

  //  clicked on zone within a displayed image
  //  so remove that image from display
  if (zone >= 0 && zone < images.length) {
    images[zone].display = 0;
    //  report image removed via message to user
    messageCount = 1;
    message = "Removed: "+images[zone].info;
  }
  //  clicked on background, so add another image
  //  if there is an image that is not yet displayed
  else if (zone == -1) {
    boolean imageAdded = false;
    for (int i = 0; i < images.length; i++) {
      if (images[i].display == 0) {
        images[i].display = 1;
        images[i].x = mouseX;
        images[i].y = mouseY;
        imageAdded = true;
        //  report image added via message to user
        messageCount = 1;
        message = "Added: "+images[i].info;

        break;
      }
    }
    if (imageAdded == false) {
      messageCount = 1;
      message = "all images currently being displayed - unable to add more";
    }
  }
}

int identifyZone (int X, int Y) {
/*
  this function identifies whether
  mouse click-release was in part of screen
  occupied by existing displayed image
  or in unoccupied portion of background
*/
  int zone = -1;   // default: unoccupied background
  for (int i = 0; i < images.length; i++) {
    if (images[i].display == 0) continue;
    float x = images[i].x;
    float y = images[i].y;
    float w = images[i].w;
    float h = images[i].h;
    if (abs(X - x) < w/2 && abs(Y - y) < h/2) {
      //  click-release over a displayed image area
      zone = i;
      break;
    }
  }
  return zone;
}

void keyPressed() {
  if (key == DELETE || key == BACKSPACE) {
    //  clear screen of all images
    background (#199FA2);
    //  and set all images to not be displayed
    for (int i = 0; i < images.length; i++) {
      images[i].display = 0;
    }
  }
  else if (key == 's' || key == 'S') {
    saveFrame("screen-##.jpg");
    saveFrame("screen-##.png");
  }
  else if (key == 'i' || key == 'I') {
    // set all images to not be displayed
    for (int i = 0; i < images.length; i++) images[i].display = 0;
    // and provide info about works of art
    infoFlag = true;
  }
}

void showImageInfo() {
  //  activated by keypress 'i' or 'I', which sets infoFlag = true
  //  deactivated by mouse release
  
  //  for image placement
  int x = width/2-75;
  int y = (height-100)/(images.length-1);
  
  //  for associated descriptive text
  int t_x = width/2-150;
  textAlign(RIGHT);
  textSize(20);

  for (int i = 0; i < images.length; i++) {

    // show each image in sequence
    imageMode (CENTER);
    image (images[i].image, x, y);
    //  surround it with ellipse
    noFill();
    stroke(255,0,0);
    strokeWeight(buffer);
    ellipse (x, y,images[i].w+buffer,images[i].h+buffer);
      
    //  and add associated text
    text(images[i].info, t_x, y-20);

    /*
     adjust placement of next image, moving down screen and
     alternating images between left and right sides of screen
    */
    y += 70;
    if (x == width/2-75) {
      x += 150;
      textAlign(LEFT);
      t_x = width/2+150;
    }
    else {
      x = width/2-75;
      textAlign(RIGHT);
      t_x = width/2-150;
    }
  }
  //  add instructions to exit image info screen
  textAlign(LEFT);
  textSize(20);
  text("click mouse to re-start Floating Images",30,height-30);
  textAlign(RIGHT);
  text("click mouse to re-start Floating Images",width-30,30);
}



////////////////////////////////////////
//  class for floating images

class FloatingImage {

  //////////////////////////////////////
  //  fields for initial Floating Image
  //  passed as PImage, text string, and float dictionary
  PImage image;
  //  description of image
  String info;
  //  display = 0: do not show image
  //  display = 1: show image
  float display;  
  //  x and y are dummy position values, updated by mouse
  //  w and h are width and height of image
  float x, y, w, h;
  //  delta x and y used to control direction and speed of movement
  float delta_x, delta_y;
  //  motion change counter used in FloatingImage.moveImage()
  //  controls frames (time) between change of image motion
  int motionCount;
  //  RGB color controls for surrounding ellipse, in FloatingImage.changeColor()
  //  colorCount controls frames (time) between change of ellipse color
  int R, G, B, colorCount;

  FloatingImage (PImage _image, String _info, FloatDict _dict) {
    image = _image;
    info = _info;
    display = _dict.get("display");
    delta_x = _dict.get("delta x");
    delta_y = _dict.get("delta y");
    x = _dict.get("x");
    y = _dict.get("y");
    w = _dict.get("w");
    h = _dict.get("h");
    // initialize motion and color change counters
    motionCount = 0;
    colorCount = 0;
    //  initial RGB values
    //  changed randomly in changeColor()
    R = 255;
    G = 0;
    B = 0;
  }

  void displayImage() {
    pushMatrix();
    
    //  display image from file centered over x,y coordinates
    translate (x,y);
    imageMode (CENTER);
    image (image, 0, 0);

    //  and surround it with ellipse
    noFill();
    stroke(R,G,B);
    strokeWeight(buffer);
    ellipse (0,0,w+buffer,h+buffer);

    popMatrix();
  }

  void moveImage() {
    motionCount += 1;

    //  move image for next display
    x += delta_x;
    y += delta_y;

    //  if moved to edge of screen, bounce
    //  and reset counter for changing delta values when bounce
    if (x >= width-(buffer+w/2) || x <= buffer+w/2) {
      delta_x = -delta_x;
      motionCount = 0;
    }
    if (y >= height-(buffer+h/2) || y <= buffer+h/2) {
      delta_y = -delta_y;
      motionCount = 0;
    }

    //  when count reaches global motionDelay value
    //  change motion controls for next pass
    if (motionCount > motionDelay) {
      //  change direction and speed of motion
      delta_x = random(-1,2);
      delta_y = random(-2,1);
      //  but never allow delta values be zero
      if( delta_x == 0) delta_x = 0.1;
      if( delta_y == 0) delta_y = 0.1;

      //  reset counter
      motionCount = 0;
    }
  }

  void changeColor() {
    colorCount += 1;
    //  change RGB values for ellipse
    //  when count reaches global colorDelay
    if (colorCount > colorDelay) {
      R = int(random(0,255));
      B = int(random(0,255));
      G = int(random(0,255));
      //  reset counter
      colorCount = 0;
    }
  }
}



