
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
 
int num = 80;
float mx[] = new float[num];
float my[] = new float[num];

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  colorMode(HSB);
  frameRate(30);
}

void draw() {
  background(255); 
  int which = frameCount % num;
  mx[which] = mouseX;
  my[which] = mouseY;
  
  for (int i = 0; i < num; i++) {

    int index = (which+1 + i) % num;
    fill(random(0,230),170,200,50); 
    ellipse(mx[index], my[index], i/2, i/2);
  }
}

