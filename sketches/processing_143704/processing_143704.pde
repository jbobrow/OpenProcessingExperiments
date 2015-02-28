
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #352 Orbital 
// http://geometrydaily.tumblr.com/post/38147826501/352-orbital-this-is-so-simple-just-a-bunch-of
//
// Keys:
// UP  - add one Orb.
// DOWN - remove one Orb 
//
/////////////////////////////////////////////////

int sw = 2;           
int sizeC = 600;
float diam = sizeC/1.8;
int iter = 13;
float C = PI*diam;
int bgColor = 235;

void setup() {
  size(sizeC, sizeC);
  noLoop();
}

void draw() {
  background(bgColor);
  noFill();

  stroke(#1E5F7C);
  strokeWeight(sw);  
  for (int i = 0; i<iter; ++i) {
    ellipse(width/2 + i*(diam/iter), height/2, diam, diam);
  }

  stroke(bgColor);
  noFill();
  strokeWeight(300);
  ellipse(width/2-7, height/2, diam+300, diam+300);

  paper();
}


void mousePressed() {
  redraw();
}

void keyPressed() {
  if (keyCode == UP) {
    iter++;
  }
  if (keyCode == DOWN) {
    iter--;
  }
  iter = constrain(iter, 9, 39);
  redraw();
}

void paper() {
  strokeWeight(1); 
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(130, 215), random(100, 170));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}
