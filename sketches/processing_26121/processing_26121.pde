
// Interactive sketch to play around with Bezier Curves 
// Every click sets a new point for the curve
// Cycles through control points and start/end points 

// BONUS:
// Animate the transitions!

// The arrays containing the current point positions
float px[] = new float[4];
float py[] = new float[4];

// The arrays containing the desired / target point positions
// we will use this array to slowly animate the points in px and py
// over time 
float tx[] = new float[4];
float ty[] = new float[4];

int index = 0;

void setup() {
  size(300, 300);  
  smooth();
}

void draw() {
  background(64);
  stroke(255);
  fill(128);
  
  // draw the curve
  bezier(px[0], py[0], px[1], py[1], px[2], py[2], px[3], py[3]); 
  
  // show the structure of the curve
  rectMode(CENTER);
  noFill();

  stroke(0, 255, 0);
  ellipse(px[0], py[0], 6, 6);  // start and end points
  ellipse(px[3], py[3], 6, 6);

  stroke(128);
  rect(px[1], py[1], 6, 6);  // control points
  rect(px[2], py[2], 6, 6);

  // show the imaginary lines
  line(px[0], py[0], px[1], py[1]);
  line(px[2], py[2], px[3], py[3]);
  
  // ANIMATE -- bring the content of the point arrays closer to the 
  // content of the target arrays
  for (int i=0; i < px.length; i++) {
    // add a fraction of the different between the point and the target
    // on each frame, creating a smooth interpolated animation
    float dx = tx[i] - px[i];
    px[i] += dx * 0.1;
    float dy = ty[i] - py[i];
    py[i] += dy * 0.1; // remember, 0.2 == 20%
  }
  
}

void mousePressed() {
  // instead of updating the point array directly, update the target
  // arrays 
  tx[index] = mouseX;
  ty[index] = mouseY;
  index++;
  if (index >= px.length) index = 0;  
}
