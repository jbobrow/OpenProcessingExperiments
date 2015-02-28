

size(600, 600);
background(255);
strokeWeight(.75);
smooth();
noFill();

for (int x = 10; x<=600; x = x+5) {
  stroke(0, 150, 150,100);
  line (x, x/2, width, height);
  stroke(0, 25, 25,100);
  line (x/2, x, width, height);
  stroke(0, 150, 150,100);
  line (width, 0, x/2, x);
  stroke(0, 25, 25,100);
  line (0, height, x, x/2);
  stroke(0, 150, 150,100);
  line (width/2, 0, x/2, x);
  stroke(0, 25, 25,100);
  line (0, height/2, x, x/2);
}

endRecord(); //Keep this at the end.

