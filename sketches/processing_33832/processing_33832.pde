
/*

  Liz Rutledge
  In-Class Example Counter + Screen Captures
  August 12, 2011

*/

// variable to log the last time the timer event was triggered
int lastSavedTime;
int timeInterval;
int timer=0;

//to reprint captured images on screen (ignore if just looking at timer)
int numScreens = 6;

// declaring array to access our screengrabs
PImage[] screengrab = new PImage[numScreens];

//to keep track of stuff (in this case, image captures)
int imgCounter = 0;

//timer to see how many times timer event has been triggered
int timeCounter = 0;

//initial background color
int bg = 0;

void setup() {
  size(500, 400);
  
  //initiating first timer marked (millis() is equal to the time elapsed since beginning of sketch)
  lastSavedTime = millis();
  timeInterval = 1294;
}

void draw() {
  //  println(millis());
  //  background(bg);
  
doStuff();
  
}


void mouseReleased() {
  // saveFrame("frame-####.jpg"); 
  //save screengrab to data folder as "image0.jpg", "image1.jpg" etc
  save("data/image" + imgCounter + ".jpg");

  //load image into screengrab array
  screengrab[imgCounter] = loadImage("image" + imgCounter + ".jpg");
  
  //resize image to number of screens we want across so will fit when tiled 
  screengrab[imgCounter].resize(width/numScreens, height/numScreens);
  
  //print the last captured image just to the left of the last one
  image(screengrab[imgCounter], (width/numScreens)*imgCounter, 0);

  //increment the counter to get ready to save another image
  imgCounter++;
}

void doStuff() {
  ellipse(150, height-150, 300, 300);
  timer = millis() - lastSavedTime;
  if ( timer > timeInterval) {
    if (bg <= 255-20) {

      bg += 20;
      timeCounter ++;


      println(timeCounter);
    }
    else {
      bg = 0;
    }
    println(bg);
    //reset the timer
    lastSavedTime = millis();
  }
}




