
//variables
float radius, circleColor, rectAdjust, rectY;


void setup() {
  size(600, 300);

//intial values
  radius = 260.0;
  circleColor = 210;
  rectAdjust = 22.5;
  rectY = 20;
}

void draw() {
  background(255);
  smooth();
  
//first circle

    for ( int i = 0; i < 7; i++) {
    ellipseMode(CENTER);
    strokeWeight(2);
    fill(circleColor);
    ellipse(450, 150, radius, radius);
    radius = radius-36.5;
    circleColor = circleColor-28.5;
  }
  
//first rectangle

    for ( int i = 0; i < 12; i++) {
    rectMode(CORNER);
    fill(135);
    strokeWeight(2);
    rect(20, rectY, 260, 12);
    rectY = rectY + rectAdjust;
  }
  noLoop();
} 



