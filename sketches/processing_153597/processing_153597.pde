
void setup() {
  size(600, 600);
  rectMode(CENTER);
  frameRate(10);
}

void draw() {
  background(215, 215, 255);
  smooth();
  noFill();
  //stroke(155);
  int field = width-width/8;
  rect(width/2, height/2, field, field);

  float qty = 5.0;
  float spacing = field/(qty + .1);

  fill(120, 60, 60, 200);
  noStroke();
  for (int j = 0; j < field; j += field/qty) {
    
    for (int i = 0; i < field; i += field/qty) {
      int colorSwitch =(int) random(1, 25);
      if (colorSwitch < 5) {
        fill(120, 0, 50, 200);
      } else {
        fill(120, 60, 60, 200);
      }
      rect((width/2 - field/(qty/2) + j)+random(-10, 10), 
           (width/2 - field/(qty/2) + i)+random(-10, 10), 
            spacing, spacing);
    }
  }
}


