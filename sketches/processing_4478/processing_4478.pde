
/**
 * Animator.
 * 
 * Click and drag to draw and start the program.
 * 
 * A simple animation tool that displays a continuous cycle of
 * twenty-four images. Each image is displayed for 30 milliseconds 
 * to create animation. While each image is displayed, it’s possible 
 * to draw directly into it by pressing the mouse and moving the cursor. 
 * 
 */

int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;

void setup() 
{
  size(400, 400);
  strokeWeight(12);
  smooth();
  background(148,195,198);
   
color box1 = color(240, 5, 91);  
color box2 = color(86, 224, 223);  
color box3 = color(94, 245, 62);  
color box4 = color(230, 255, 72);   
  
fill(box3);  
rect(0, 200, 200, 200);  
fill(box1);  
rect(200, 0, 200, 200);  
fill(box2);  
rect(0, 0, 200, 200);  
fill(box4);  
rect(200, 200, 200, 200); 

for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void draw() 
{
  int currentTime = millis();
  if (currentTime > lastTime+30) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed == true) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void nextFrame() 
{
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
}


