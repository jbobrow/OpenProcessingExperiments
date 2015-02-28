
PImage theSection;
boolean dragging = true;

int sliderX = 200;
int sliderY = 700;
float imgSizeX = 300;
float imgSizeY = 200;

color sliderBlue = color(12, 234, 229);

void setup() {
  size(800, 800);
  smooth();
  theSection = loadImage("TheSection.JPG");
}

void draw() {
  background(0);
  noStroke();
  noFill();
  rectMode(CENTER);
  image(theSection, 200, 200, imgSizeX, imgSizeY); // Original Dimensions 2576 × 1932
  dragging = dragging;

  stroke(255);
  strokeWeight(3);
  line(0, 700, width, 700);
  fill(sliderBlue);
  strokeWeight(1);
  rect(sliderX, sliderY, 100, 40);
  
  
}

void mouseDragged() {
  if (mouseX > sliderX - 50 && mouseX < sliderX + 50 && mouseY > sliderY - 20 && mouseY < sliderY +20 && dragging) {
    sliderX = mouseX;
    sliderX = constrain(sliderX, 100, 700);

    if (dragging) {
      imgSizeX = mouseX;
      imgSizeY = mouseX -100;
    }
  }
}
void mousePressed() {
  dragging = true;
}



