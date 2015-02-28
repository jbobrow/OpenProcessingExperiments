
PImage RyanAndDog;
int brushStroke;


//-----------color slider-----------///


boolean draggingR = false;
boolean draggingG = false;
boolean draggingB = false;

boolean rollover = false;

float w = 12;
float h = 10;

//--------R-------//
float x1 = 370;
float y1 = 50;
float sliderStart1 = 370;
float sliderEnd1 = 480;
float offsetX1 = 0;

//--------G-------//
float x2 = 370;
float y2= 100;
float sliderStart2 = 370;
float sliderEnd2 = 480;
float offsetX2 = 0;

//--------B-------//
float x3 = 370;
float y3 = 150;
float sliderStart3 = 370;
float sliderEnd3 = 480;
float offsetX3 = 0;




void setup() {
  size(500, 450);
  background(255);


  //------image---------//
  // Images must be in the "data" directory to load correctly
  RyanAndDog = loadImage("RyanAndDog.jpg");

  image(RyanAndDog, 0, 0);
}


void draw() {


  //--------toolbar---------//
  noStroke();
  fill(230); 
  rect(350, 0, 150, 600);



  //-------slider-----//


  fill(0);
  textSize(12);
  text("R", 355, 58);
  text("G", 355, 108);
  text("B", 355, 158);  
  
  String s = "Press A for bigger brush & B for even bigger brush";
  fill(50);
  text(s, 368, 289, 100, 100);  // Text wraps within text box


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
  strokeWeight(1);
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

  //------color-----//
  noStroke();
  fill(r, g, b);
  rect (370, 190, 110, 50);
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

void mouseDragged() {

  strokeWeight(brushStroke);


  float r = map(x1, sliderStart1, sliderEnd1-w, 0, 255);
  float g = map(x2, sliderStart2, sliderEnd2-w, 0, 255);
  float b = map(x3, sliderStart3, sliderEnd3-w, 0, 255);
  stroke(r, g, b, 50);
  line(pmouseX, pmouseY, mouseX, mouseY);
}


void keyPressed() {
  if (key == 'a') {
    brushStroke = 5;
  }

  if (key == 'b') {
    brushStroke = 10;
  }
}



