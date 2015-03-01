
int quantity = 600;
float [] xPosition = new float[quantity];
float [] yPosition = new float[quantity];
int [] flakeSize = new int[quantity];
int [] direction = new int[quantity];
int minFlakeSize = 1;
int maxFlakeSize = 5;

void setup() {
  
  // Basic setup
  
  size(1280, 720);
  frameRate(30);
  noStroke();
  smooth();
  rectMode(CORNERS);
  
  //The for loop is to assign variables to the current i value
  
  for(int i = 0; i < quantity; i++) {
    flakeSize[i] = round(random(minFlakeSize, maxFlakeSize));
    xPosition[i] = random( 0, width);
    yPosition[i] = random(0, height);
    direction[i] = round(random(0, 1));
  }
  
}

void draw() {
  
  background(200, 200, 255);
  
  // This rect is the snow block
  
  rect(0, 660, 1280, 720);
  
  // The for loop that houses all of the movement among the snowflakes
  
  for(int i = 0; i < xPosition.length; i++) {
    
    // Change X based on mouse movement
    
    xPosition[i] = xPosition[i] +(mouseX-640)/200;
    
    // Draw the ellipse
    
    ellipse(xPosition[i], yPosition[i], flakeSize[i], flakeSize[i]);
    
    fill(255);
    ellipse(1000, 640, 60, 60);
    ellipse(1000, 600, 40, 40);
    fill(0);
    ellipse(1000, 650, 5, 5);
    ellipse(1000, 640, 5, 5);
    ellipse(1000, 630, 5, 5);
    ellipse(1005, 595, 5, 5);
    ellipse(995, 595, 5, 5);
    fill(255, 127, 0);
    ellipse(1000, 600, 7, 7);
    fill(255);
    /*
    Not sure what this is, doesn't prove to do anything with my alterations
    
    if(direction[i] == 0) {
      xPosition[i] += map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    } else {
      xPosition[i] -= map(flakeSize[i], minFlakeSize, maxFlakeSize, .1, .5);
    }
    */
    
    yPosition[i] += flakeSize[i] + direction[i]; 
    
    // If x pos is way off to the right, x pos is way off to the left, or if y pos is off the screen, then set the x position to anywhere and the y to the top.
    
    if(xPosition[i] > width + flakeSize[i] || xPosition[i] < -flakeSize[i] || yPosition[i] > height + flakeSize[i]) {
      xPosition[i] = random(0, width);
      yPosition[i] = -flakeSize[i];
    }
    
    
  }
  
}


