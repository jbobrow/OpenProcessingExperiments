
/**
 * Storing Input. 
 * 
 * Move the mouse across the screen to change the position
 * of the circles. The positions of the mouse are recorded
 * into an array and played back every frame. Between each
 * frame, the newest value are added to the end of each array
 * and the oldest value is deleted. 
 * 
 * Updated 27 February 2010.
 */
 
int num = 100;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

void draw() {
  background(255); 
  fill(130,10); 
  
  // Cycle through the array, using a different entry on each frame. 
  // Using modulo (%) like this is faster than moving all the values over.
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i+=5) {
    // which+1 is the smallest (the oldest in the array)
    int index = (which+1 + i) % num;
    ellipse(mx[index], my[index], i/1, i/1);
  }
}

