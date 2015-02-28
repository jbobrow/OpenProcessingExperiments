

size (300, 300); 
colorMode(RGB, 100); //Controls size and color scale
background(30);
smooth();

for (int x=45; x<width-10; x+=50) { //Controls the "left" (vertical) and "top" (horizontal) set of vertical and horizontal gridlines
  stroke(100);
  strokeWeight(1.5);
  line(x, 0, x, width);
  line(0, x, height, x);
}

for (int x=55; x<height-10; x+=50) { //Controls the "right" (vertical) and "bottom" (horizontal) set of vertical and horizontal gridlines
  stroke(100);
  line(x, 0, x, width);
  line(0, x, height, x);
}

for (int x=100; x<height-10; x+=100) { //Makes the top set of white rectangles
  stroke(100);
  strokeWeight(1.5);
  fill(30);
  rectMode(CENTER);
  rect(x, 200, 25, 25);
}

for (int x=100; x<height-10; x+=100) { //Makes the bottom set of white rectangles
  stroke(100);
  strokeWeight(1.5);
  fill(30);
  rectMode(CENTER);
  rect(x, 100, 25, 25);
}

for (int x=50; x<height-10; x+=100) { //Produces the Orange circle pattern
  stroke(30);
  strokeWeight(6);
  fill(95, 80, 30, 80);
  ellipse(x, 50, 25, 25);
  ellipse(50, x, 25, 25);
}


