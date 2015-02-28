
void setup() {
  size(640, 480);
  background(255);
  smooth();
  noStroke();
}

int counter = 1;

void draw() {
  
  // selector
  fill(255);
  strokeWeight(2);
  stroke(0);
  changeSelector();
  
  // load font
  PFont font;
  font = loadFont("Silkscreen-12.vlw"); 
  textFont(font); 
  fill(0);
  text("click the right mouse button to select the color -->", 10, 25); 
  
  // black brush
  noStroke();
  fill(0);
  ellipse(500, 20, 14, 14);
  
  // red brush
  noStroke();
  fill(255, 0, 0);
  ellipse(530, 20, 14, 14);
  
  // green brush
  noStroke();
  fill(0, 255, 0);
  ellipse(560, 20, 14, 14);
  
  // blue brush
  noStroke();
  fill(0, 0, 255);
  ellipse(590, 20, 14, 14);
  
  // white brush
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(620, 20, 13, 13);
  
  // draw
  changeColor();
  cursor(HAND);
  strokeWeight(14);
  if(mousePressed && mouseButton==LEFT && mouseY > 40) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  } 
}
void changeColor() {
  if (counter==1) {
    stroke(0);
  } else if (counter==2) {
    stroke(255, 0, 0);
  } else if (counter==3) {
    stroke(0, 255, 0);
  } else if (counter==4) {
    stroke(0, 0, 255);
  } else if (counter==5) {
    stroke(255);
  }
}

void changeSelector() {
  if (counter==1) {
    rect(0, 0, width, 40);
    fill(255);
    ellipse(500, 20, 20, 20);
  } else if (counter==2) {
    rect(0, 0, width, 40);
    fill(255);
    ellipse(530, 20, 20, 20);
  } else if (counter==3) {
    rect(0, 0, width, 40);
    fill(255);
    ellipse(560, 20, 20, 20);
  } else if (counter==4) {
    rect(0, 0, width, 40);
    fill(255);
    ellipse(590, 20, 20, 20);
  } else if (counter==5) {
    rect(0, 0, width, 40);
    fill(255);
    ellipse(620, 20, 20, 20);
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    counter+=1;
    if (counter >= 6) {
      counter = 1;
    }
  } 
}


