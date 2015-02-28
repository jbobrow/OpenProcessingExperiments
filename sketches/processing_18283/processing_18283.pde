
size(300, 300);

pushMatrix(); // save origin
  translate(50, 50);
  line(0, 0, 300, 0);
  line(0, 0, 0, 300);
  pushMatrix();
    translate(100, 0);
    ellipse(0, 0, 100, 100);
  popMatrix();
  ellipse(0, 0, 50, 50);
popMatrix(); // restore origin

// because we called pushMatrix in the beginning,
// with no translate applied, after popMatrix we're
// back to a fresh origin in the top left corner.
ellipse(0, 0, 25, 25);
