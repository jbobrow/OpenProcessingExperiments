
// how many bubbles
int num_bubbles = 150;

// attributes of the bubbles: x, y, size and color
int[] bubbleX = new int[num_bubbles];
int[] bubbleY = new int[num_bubbles];
int[] bubbleSize = new int[num_bubbles];
color[] bubbleCol = new color[num_bubbles];

void setup() {
  // canvas in the shape of a beer mug
  size(150, 400);
  
  // place all the bubbles offscreen so that
  // they will be randomized on the first draw()
  for(int i = 0; i < bubbleX.length; i++) {
    bubbleY[i] = -40;
  }
}

void draw() {
  // a beery color for the background
  background(#FFD427);
  
  // go through all the bubbles
  for(int i = 0; i < bubbleX.length; i++) {
    // draw the bubble, using the attributes in the array
    fill(bubbleCol[i]);
    noStroke();
    ellipse(bubbleX[i], bubbleY[i], bubbleSize[i], bubbleSize[i]);
    // move the bubble: bigger bubbles move faster
    bubbleY[i]-= bubbleSize[i]/5;
    // if the bullet is ofscreen, pull it down
    // give it a new position, size and color
    if(bubbleY[i] < -30) {
      bubbleY[i] = (int)random(height, height*2);
      bubbleX[i] = (int)random(0, width);
      bubbleSize[i] = (int)random(1, 8);
      bubbleCol[i] = color(255, random(200, 255)); // white, with random transparency
    }
  }
  
  //draw the beer foam last, so it covers up the bubbles on top
  fill(255); stroke(255);
  rect(0, 0, width, 40);
}
