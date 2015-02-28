
boolean inCopyMode = true;
boolean inPasteMode = false;

int startMouseX = -1;
int startMouseY = -1;
int endMouseX = -1;
int endMouseY = -1;
int stampWidth = -1;
int stampHeight = -1;
int positionToCopyFrom;
int positionToCopyTo;

String fileName = "Photo_";
int saveCounter = 0;
String fileExtension = ".jpeg";

PImage photo;
PImage stamp; //the new image

void setup () {
  size(600, 400);
  photo = loadImage("photo.jpeg");
}


void draw() {
  image(photo, 0, 0, width, height);


  if (inCopyMode==true) {
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(startMouseX, startMouseY, stampWidth, stampHeight);

    text("Copy mode", 30, 30);
    textSize(20);
    fill(0, 102, 153);
  } 
  else if (inPasteMode == true) {
    image(stamp, mouseX, mouseY);

    text("Paste mode", 30, 30);
    textSize(20);
    fill(0, 102, 153);
  }
}


void keyPressed() {
  if (key == 'c' || key == 'C') {
    inCopyMode = true;
    inPasteMode = false;
  } 
  else if (key == 'v' || key == 'V') {
    inPasteMode = true;
    inCopyMode = false;
  } 
  else if (key == 's' || key == 'S') {
    
    String finalFileName = fileName + saveCounter + fileExtension;
    //how to save into data folder? data/?
    save(finalFileName);
    saveCounter++;
    
  } 
  else if (key == 'r' || key == 'R') {
    photo = loadImage("photo.jpg");
    image(photo, 0, 0, width, height);
    inCopyMode = true;
  }

  //updating the background image, so theres no white lines in paste mode
  image(photo, 0, 0, width, height);
  //pasting the duplicated pixels into a new image ontop of original
  stamp = createImage(stampWidth, stampHeight, RGB); 
  loadPixels();
  updatePixels();
  //making sure the selections include the newest pixels (refresh)

  stamp.loadPixels();
  //copying all the pixels, use for loop


  int stampY = 0;
  for (int j = startMouseY; j < startMouseY+stampHeight; j++) {
    int stampX = 0;
    for (int i = startMouseX; i < startMouseX+stampWidth; i++) {
      //position in array, the coordinates on the big image  
      int positionToCopyFrom = (j*width)+i;
      //position in the new layer (0,0)
      //we dont know these coordinates yet
      int positionToCopyTo =  (stampY*stampWidth)+stampX;

      stamp.pixels[positionToCopyTo] = pixels[positionToCopyFrom];

      stampX++;
    }
    stampY++;
  }

  //pastes the pixels onto the image
  stamp.updatePixels();
}

void mousePressed() {
  startMouseX = mouseX;
  startMouseY = mouseY;

  stampWidth = -1;
  stampHeight= -1;
}

void mouseDragged() {
  endMouseX = mouseX;
  endMouseY = mouseY;

  stampWidth = endMouseX-startMouseX;
  stampHeight= endMouseY-startMouseY;
}

void mouseReleased() {
  if (inCopyMode) {
    endMouseX = mouseX;
    endMouseY = mouseY;

    stampWidth = endMouseX-startMouseX;
    stampHeight= endMouseY-startMouseY;
  } 
  else {
    //saving both images together
    image(photo, 0, 0);
    image(stamp, mouseX, mouseY);
    //saving both into the original image, leaving a trace of copied areas
    photo = get();
  }
} 



