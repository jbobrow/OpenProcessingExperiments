
// initialize image variables
PImage img1, img2, img3, img4, img5;

// other variables
color C, colorSelection; 
boolean effect; // 03

void setup() {
  size(400, 400);
  smooth();
  // load all images
  img1 = loadImage("gizmo.gif");
  img2 = loadImage("trees.png");
  img3 = loadImage("sheep.jpg");
  img4 = loadImage("candle.jpeg");
  img5 = loadImage("candleW.jpg");
}


void draw() {

  // **** 01 **** //

  if (mouseX < 200 && mouseY < 200) {
    // initialize a variable to hold the arc diameter
    float arcDiam;
    strokeWeight(1);

    // draw from 135 to 315 degrees
    for (float i=30; i<=100; i=i+2) {
      // measure the distance from the center
      arcDiam = 2*(dist(i, 200-i, 100, 100));
      // get the pixel color
      C = img1.get(int(i), 200-int(i));
      noFill();
      stroke(C);
      // draw the arc
      arc(100, 100, arcDiam, arcDiam, radians(135), radians(315));
    }

    // draw from -45 to 135 degrees
    for (float i=100; i<=170; i=i+2) {
      // measure the distance from the center
      arcDiam = 2*(dist(i, 200-i, 100, 100));
      // get the pixel color
      C = img1.get(int(i), 200-int(i));
      noFill();
      stroke(C);
      // draw the arc
      arc(100, 100, arcDiam, arcDiam, -1*radians(45), radians(135));
    }
  } 
  else {
    // reload the base image
    image(img1, 0, 0);
  }

  // **** 02 **** //

  if (mouseX > 200 && mouseY < 200) {
    fill(50, 255, 50);
    tint(255, 50);
    // apply threshold filter
    img2.filter(THRESHOLD);
    image(img2, 200, 0);
    // initialize random ellipse diameter
    int ellipseDiam = int(random(1, 15));
    // select black pixels and draw ellipses randomly
    for (int x=200; x<400; x = x + int(random(10, 20))) {
      for (int y=0; y<200; y = y + int(random(10, 20))) {
        C = get(x, y);
        if (C == -16777216) {
          ellipse(x, y, ellipseDiam, ellipseDiam);
        }
      }
    }
  } 
  else {
    // reload the base image
    image(img2, 200, 0);
  }

  // **** 03 **** //

  if (mouseX < 200 && mouseY > 200) {
    tint(255, 255);
    if(effect == false){
      img3.filter(INVERT);
      effect = true;
      image(img3, 0, 200);
    }
  }
  else {
    effect = false;
    image(img3, 0, 200);
  }

  // **** 04 **** //
  
  int transp = 50;
  
  if (mouseX > 200 && mouseY > 200) {
    tint(255, transp);
    image(img5, 200, 200);
    transp = transp+5;
  } 
  else {
    image(img4, 200, 200);
    transp = 0;
  }

} // end of draw function


