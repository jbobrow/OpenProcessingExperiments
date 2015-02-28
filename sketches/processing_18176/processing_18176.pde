
String path = "";///wp-content/sketches/pancakes/";

int totalPancakes = 6;
PImage[] pancakes; // an array of pancake images
PImage title;

int currentX;
int currentY;
float currentScale;
int currentTargetCakes = -1;
int currentCake = 0;

boolean isTitle = false;
int titleCounter = 0;

void setup() {
  size(640, 320);  // 640 x 320 stage
  smooth();         // enable anti-aliasing
  frameRate(30);
  
  
  title = loadImage(path+"title.png"); // load the title card
  pancakes = new PImage[totalPancakes];  // init the pancake array
  for(int i = 0; i < totalPancakes; i++) {  
    pancakes[i] = loadImage(path+"pancake_"+i+".png"); // load the pancake images
  }

  reset(); // reset everything
}

void draw() {

  if(!isTitle) { // are we in the title mode, or stackin'?
    if(currentCake >= currentTargetCakes) { // stack is high enough?

      if(currentY < height) { // have we filled the page?
        currentX = int(random(0,width));
        currentScale = map(currentY, height, 0, 1, .15);
        currentY += random(2,currentScale*60);
        currentTargetCakes = int(random(2, 30));
        currentCake = 0;
      } 
      else {
        isTitle = true;  // we are in the title mode
        image(title, 0,0); // draw the title card
        return; // return, no need to keep drawing
      }
    } 

    // draw the pancakes
    pushMatrix(); 
    translate(currentX,currentY);
    scale(currentScale,currentScale);
    image(pancakes[int(random(0,totalPancakes))],random(-5,5),-currentCake*6); 
    popMatrix();

    currentCake++; // increment the pancake counter
  } 
  else {
    // we are in the title sequence!
    titleCounter++; // increment the title counter
    if(titleCounter > 200) { // "time" is up, move back stack 'em
      isTitle = false; // title is no longer up
      reset(); // reset everything
    }
    return;  // nothing to draw, so return
  }
}

void reset() {
  background(255); // reset the ba
  currentY = 0;
  currentCake = 0;
  currentTargetCakes = -1;

  titleCounter = 0; // and for later
}



