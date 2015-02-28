
// Open Processing : openprocessing.org

/* Export as a Java applet via 
Menu Tools > Add tool... > AppletMaker > install */

// Sample project
import ddf.minim.*;

/*
MOUSE
position x : length
position y : thickness and number of lines to be drawn
drag : draw

KEYS
1-3 : stroke color (with sound cue)
del, backspace : erase
*/

// Global variables
Minim minim;
AudioSample bottle_breaking;
color strokeColor = color(0, 10);

// setup()
void setup() {
  size(720, 720);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360); 
  minim = new Minim(this);
  bottle_breaking = minim.loadSample("bottle-break-01.wav");
}


// draw()
void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    // map(value to be mapped, start1, stop1, start2, stop2)
    int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
    int radius = mouseX-width/2; // not larger than the canvas area
    float angle = TWO_PI/circleResolution; // orientaion of the trigo circle
    
    // style
    strokeWeight(2);
    stroke(strokeColor);
    
    beginShape();
    // everyx time i increases, the angle of the trigo functions increases
    // stores into 2 values
    // which in turn will determine how many polygones will be drawn
    // by the vertex function
    for (int i=0; i<=circleResolution; i++) {
       float x = 0 + cos(angle*i) * radius;
       float y = 0 + sin(angle*i) * radius;
       vertex(x, y);
    }
    endShape();
    popMatrix();
  }
}


// keyPressed()

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
 
  switch(key) {
    case '1':
      bottle_breaking.trigger();
      strokeColor = color(0, 10);
      break;
    case '2':
      bottle_breaking.trigger();
      strokeColor = color(192, 100, 64, 10);
      break;
    case '3':
      bottle_breaking.trigger();
      strokeColor = color(52, 100, 71, 10);
      break;
  } 
}

