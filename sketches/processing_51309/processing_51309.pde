
/*****************************************
 * Assignment 02
 * Name:         Warren Schwartz
 * E-mail:       wschwart@haverford.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2/7/12
 * 
 * This sketch depicts the horizon dividing
 the sky and the land. Clicking on the ground
 creates clumps of grass; clicking on the sky
 creates stars. I realize that stars do not
 scale in the same way that grass does in a
 perspective drawing, but, hey, they could also
 be snowflakes, and clouds seemed too obvious.
 ***********************************************/

//define variables
int horizon;
boolean sky;

void setup() {
  size(800, 600);
  //to test sketch at different resolutions or sizes:
  //size(int(random(500,screen.width)),int(random(500,screen.height)));

  //set variables

  //to test random horizons:
  //horizon = int(random(10,height-10));
  horizon = int(height/2);
  sky = true;

  //draw background and sky
  background(0, 20, 120);
  noStroke();
  fill(50, 100, 30);
  smooth();
  rect(0, horizon, width, height);
}

void draw() {
}

void mousePressed() {
  //see if mouse in sky or on ground
  if (mouseY >= horizon) {
    sky = false;
    //determine scale factor; draw grass
    float scaleFactor = ((mouseY - horizon) + 1) * 0.1;
    drawGrass(mouseX, mouseY, scaleFactor);
  }
  else {
    //determine scale factor; draw star
    float scaleFactor = ((horizon - mouseY) + 1) * 0.1;
    drawStar(mouseX, mouseY, scaleFactor);
  }
}

//define grass drawing function
void drawGrass(int x, int y, float scalefac) {
  float grassAngle = PI+PI/6;
  for (grassAngle = PI+PI/6; grassAngle < (2*PI)-PI/6; grassAngle += PI/6) {
    smooth();
    noStroke();
    fill(random(70, 90), random(120, 140), 50, 150);
    triangle(x-scalefac/3, y, x+scalefac/3, y, x+scalefac*cos(grassAngle), y+scalefac*sin(grassAngle));
  }
}

//define star drawing function
void drawStar(int x, int y, float scalefac) {
  float starAngle = 0.0;
  for (starAngle = 0; starAngle < 2*PI; starAngle += PI/4) {
    smooth();
    noStroke();
    fill(255, 255, 255);
    triangle(x+(scalefac/3)*cos(starAngle+(PI/2)), y+(scalefac/3)*sin(starAngle+(PI/2)), x+(scalefac/3)*cos(starAngle-(PI/2)), y+(scalefac/3)*sin(starAngle-(PI/2)), x+scalefac*cos(starAngle), y+scalefac*sin(starAngle));
  }
}


