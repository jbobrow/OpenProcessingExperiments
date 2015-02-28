
import ddf.minim.*;
Minim minim;
AudioSample sticks;

void setup() {
  size(1280, 720);
  minim = new Minim(this);
  sticks = minim.loadSample("sticks.mp3");
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  background(mouseY/2, 100, 100);
  drawCircle(width/2, height/2, 250);
}

void drawCircle(float x, float y, float radius) {
  noFill();
  stroke(200);
  ellipse(x, y, radius, radius);
  if (radius > 100) {
    // Four circles! left right, up and down
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
     }
}

//this method fires the audio sample on mouse drag
void mouseDragged(){
   sticks.trigger();
}

//This method uses the 's' and 'S' character key
//to take a .png screenshot of the current state of the 
//file
void keyReleased(){ 
  if(key == 's' || key == 'S') saveFrame("screenshot.png"); 
}

