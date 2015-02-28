
// a design based off of the current shirt i am wearing

void setup() {
  size(400, 400);
  smooth();
  colorMode(RGB, height);
}

void draw() {
  for (int p=0; p<height; p++) {
    for (int g=0; g<width; g++) {
      stroke(height-g, 0, g);
      point(p, g);
      //this is the color gradient i was looking for
    }
  }

  for (int a=35; a<height; a+=55) {
    for (int b=35; b<width; b+=55) { 
      sun(a, b); 
      //this repeats the sun on a grid
    }
  }
  noLoop();
}

void sun(float x, float y) {  //this function contains the repeating sun graphic
  pushMatrix();
  translate(x, y);

  strokeWeight(2);
  rectMode(CENTER);

  noStroke();
  rect(0, 0, 15, 50);
  rect(0, 0, 50, 15);

  stroke(height-y, 0, y, 230);  //to make the line match the background
  line(4, -25, 4, 25);
  line(-4, -25, -4, 25);
  line(-25, 4, 25, 4);
  line(-25, -4, 25, -4);

  rotate(radians(45));  //to make the diagnoal rectangles


  noStroke();
  rect(0, 0, 15, 50);
  rect(0, 0, 50, 15);

  stroke(height-y, 0, y, 230);  //to make the line match the background
  line(4, -25, 4, 25);
  line(-4, -25, -4, 25);
  line(-25, 4, 25, 4);
  line(-25, -4, 25, -4);

  ellipse(0, 0, 36, 36);  //circle on top
  popMatrix();
}



