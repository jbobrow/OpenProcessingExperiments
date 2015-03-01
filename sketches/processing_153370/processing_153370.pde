

// redesignend rectangle in different line

void setup() {
  size(600, 600);
  background(#554C4C);
  noLoop();  // only execute the draw function once
  rectMode(CENTER); // set the rectangle drawing mode to specify the rectangle's centre
  noStroke();
}


void draw() {

  // row 1: pink
  fill(#D329D3);
  rect(150, 150, 100, 100);
  rect(300, 150, 100, 100);
  rect(450, 150, 100, 100);

  // row 2: green
  fill(#3CD329);
  ellipse(150, 300, 100, 100);
  ellipse(300, 300, 100, 100);
  ellipse(450, 300, 100, 100);

  // row 3: blue
  fill(#292FD3);
  rect(150, 450, 100, 100);
  rect(300, 450, 100, 100);
  rect(450, 450, 100, 100);
  
} // end draw



