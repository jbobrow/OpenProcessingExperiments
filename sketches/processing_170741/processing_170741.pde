
/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */
 int myState = 0;
 int counter = 6 * 60;
 PImage will;
 
void setup() {
  size(1920,1080);
  background(102);
  will = loadImage("o-WILL-FERRELL-facebook.jpg");
}

void draw() {
  switch(myState){
    case 0:
    // Call the variableEllipse() method and send it the
    // parameters for the current mouse position
    // and the previous mouse position
    variableRect(mouseY, mouseX, pmouseX, pmouseY);
    counter--;
    if(counter == 0){
      myState = 1;
    }
    fill(255);
    text("After about 7 seconds of messing around this gets really cool!", 10, 10);
    //variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
    break;
    
    case 1:
    image(will, 200, 0);
    text("Stay classy, San Diego", 240, 50);
    break;
  }
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableRect(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  noStroke();
  fill(random(255),random(255),random(255));
 if (random(2) > 1) {
   rect(x, y,speed,speed);
 }
 else {
   ellipse(x, y, speed, speed);
 }
}


