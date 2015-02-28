
// Grafitti Writer
// By Mr. Lee
// This program will allow the user to draw in a grafitti style
// tag by dragging the mouse. It simulates the paint droplets


color sprayColor; // Colour of the spray
int sprayWidth; // The width of the spray
int sprayTravel; // The distance travelled from one mouse 
                 // move to another.
final int MAX_SPRAY_WIDTH = 50; // Maximum spray width [Constant]
final int MIN_SPRAY_WIDTH  = 1; // Minimum spray width [Constant]

// Set the default values
void setup() {
// Uncomment this for desktop version.
//  size(screen.width, screen.height);
  size(320, 240);
  colorMode(HSB);
  smooth();  
  reset();
}

// Each time the draw event is called, calculate the distance travelled
// The distance travelled will define the width of the spray.
// However, only do this every 4th frame to enable a smoother transition.
void draw() {
  if (frameCount % 4 == 0) {
    if (mousePressed) {
      sprayTravel = floor(dist(mouseX, mouseY, pmouseX, pmouseY));
      if (sprayTravel >= 1) {
        int oldWidth = sprayWidth;        
        sprayWidth = (oldWidth > sprayTravel ? sprayWidth-1 : sprayWidth+1);
        sprayWidth = constrain(sprayWidth, MIN_SPRAY_WIDTH, MAX_SPRAY_WIDTH);
      }
    }
  }
}

// Procedure to reset the background, spray width, and any other
// default settings.
void reset() {
  background(192);
  sprayColor = color(random(255), 255, random(128));  
  sprayWidth = 10;
  strokeCap(ROUND);
  strokeJoin(ROUND);
  stroke(sprayColor);
}

// While the mouse is dragged, create a line connecting the two points.
// Add random events to add spray droplets and paint drippings.
void mouseDragged() {
  stroke(sprayColor);      
  strokeWeight(sprayWidth);
  line(mouseX, mouseY, pmouseX, pmouseY);
  
  if (random(1) < 0.1) 
  {
    drip();
  }
  
  if (random(1) > 0.5) {
    spray();
  }
}

void mouseReleased() {
  drip();
  spray();
}

// Everytime the mouse is released add droplets and drippings.
void mousePressed() {
  drip();
  spray();
}

// Drip length is randomized. Use random opacity to create a fade like
// effect for the drippings.
void drip() {
    int dripLength = ceil(random(sprayWidth, 10 * sprayWidth));
    int dripWidth  = floor(random(sprayWidth/10, sprayWidth/2));
    strokeWeight(dripWidth);
    stroke(sprayColor, random(128, 255));
    line(mouseX, mouseY, mouseX, mouseY + dripLength);  
}

// Randomly create droplets, as well as fade them to create the spray
// effect.
void spray() {
  float spotX = mouseX + 6.0 * random(-sprayWidth, sprayWidth);
  float spotY = mouseY + 6.0 * random(-sprayWidth, sprayWidth);
  int spotWidth = floor(random(sprayWidth / 4, sprayWidth));
  fill(sprayColor, random(64, 204));
  strokeWeight(random(2));
  ellipse(spotX, spotY, spotWidth, spotWidth);
}

// keyboard controls.
void keyPressed() {
  switch(key) {
    case 'r' : 
      reset();
      break;
    case 'c' : 
      sprayColor = color(random(255), 255, random(128));
      break;
    case 'q' : 
      exit();
      break;
    case 's' :
      save("spray.png");
      break;
  }
}                                               
