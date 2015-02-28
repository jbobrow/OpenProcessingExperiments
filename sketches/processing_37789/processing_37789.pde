
// Lecture 4.1 - Loops

size (300, 300);
smooth();
background(0);

// Loop for large square
for (int x=45; x< height-20; x+=70)
{
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(x, 45, 50, 50);
  rect(x, 115, 50, 50);
  rect(x, 185, 50, 50);
  rect(x, 255, 50, 50);
}

// Loop for grid
for (int i=-25; i< width; i+=70)
{
  // White lines
  stroke(0);
  stroke(255);
  line(i, 0, i, height);
  line(0, i, width, i);

  // Black grid
  stroke(0);
  strokeWeight(6);
  line(i, 20, i, 70);
  line(i, 90, i, 140);
  line(i, 160, i, 210);
  line(i, 230, i, 280);
  line(20, i, 70, i);
  line(90, i, 140, i);
  line(160, i, 210, i);
  line(230, i, 280, i);
}

 // Inner Square
 for (int x=45; x< height-20; x+=70)
{
  strokeWeight(1);
  fill(0);
  rect(x, 45, 15, 15);
  rect(x, 115, 15, 15);
  rect(x, 185, 15, 15);
  rect(x, 255, 15, 15);
}

// Inner grid
for (int i=-25; i< width; i+=70)
{
  stroke(255);
  strokeWeight(6);
  line(i, 40, i, 50);
  line(i, 110, i, 120);
  line(i, 180, i, 190);
  line(i, 250, i, 260);
  line(40, i, 50, i);
  line(110, i, 120, i);
  line(180, i, 190, i);
  line(250, i, 260, i);
}

// Yea, so I know I'm not using loops correctly, but I didn't know how to
// invert colors with the if() else() statement.

