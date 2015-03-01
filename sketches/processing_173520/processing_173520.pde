
PImage img;
float rotationSpeed = TWO_PI/240.0;

void setup() {
  frameRate(60);
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  imageMode(CENTER);
}

void draw() {
  background(0, 0, 100);
  translate(width/2, height/2);
  rotate(rotationSpeed);

  if (img!=null) {
    image(img, 0, 0);
  }

  fadeToWhite();

  if (mousePressed) {
    float weight = map(sin(frameCount*TWO_PI/72.0), -1, 1, 1, 50) ;
    strokeWeight(weight);

    int hue = frameCount%360;
    stroke(hue, 50, 90);

    float preMouseX = (pmouseX-width/2)*cos(rotationSpeed) - (pmouseY-height/2)*sin(rotationSpeed);
    float preMouseY = (pmouseX-width/2)*sin(rotationSpeed) + (pmouseY-height/2)*cos(rotationSpeed); 
    line(preMouseX, preMouseY, (mouseX-width/2), (mouseY-height/2));
  }

  img = get(0, 0, width, height);
}

void fadeToWhite() {
  noStroke();
  fill(0, 0, 100, 1);
  rect(-width/2, -height/2, width, height);
}
