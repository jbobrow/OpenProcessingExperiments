
// Justin Couch
// for D+M 7021
// Intro to Computational Design
// Exercise 1

size(640, 360);
background(35, 40, 50);
smooth();
noFill();
stroke(255);

// GRID CIRCLES //
int cols = 20;
int rows = 20;
for(int j=0; j<cols; j++){
  for(int i=0; i<rows; i++){
    strokeWeight(12);
    stroke(i*j/cols*rows, j*255/cols, i*255/rows, 50);
    fill(i*255/rows, j*255/cols, i*j/cols*rows, 50);
    ellipse((i+0.5)*width/rows, (j+0.5)*height/cols, 50, 50);
  }
}
noFill();

// CIRCLES //
float lastdia = width*2;
float diainc = .8;
for(int i=0; i<1000; i++){
  stroke(185-(115/1000 * i));
  strokeWeight(1.1 - i*.001);
  ellipse(width/2, height/2, lastdia, lastdia);
  ellipse(0, height/2, lastdia, lastdia);
  ellipse(width, height/2, lastdia, lastdia);
  lastdia = lastdia*diainc;
}

// RECT //
fill(68, 73, 85, 200);
noStroke();
rect(0, height/2, width, height/2);



// FANNING LINES //
float lastxl = width/2;
float lastxr = width/2;
float horinc = 100;
stroke(185);
strokeWeight(1);
line(width/2, height/2, width/2, height);
for(int i=0; i<1000; i++){
  stroke(185-(115/1000 * i));
  strokeWeight(1.1 - i*.001);
  line(width/2, height/2, lastxl - horinc, height);
  line(width/2, height/2, lastxr + horinc, height);
  lastxl = lastxl - horinc;
  lastxr = lastxr + horinc;
}

// HORIZONTAL LINES //
float ypos;
float lasty=height;
float inc = 32;
float incmult = 0.822;
for(int i=0; i<75; i++){
  stroke(185-(115/75 * i));
  strokeWeight(1.1 - i/75);
  ypos = lasty - inc;
  line(0, ypos, width, ypos);
  lasty = ypos;
  inc = inc*incmult;
}

// HORIZON //
stroke(255);
strokeWeight(2);
line(0, height/2, width, height/2);

// PENROSE TRIANGLE //
stroke(250);
strokeWeight(1);

// Right Side
fill(230);
beginShape();
vertex(331.6, 93.4);
vertex(420, 246.6);
vertex(246.2, 246.6);
vertex(277.7, 226.6);
vertex(385.4, 226.6);
vertex(308.5, 93.4);
endShape(CLOSE);

// Left Side
fill(180);
beginShape();
vertex(308.5, 93.4);
vertex(385.4, 226.6);
vertex(362.3, 226.6);
vertex(308.5, 133.4);
vertex(231.6, 266.6);
vertex(220, 246.6);
endShape(CLOSE);

// Bottom
fill(128);
beginShape();
vertex(308.5, 133.4);
vertex(320, 153.4);
vertex(266.2, 246.6);
vertex(420, 246.6);
vertex(408.5, 266.6);
vertex(231.6, 266.6);
endShape(CLOSE);



