
// Make old fashined 'Kratzbilder'

// key strokes
// 's' - save canvas as image

// START/GRADIENT MODE
// 'g'         - new random gradient
// 'p'         - go to paint mode
// mouse click - take mouseY as gradient horizon

// PAINT MODE
// mouse-click drag - scratch/paint 
// r, DELETE        go to gradient mode

/// Initialize values
int hue = 1000;
// aet initial random hue for gradient
float randomHue = random(0, hue);
int white = #ffffff;
// Start with Start-Status
String status = "Start";

// Variable hold the current horizon
float horizont;

void setup() {
  size(800, 600);
  background(white);
  colorMode(HSB, hue, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  // we don't loop at Start
  noLoop();
  
}

void draw() {
 // different states of the script
  if (status == "Start") {  // just starting
    background(white);
  }
  else {
    if (status == "Gradient") {  // gradient Mode
      background(0);
      drawGradient2();
      noLoop();  // dont't loop in gradient mode
    }
    else {
      if (status == "Paint") { // paint mode
        if (mousePressed) { // scratch if mouse pressed
          scatch();
        }
      }
    }
  }
}

void scatch() {
  int posY = mouseY;
  int posX = mouseX;
  // 'scratch' the black with one pint and to ellipes nearby the mouse pointer
  fill( getColor(posY -1 ), 100, 100); // pick the color for point 
  ellipse(posX, posY -1, 2, 2);
  fill( getColor(posY -3 ), 100, 100); // pick the color for ellipses
  ellipse(posX -3, posY - 3, 1, 2);
  ellipse(posX +3, posY - 3, 1, 2);
}

void drawGradient2() {
  // draw the gradient lines
  for (int y = 0; y <=height; y++) {
    float col = getColor(y); // get the color for the line
    stroke(col, 100, 100 ); 
    line(0, y, width, y);
  }
}

float getColor(int y) { //
  float distance = 0;  
  if (y >= horizont) { // calulate distance of line from the horizon 
    distance = y - horizont;
  }
  else {
    distance = horizont -y;
  }
  // Calculate the hue with current random hue an distance 
  // taking modulo to limit value in the hue range 
  float aktHue = (randomHue + distance) % hue;
  return aktHue;
}

void setRandomGradient() { // set hue value randomly
  randomHue = random(0, hue);
}

// Keyboard controls
void keyPressed() {
  switch(key) {
  case 'g':
  case 'G' :
    if (status == "Gradient") { // 'g' - new random gradient
      setRandomGradient();
      horizont = mouseY;
      redraw();
    }
    break;
  case 'p':
  case 'P':   //  'p' - go to paint mode
    if (status == "Gradient") { 
      background(0); 
      noStroke();
      status = "Paint";
      loop();
    }
    break;
  case DELETE :
  case 'r':
  case 'R':   // r, DELETE go to gradient mode
    if (status == "Paint") {
      status = "Gradient";
      redraw();
    }
    break;
  case 's':  // 's' - save canvas as image
  case 'S':
    saveFrame("image_##.png");
    break;
  }
}

// mouse controls
void mousePressed() {
  if (status == "Gradient" || status == "Start") {  // set new horizon if mouse pressed at start or in gradient mode 
    status = "Gradient";
    horizont = mouseY;
    redraw();
  }
}

