
boolean draggingR = false;
boolean draggingG = false;
boolean draggingB = false;

boolean rollover = false;

float w = 10;
float h = 10;

//slider1 - R//
float x1 = 200;
float y1 = 50;
float sliderStart1 = 200;
float sliderEnd1 = 400;
float offsetX1 = 0;

//slider2 - G//
float x2 = 200;
float y2= 100;
float sliderStart2 = 200;
float sliderEnd2 = 400;
float offsetX2 = 0;

//slider1 - B//
float x3 = 200;
float y3 = 150;
float sliderStart3 = 200;
float sliderEnd3 = 400;
float offsetX3 = 0;

void setup() {
  size(600, 500);
  smooth();
}


void draw() {
  background(255);
  fill(0);
  text("R",150,58);
  text("G",150,108);
  text("B",150,158);

  //is it being dragged?
  if (draggingR) {
    x1 = mouseX + offsetX1;
  }

  if (draggingG) {
    x2 = mouseX + offsetX2;
  }

  if (draggingB) {
    x3 = mouseX + offsetX3;
  }

  //rectangle
  x1 = constrain (x1, sliderStart1, sliderEnd1-w);
  x2 = constrain (x2, sliderStart2, sliderEnd2-w);
  x3 = constrain (x3, sliderStart3, sliderEnd3-w);

  //line for sliders 
  stroke(100);
  line(sliderStart1, y1+h/2, sliderEnd1, y1+h/2); //r

  line(sliderStart2, y2+h/2, sliderEnd2, y2+h/2); //g

  line(sliderStart3, y3+h/2, sliderEnd3, y3+h/2); //b

  //fill according to state(R or G or B
  if (draggingR || draggingG || draggingB) {
    noStroke();
    fill(0);
  } 
  else {
    noStroke();
    fill(175);
  }

  rect(x1, y1, w, h);
  rect(x2, y2, w, h);
  rect(x3, y3, w, h);

  float r = map(x1, sliderStart1, sliderEnd1-w, 0, 255);
  float g = map(x2, sliderStart2, sliderEnd2-w, 0, 255);
  float b = map(x3, sliderStart3, sliderEnd3-w, 0, 255);

  noStroke();
  fill(r, g, b);
  rect (200, 250, 200, 200);
}

void mousePressed() {
  if (mouseX > x1 && mouseX < x1 + w && mouseY> y1 && mouseY < y1+h) {
    draggingR = true;
    offsetX1 = x1 - mouseX;
  }

  if (mouseX > x2 && mouseX < x2 + w && mouseY> y2 && mouseY < y2+h) {
    draggingG = true;
    offsetX2 = x2 - mouseX;
  }

  if (mouseX > x3 && mouseX < x3 + w && mouseY> y3 && mouseY < y3+h) {
    draggingB = true;
    offsetX3 = x3 - mouseX;
  }
  
  println("(x,y):"+ mouseX +"," + mouseY);
}

void mouseReleased() {
  // Stop dragging
  draggingR = false;
  draggingG = false;
  draggingB = false;
}



