
//This one doesn't tell time at all.  
//Now with curvevertices instead of a million ellipses.
//faster and nicer.

int counter = 0;
int colorCounter = 0;
float colorCounter2 = 100;

void setup() {
  background (0);
  smooth();
  size(500, 500);
 
  colorMode(HSB);
 
}

void draw() {

  counter+=1;
  if (counter > 359) {
    counter = 0;
  }

  colorCounter+=1;
  if (colorCounter > 255) {
    colorCounter = 0;
  }

  colorCounter2 -=1.5;
  if ( colorCounter2 < 0) {
    colorCounter2 = 255;
  }

  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  // make six spirals in each direction 
  for (int i = 0; i < 6; i++) {
    spiral(i*60+counter, color(colorCounter, 255, 255, 100), width/2, height/2, false);  // arms spaced every 60 degrees
    spiral(i*72+counter, color(colorCounter2, 255, 255, 100), width/2, height/2, true);  // arms spaced every 90 degrees
  }
}

// this function wants a starting angle, fill color, center x and y and a boolean for direction
void spiral(float angle, color clockColor, float centerX, float centerY, boolean clockwise) {
  fill(clockColor);  

  float degree = angle;
  int direction = -1;
  if (clockwise) {
    direction = 2;
  } 
  float x,y;

  noFill();
  stroke(clockColor);
  strokeWeight(5);

  beginShape();
  curveVertex(centerX, centerY);
  curveVertex(centerX, centerY);
  
  /* a spiral is calculated using radial coordinates 
    ie: radius and angle instead of x and y.
    x = radius * cos(angle)
    y = radius * sin(angle)
    
    In a spiral, radius and angle are both increasing with i
  */

  for (int i = 0; i < 720; i+= 30) {
    x = i/2 * cos ( radians(angle+i)) * direction;   
    y = i/2 * sin (radians(angle+i));
    curveVertex (x+centerX, y+centerY);
  }
  endShape();
}


