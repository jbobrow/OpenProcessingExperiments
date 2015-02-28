
boolean julian = true;

void setup() {
  size(300, 300);
  rectMode(CORNERS);
  background(255);
}

void draw() {

  if (julian) {
    PImage Truck;
    Truck = loadImage("http://i.imgur.com/5q1bA.jpg");
    background(Truck);
    //original image
  }
  else {
    background(255);
    stroke(200);
    strokeWeight(1);
    smooth();

    line(width/(6), 0, width/(6), height);        // the superfluous 
    line(width/(3), 0, width/(3), height);        // parentheses help
    line((width*2)/3, 0, (width*2)/3, height);    // me read numerical
    line((width*5)/6, 0, (width*5)/6, height);    // differences easier.
    // dividing vertically into sixths

    line(width/(4), 0, width/(4), height);
    line(width/(2), 0, width/(2), height);
    line((width*3)/4, 0, (width*3)/4, height);
    // dividing vertically into fourths

    line(0, height/(6), width, height/(6));
    line(0, height/(3), width, height/(3));
    line(0, (height*2)/3, width, (height*2)/3);
    line(0, (height*5)/6, width, (height*5)/6);
    // dividing horizontally into sixths

    line(0, height/(4), width, height/(4));
    line(0, height/(2), width, height/(2));
    line(0, (height*3)/4, width, (height*3)/4);
    // dividing horizontally into fourths

    fill(0);
    rect(width/(6), height/(2), width/(3), height);
    // black rectangle, bottom left

      fill(250);
    stroke(0);
    rect(width/(2), (height*2)/3, (width*2)/3, (height*5)/6);
    // square, off-center right

    fill(0, 125, 0, 200);
    noStroke();
    rect(width/(12), (height*3)/4, (width*5)/6, ((height*3)/4)-6);
    // green stroke

    ellipseMode(CENTER);
    ellipse(width/(3), (height*3)/4, 50, 50);
    // green ellipse, larger

    ellipseMode(CORNERS);
    ellipse(width/6, (height*3)/4, width/4, (height*5)/6);
    // green ellipse, bottom left

    ellipse((width*3)/4, (height*3)/4, (width*5)/6, (height*5)/6);
    // green ellipse, bottom right

    stroke(0);
    strokeWeight(2);
    line(width/12, (height*5)/6, width, (height*5)/6);
    line((width*11)/12, 0, (width*11)/12, height);
    // black strokes

    noFill();
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(width/2, (height*5)/6, (width*2)/3, (height*2)/3);
    //largest ellipse
  }
}

void mousePressed() {
  if (julian) {
    julian = false;
  }
  else {
    julian = true;
  }
}

