
void setup() {
  size (500,500);
  background (255); //background is white
  colorMode(HSB); //use Hue, saturation, Brightness mode
  smooth();
  
}
void draw() {
// since there is no background, the background does not refresh, but instead draws
  noStroke();
  fill(random (255), 125, 255, 130); //the color of the circles drawn changes because of the random function
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,30,30); // the position of the circle will follow the x and y position of the mouse cursor
}

void mouseDragged() {
  if (mouseButton == LEFT) { // is left button on mouse is clicked then dragged,
    fill (random (mouseX), random (mouseY),255,255); // the saturation of color will depend on the x and y value of mouse
    ellipse (mouseX,mouseY,80,80); 
    fill (random (mouseX), random (mouseY),255,255);
    ellipse (mouseX,mouseY,65,65); 
    fill (random (mouseX), random (mouseY),255,255);
    ellipse (mouseX,mouseY,50,50); // the new circles that are created will follow mouse cursor
  }
  else if (mouseButton == RIGHT) { 
    rectMode (CENTER);
    fill (255,255,255, 50);
    rect (pmouseX ,pmouseY, 10, 10);
  }
  }
void mouseClicked() {
  if (mouseButton == RIGHT) {
    background (255); // the background will clear if right button is clicked
  }
}

