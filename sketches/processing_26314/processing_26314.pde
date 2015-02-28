
int page = 1; // Set starting page to page 1
// Variable to store font
PFont font;

// Trace images
PImage[] tImg = new PImage[12];
// Complete images
PImage[] cImg = new PImage[12];

char currentTrace; // Current image
char currentComplete; 

void setup() { 
  size(1024, 780);
  smooth();
  background(255);
  frameRate(123);

  trace = loadImage("trace.png");
  traceRoll = loadImage("trace_roll.png");
  complete = loadImage("complete.png");
  completeRoll = loadImage("complete_roll.png");
  font = loadFont("HelveticaNeue-Light-100.vlw");

  for(int i=0; i<tImg.length; i++) { 
    tImg[i] = loadImage("img" + i + ".jpg"); // Load trace images
  }

  for(int i=0; i<cImg.length; i++) { 
    cImg[i] = loadImage("pic" + i + ".jpg"); // Load complete images
  }
}

void draw() { 
  if (page == 1)
    pageOne();
  else if (page == 2)
    pageTwo();
  else if (page == 3)
    pageThree();
  else if (page == 4)
    pageFour();
  else if (page == 5)
    pageFive();
}

// overButton logic function
boolean overButton (int xPos, int yPos, int width, int height) {
  if (mouseX >= xPos && mouseX <= xPos+width && 
    mouseY >= yPos && mouseY <= yPos+height) { 
    return true;
  } 
  else { 
    return false;
  }
}

// Navigate pages when button is pressed
void mousePressed() {
  /*-----Page 1-----*/
  if(page==1) {
    if (overButton (5, 5, 80, 80)) 
      page=2;
  } // end page 1

  /*-----Page 2-----*/
  if(page==2) {
    if (overButton (traceX, traceY, trace.width, trace.height)) 
      page=3;
    else if (overButton (complX, complY, complete.width, complete.height)) 
      page=5;
  } // end page 2
  /*-----Page 4-----*/
  if (page==4) {
    if (overButton (backX, backY, backW, backH)) 
      page=2;
  } // end page 4
}

void keyPressed() {
  /*-----Page 3-----*/
  if (page==3) {
    // Trace buttons
    if(key=='1') {
      image(tImg[0],0,0);
      currentTrace = '1';
    }
    else if(key=='2') {
      image(tImg[1],0,0);
      currentTrace = '2';
    } 
    else if(key=='3') {
      image(tImg[2],0,0);
      currentTrace = '3';
    }
    else if(key=='4') {
      image(tImg[3],0,0);
      currentTrace = '4';
    }
    else if(key=='5') {
      image(tImg[4],0,0);
      currentTrace = '5';
    }
    else if(key=='6') {
      image(tImg[5],0,0);
      currentTrace = '6';
    }
    else if(key=='7') {
      image(tImg[6],0,0);
      currentTrace = '7';
    }
    else if(key=='8') {
      image(tImg[7],0,0);
      currentTrace = '8';
    }
    else if(key=='9') {
      image(tImg[8],0,0);
      currentTrace = '9';
    }
    else if(key=='0') {
      image(tImg[9],0,0);
      currentTrace = '0';
    }
    else if(key=='-') {
      image(tImg[10],0,0);
      currentTrace = '_';
    }
    else if(key=='=') {
      image(tImg[11],0,0);
      currentTrace = '=';
    }

    page=4;
  } // end page 3

  /*----Page 4-----*/
  if (page==4) {
    if(key=='d' || key=='D')
      background(255);
  }

  /*-----Page 5-----*/
  if (page==5) {
    // Complete buttons
    if(key=='1') {
      image(cImg[0],0,0);
      currentComplete = '1';
    }
    else if(key=='2') {
      image(cImg[1],0,0);
      currentComplete = '2';
    }
    else if(key=='3') {
      image(cImg[2],0,0);
      currentComplete = '3';
    }
    else if(key=='4') {
      image(cImg[3],0,0);
      currentComplete = '4';
    }
    else if(key=='5') {
      image(cImg[4],0,0);
      currentComplete = '5';
    }
    else if(key=='6') {
      image(cImg[5],0,0);
      currentComplete = '6';
    }
    else if(key=='7') {
      image(cImg[6],0,0);
      currentComplete = '7';
    }
    else if(key=='8') {
      image(cImg[7],0,0);
      currentComplete = '8';
    }
    else if(key=='9') {
      image(cImg[8],0,0);
      currentComplete = '9';
    }
    else if(key=='0') {
      image(cImg[9],0,0);
      currentComplete = '0';
    }
    else if(key=='-') {
      image(cImg[10],0,0); 
      currentComplete = '-';
    }
    else if(key=='=') {
      image(cImg[11],0,0);
      currentComplete = '=';
    }

    page=4;
  } // end page 5
}


