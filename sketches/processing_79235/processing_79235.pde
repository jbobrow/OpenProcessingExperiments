
int blink = -300; //sets the "eyelid" to top so its not visible
float x;
float y;
float easing = 0.05;
 
void setup() { // canvas size
  size(800, 300);
  noStroke(); 
}
 
void draw() {
  background(204,140,177); // canvas color
   
  float targetX = mouseX; // easing while tracking mouse
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
   
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
   
   
  beginShape();//this is the left eye
  fill(#ffffff);
  ellipse(x, y, 60, 60); // eyeball location and size
  fill(#000000);// pupil color
  ellipse(x+mouseX/30, y+mouseY/30, 20, 20); // pupil location and size
  endShape();
    
  
  beginShape();//this is the right eye
  fill(#ffffff);
  ellipse(x+80, y, 60, 60);// eyeball location and size
  fill(#000000);// pupil color
  ellipse(x+80+mouseX/30, y+mouseY/30, 20, 20);// pupil location and size
  endShape();
 
 
  // function that makes the eyes blink when clicking
  fill(204,140,177);
  rectMode(CORNER);
  rect (0, blink, 800, 300);
  if ((mousePressed == true) && (blink<20)) {
    blink+=20;
  }
  else if (blink>-300)
  {
    blink-=20;
  }
}


