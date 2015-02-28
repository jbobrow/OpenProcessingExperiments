
/** Tangram 2013/07/23 © by Peter Bosshard Schneider<br />
*   A simple tangram game<br />
*   Hover over the black square in the top left corner<br />
*   White activation circles occure. If you click on one of the circles<br />
*   the corresponding tangram shape is activated. You then can move it to another position<br />
*   and rotate it by 45 degrees by pressing the space bar. An other click deactivates it.<br />
*   press 'c' to reset all shapes to their original position in the top left corner.<br />
*   press 'b' to rotate the shape counterclockwise by 5 degrees.<br />
*   press 'n' to reset the rotation of the shape to 0 degrees.<br />
*   press 'm' to rotate the shape clockwise by 5 degrees.<br />
*   press 'l' to toggle the outline of the shapes. Have fun!
*/

TangramShape[] tangramset;
float tangramside;

void setup() {
  //size(displayWidth,displayHeight);
  size(500, 500);
  background(255);
  tangramside = height/2.0;
  tangramset = new TangramShape[7];
  tangramset[0] = new TangramShape(new PVector(tangramside/2.0, tangramside/4.0), tangramside, 0);
  tangramset[1] = new TangramShape(new PVector(tangramside/4.0*3.0, tangramside/2.0), tangramside, 0);
  tangramset[1].setRotation(HALF_PI);
  tangramset[2] = new TangramShape(new PVector(tangramside/8.0*3.0, tangramside/2.0), tangramside, 2);
  tangramset[3] = new TangramShape(new PVector(tangramside/4.0*3.0, tangramside/8.0*7.0), tangramside, 2);
  tangramset[3].setRotation(-HALF_PI);
  tangramset[4] = new TangramShape(new PVector(tangramside/8.0, tangramside/8.0*7.0), tangramside, 1);
  tangramset[5] = new TangramShape(new PVector(tangramside/2.0, tangramside/4.0*3.0), tangramside, 3);
  tangramset[6] = new TangramShape(new PVector(tangramside/8.0, tangramside/8.0*3.0), tangramside, 4);
} 

void draw() {
  background(255);
  for (int i=0;i<tangramset.length;i++) {
    tangramset[i].update(mouseX, mouseY);
    tangramset[i].display();
  }
}


void clear() { 
  tangramset[0].location = new PVector(tangramside/2.0, tangramside/4.0);
  tangramset[0].setRotation(0);
  tangramset[1].location = new PVector(tangramside/4.0*3.0, tangramside/2.0);
  tangramset[1].setRotation(HALF_PI);
  tangramset[2].location = new PVector(tangramside/8.0*3.0, tangramside/2.0);
  tangramset[2].setRotation(0);
  tangramset[3].location = new PVector(tangramside/4.0*3.0, tangramside/8.0*7.0);
  tangramset[3].setRotation(-HALF_PI);
  tangramset[4].location = new PVector(tangramside/8.0, tangramside/8.0*7.0);
  tangramset[4].setRotation(0);
  tangramset[5].location = new PVector(tangramside/2.0, tangramside/4.0*3.0);
  tangramset[5].setRotation(0);
  tangramset[6].location = new PVector(tangramside/8.0, tangramside/8.0*3.0);
  tangramset[6].setRotation(0);
}


void mouseReleased() {
  for (int i=0;i<tangramset.length;i++) {
    tangramset[i].click(mouseX, mouseY);
  }
}

void keyReleased() {
  if (key == ' ') {
    for (int i=0;i<tangramset.length;i++) {
      if (tangramset[i].selected) {
        tangramset[i].rotation+=PI/4.0;
      }
    }
  }
   if (key == 'b') {
    for (int i=0;i<tangramset.length;i++) {
      if (tangramset[i].selected) {
        tangramset[i].rotation-=PI/36.0;
      }
    }
  }
  if (key == 'n') {
    for (int i=0;i<tangramset.length;i++) {
      if (tangramset[i].selected) {
        tangramset[i].rotation = 0;
      }
    }
  }
  if (key == 'm') {
    for (int i=0;i<tangramset.length;i++) {
      if (tangramset[i].selected) {
        tangramset[i].rotation+=PI/36.0;
      }
    }
  }
  if (key == 'c') {
    clear();
  }
  if (key == 'l') {
    for (int i=0;i<tangramset.length;i++) {
      tangramset[i].showstroke = !tangramset[i].showstroke;
    }
  }
}

class TangramShape {
  PVector location;
  float rotation = 0;
  float squareside;
  float gridunit;
  int shapetype;
  boolean selected = false;
  boolean mouseover = false;
  boolean showstroke = true;

  TangramShape(PVector loc, float sqs, int typ) {
    location = loc;
    squareside = sqs;
    gridunit = squareside/8.0;
    shapetype = typ;
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(rotation);
    if (selected) {
      stroke(255, 0, 0);
      strokeWeight(2);
    }
    else {
      strokeWeight(1);
      if (showstroke) {
        stroke(255);
      }
      else {
        stroke(0);
      }
    }
    fill(0);
    switch(shapetype) {
    case 0: // Big triangle
      triangle(-4*gridunit, -2*gridunit, 4*gridunit, -2*gridunit, 0, 2*gridunit);
      if (mouseover) {
        stroke(255);
        ellipse(0, 0, gridunit, gridunit);
      }
      break;
    case 1: // Middle triangle
      triangle(-gridunit, -3*gridunit, 3*gridunit, gridunit, -gridunit, gridunit);
      if (mouseover) {
        stroke(255);
        ellipse(0, 0, gridunit, gridunit);
      }
      break;
    case 2: // Small triangle
      triangle(-gridunit, -2*gridunit, gridunit, 0, -gridunit, 2*gridunit);
      if (mouseover) {
        stroke(255);
        ellipse(0, 0, gridunit, gridunit);
      }
      break;
    case 3:  // Square
      quad(-2*gridunit, 0, 0, -2*gridunit, 2*gridunit, 0, 0, 2*gridunit);
      if (mouseover) {
        stroke(255);
        ellipse(0, 0, gridunit, gridunit);
      }
      break;
    case 4:  // Rhomboid
      quad(-gridunit, -3*gridunit, gridunit, -gridunit, gridunit, 3*gridunit, -gridunit, gridunit);
      if (mouseover) {
        stroke(255);
        ellipse(0, 0, gridunit, gridunit);
      }
      break;
    }
    popMatrix();
  }

  void setRotation(float rot) {
    rotation = rot;
  }

  void update(float x, float y) {
    if (dist(x, y, location.x, location.y) < 2*gridunit) {
      mouseover = true;
    }
    else {
      mouseover = false;
    }
    if (selected) {
      location.x = x;
      location.y = y;
    }
  }

  void click(float x, float y) {
    switch(shapetype) {
    case 0: // Big triangle
      if (dist(x, y, location.x, location.y) < gridunit) {
        selected = !selected;
      }
      break;
    case 1: // Middle triangle
      if (dist(x, y, location.x, location.y) < gridunit) {
        selected = !selected;
      }
      break;
    case 2: // Small triangle
      if (dist(x, y, location.x, location.y) < gridunit) {
        selected = !selected;
      }
      break;
    case 3:  // Square
      if (dist(x, y, location.x, location.y) < gridunit) {
        selected = !selected;
      }
      break;
    case 4:  // Rhomboid
      if (dist(x, y, location.x, location.y) < gridunit) {
        selected = !selected;
      }
      break;
    }
  }
}



