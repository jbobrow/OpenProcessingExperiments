
// Steering Law

PFont poopfont;

float mx;
float my;
float r = 20;
float easing = 0.05;

int radius = 24;
int edge = 100;
int inner = edge + radius;

void setup() {
  size(640, 280);
  noStroke(); 
  ellipseMode(RADIUS);
  rectMode(CORNERS);
}

void draw() { 

  background(0);

  // instruction

  smooth();
  fill(255);
  poopfont = loadFont("Helvetica.vlw");
  textFont(poopfont, 16);
  textAlign(LEFT);
  text("Move the red ball from one end of the rectangle to the other.", edge, 50);
  text("Try your best to keep the ball within the rectangle.", edge, 70);
  text("If need be, click to increase rectangle height.", edge, 200);

  // movement and easing

  if (abs(mouseX - mx) > 0.1) {
    mx = mx + (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }

  // the "constrained" area

  mx = constrain(mx, edge, width - edge);
  my = constrain(my, edge, 135+r);

  // white rect 

  fill(255);
  rect(edge, edge, width-edge, 135);

  rect(edge, edge, width-edge, 135+r);

  // red ball

  fill(255, 0, 0);  
  ellipse(mx, my, radius, radius);

  // increased rect and constrain height 

  if (mousePressed) {
    r*=1.1 ;
  }
}



