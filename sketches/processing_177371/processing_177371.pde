
// This sketch uses keyboard input, mouse input, and screenshot saving
// This program can create some very abstract pieces of art.
color strokeColor = color(random(255), random(255), random(255));
int strokeWeight = 2;

void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
}

void draw() {
  if(mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
    int radius = mouseX-width/2;
    float angle = PI/circleResolution;
    
    strokeWeight(strokeWeight);
    stroke(strokeColor);
    
    beginShape();
    for(int i = 0; i <= circleResolution; i+=2) {
      float x = circleResolution + cos(angle*i*3) * radius;
      float y = circleResolution + sin(angle*i*3) * radius;
      vertex(x,y);
    }
    endShape();
    popMatrix();
    strokeColor = color(random(255), random(255), random(255));
    strokeWeight = (int)random(2,5);
  }
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key == 'S') saveFrame("crazy_screen.png");
}

